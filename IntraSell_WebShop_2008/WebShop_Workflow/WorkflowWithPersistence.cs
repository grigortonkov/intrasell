using System;
using System.Collections.ObjectModel;

using System.Collections.Generic;
using System.Configuration;
using System.Threading;
using System.Workflow.Activities;
using System.Workflow.Runtime;
using System.Workflow.Runtime.Hosting;
using System.Workflow.ComponentModel.Serialization;


namespace IntraSell
{
    public class WorkflowWithPersistence
    {

 

        public static string ConnString()
        {
         
                return ConfigurationManager.ConnectionStrings["honoConnectionString"].ConnectionString;
         
        }


        static private AutoResetEvent waitHandle = new AutoResetEvent(false);


 
        private static WorkflowRuntime workflowRuntime;

        public static WorkflowRuntime WorkflowRuntime
        {
            get { return WorkflowWithPersistence.workflowRuntime; }
            set { WorkflowWithPersistence.workflowRuntime = value; }
        }
        private static FreigabeService externalEventsProcessing;

        public static void Initialize(string connString)
        {
            if (workflowRuntime == null) 
                workflowRuntime = new WorkflowRuntime();
           // using ( workflowRuntime = new WorkflowRuntime())
            {
                //Add the persistence service
                PersitenceService persist = new PersitenceService(
                    ConnString(),
                    true,
                    new TimeSpan(0, 0, 20),
                    new TimeSpan(0, 0, 5));
                workflowRuntime.AddService(persist);

                #region Respond to workflow runtime events
                workflowRuntime.WorkflowLoaded += new EventHandler<WorkflowEventArgs>(workflowRuntime_WorkflowLoaded);
                workflowRuntime.WorkflowUnloaded += new EventHandler<WorkflowEventArgs>(workflowRuntime_WorkflowUnloaded);

                workflowRuntime.WorkflowPersisted += new EventHandler<WorkflowEventArgs>(workflowRuntime_WorkflowPersisted);
                workflowRuntime.WorkflowCompleted += delegate(object sender, WorkflowCompletedEventArgs e) { waitHandle.Set(); };
                workflowRuntime.WorkflowTerminated += delegate(object sender, WorkflowTerminatedEventArgs e)
               
                
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine(e.Exception.Message);
                    waitHandle.Set();
                };


                #endregion Respond to workflow runtime events
 
                //register to listen to events 
                ExternalDataExchangeService dataExchangeService;
                dataExchangeService = new ExternalDataExchangeService();
                workflowRuntime.AddService(dataExchangeService);
                externalEventsProcessing = new FreigabeService();
                dataExchangeService.AddService(externalEventsProcessing);

                //Wait until the workflow is completed, terminated, or persisted
                if (false) 
                    waitHandle.WaitOne();

                //Console.WriteLine("Press <ENTER> to shut down the host.");
                //Console.ReadLine();
            }
        }

        /// <summary>
        /// Start the Freigabe Workflow 
        /// </summary>
       public  static Guid  startWorkflow(int objectId, string objectType, Person worker, Person customer, Person[] AdditionalPersons, 
           string LinkConfirm, string LinkReject, string subject) {
            //using (workflowRuntime)
            {
       
                    //Pass parameters to each workflow.
                    Dictionary<string, object> wfParams = new Dictionary<string, object>();
                   
                   
                    wfParams.Add("OrderNumber", objectId);
                    wfParams.Add("OrderType", objectType);
                    wfParams.Add("StartTime", DateTime.Now);

                    wfParams.Add("Mitarbeiter", worker);
                    wfParams.Add("Customer", customer);

                    if (AdditionalPersons != null)
                        wfParams.Add("AdditionalPersons", AdditionalPersons);
                    else
                        wfParams.Add("AdditionalPersons", new Person[0]);

                    wfParams.Add("LinkConfirm", LinkConfirm);
                    wfParams.Add("LinkReject", LinkReject);
                    wfParams.Add("Subject", subject);

                    WorkflowInstance instance = workflowRuntime.CreateWorkflow(typeof(IntraSell.Freigabe), wfParams);
                    instance.Start();
                    return instance.InstanceId;
                //}
            }
        }

       public static int getWorkflowsCount()
       {
           return workflowRuntime.GetLoadedWorkflows().Count; 
       }

       public static List<WorklistEntry> getWorklist()
       {
 

           workflowRuntime.StartRuntime();


           PersitenceService persist = workflowRuntime.GetService<PersitenceService>();
           IEnumerable<SqlPersistenceWorkflowInstanceDescription> list = persist.GetAllWorkflows();
           List<WorklistEntry> listWFL = new List<WorklistEntry>();


           foreach (SqlPersistenceWorkflowInstanceDescription d in list)
           {
               
               
               WorkflowInstance ins = workflowRuntime.GetWorkflow(d.WorkflowInstanceId); 
               ins.Unload();
               
             ////  ins.Resume();


             //  ReadOnlyCollection<WorkflowQueueInfo> wqi = ins.GetWorkflowQueueData();
             //  foreach (WorkflowQueueInfo q in wqi)
             //  {
             //      EventQueueName eq = q.QueueName as EventQueueName;
             //      if (eq != null)
             //      {
             //          // get activity that is waiting for event
             //          ReadOnlyCollection<string> blockedActivity = q.SubscribedActivityNames;
             //          Console.WriteLine("Host: Workflow is blocked on " + blockedActivity[0]);

             //          // this event is never going to arrive eg. employee left the company
             //          // lets send an exception to this queue
             //          // it will either be handled by exception handler that was modeled in workflow
             //          // or the runtime will unwind running compensation handlers and exit the workflow
             //          Console.WriteLine("Host: This event is not going to arrive");
             //          Console.WriteLine("Host: Cancel workflow with unhandled exception");
 
             //      }
             //  }



               Freigabe f ;//= ins.GetWorkflowDefinition() as Freigabe;
               f = persist.LoadWorkflowInstanceState(d.WorkflowInstanceId) as Freigabe; 
               
               //persist.L
          // ( persist as WorkflowPersistenceService ).
               
               WorklistEntry entry = new WorklistEntry();
               entry.InstanceGuid = d.WorkflowInstanceId; 
               entry.ObjectId = f.OrderNumber;
               entry.ObjectType = f.OrderType;
               entry.TaskURL = f.LinkConfirm;
               entry.Task = f.CurrentTask; 
               entry.Person = f.CurrentPerson;
               entry.Status = d.Status.ToString();
               WorkflowStatus s = d.Status; 
               

               listWFL.Add(entry);
           }
           return listWFL;
       }


       /// <summary>
       /// 
       /// </summary>
       /// <param name="processId"></param>
       public static void setApproved(Guid processId, string message) 
       {
           workflowRuntime.StartRuntime();
           externalEventsProcessing.SetApproved(processId, message);
       }


       /// <summary>
       /// 
       /// </summary>
       /// <param name="processId"></param>
       public static void setDisagreed(Guid processId, string message)
       {
           workflowRuntime.StartRuntime();
           externalEventsProcessing.SetDisagreed(processId, message);
       }

        /// <summary>
        /// set db connection
        /// </summary>
        /// <returns></returns>
       //public static WorkflowBLL getBllInstance()
       //{

       //    WorkflowBLL bll = new WorkflowBLL();
       //    bll.setWorkflowBLLConnection(ConnString());
       //    return bll; 
       //}
 
       #region Respond to workflow runtime events
       static void workflowRuntime_WorkflowPersisted(object sender, WorkflowEventArgs e)
        {
            waitHandle.Set();
        }

        static void workflowRuntime_WorkflowCompleted(object sender, WorkflowCompletedEventArgs e)
        {
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("\tWorkflow {0} completed", e.WorkflowInstance.InstanceId.ToString());
        }

        static void workflowRuntime_WorkflowUnloaded(object sender, WorkflowEventArgs e)
        {
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("\tWorkflow {0} unloaded", e.WorkflowInstance.InstanceId.ToString());
        }

        static void workflowRuntime_WorkflowLoaded(object sender, WorkflowEventArgs e)
        {
            

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("\tWorkflow {0} loaded", e.WorkflowInstance.InstanceId.ToString());
        }

       #endregion 

        /// <summary>
         /// Test Methods of this engine in the console 
         /// </summary>
         /// <param name="args"></param>
        static void Main(string[] args)
        {
                WorkflowWithPersistence.Initialize(ConnString());
                Person p  = new Person("1", "grigor.tonkov@gmail.com");
                string linkConfirm = "";
                string linkReject = "";
                Guid processId = WorkflowWithPersistence.startWorkflow(1, "GoalAchievement", p, p, null, linkConfirm,linkReject, "my subject");

                Console.WriteLine("Press <ENTER> to send event to the workflow.");
                Console.ReadLine();
                WorkflowWithPersistence.setApproved(processId, "Test message!");

                Console.WriteLine("Press <ENTER> to shut down the host.");
                Console.ReadLine();
        }


    }
}