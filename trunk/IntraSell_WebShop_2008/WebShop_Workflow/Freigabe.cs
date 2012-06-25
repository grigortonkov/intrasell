using System;
using System.ComponentModel;
using System.Linq;
using System.Workflow.Activities;
using System.Workflow.ComponentModel;
using System.Workflow.Runtime;
using log4net;

namespace IntraSell
{
    public sealed partial class Freigabe : SequentialWorkflowActivity
    {
        const string WORKLFOW_EMAIL = "honoworkflow_donotrespond@griton.eu";
        const string BEGIN_TAG = "<BEGIN></BEGIN>";

        private static readonly ILog log = LogManager.GetLogger(typeof(Freigabe));


        public Freigabe()
        {
            InitializeComponent();
        }

        #region DependencyProperty
        public static DependencyProperty handleExternalEventActivity1_Invoked1Event = DependencyProperty.Register("handleExternalEventActivity1_Invoked1", typeof(System.EventHandler<System.Workflow.Activities.ExternalDataEventArgs>), typeof(IntraSell.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Handler")]
        public event EventHandler<ExternalDataEventArgs> handleExternalEventActivity1_Invoked1
        {
            add
            {
                base.AddHandler(handleExternalEventActivity1_Invoked1Event, value);
            }
            remove
            {
                base.RemoveHandler(handleExternalEventActivity1_Invoked1Event, value);
            }
        }

        public static DependencyProperty handleExternalEventActivity1_Roles1Property = DependencyProperty.Register("handleExternalEventActivity1_Roles1", typeof(System.Workflow.Activities.WorkflowRoleCollection), typeof(IntraSell.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Aktivität")]
        public WorkflowRoleCollection handleExternalEventActivity1_Roles1
        {
            get
            {
                return ((System.Workflow.Activities.WorkflowRoleCollection)(base.GetValue(IntraSell.Freigabe.handleExternalEventActivity1_Roles1Property)));
            }
            set
            {
                base.SetValue(IntraSell.Freigabe.handleExternalEventActivity1_Roles1Property, value);
            }
        }

        public static DependencyProperty handleAccepted3_sender1Property = DependencyProperty.Register("handleAccepted3_sender1", typeof(System.Object), typeof(IntraSell.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Parameters")]
        public Object handleAccepted3_sender1
        {
            get
            {
                return ((object)(base.GetValue(IntraSell.Freigabe.handleAccepted3_sender1Property)));
            }
            set
            {
                base.SetValue(IntraSell.Freigabe.handleAccepted3_sender1Property, value);
            }
        }

        public static DependencyProperty handleAccepted3_Roles1Property = DependencyProperty.Register("handleAccepted3_Roles1", typeof(System.Workflow.Activities.WorkflowRoleCollection), typeof(IntraSell.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Activity")]
        public WorkflowRoleCollection handleAccepted3_Roles1
        {
            get
            {
                return ((System.Workflow.Activities.WorkflowRoleCollection)(base.GetValue(IntraSell.Freigabe.handleAccepted3_Roles1Property)));
            }
            set
            {
                base.SetValue(IntraSell.Freigabe.handleAccepted3_Roles1Property, value);
            }
        }

        public static DependencyProperty handleAccepted3_Invoked1Event = DependencyProperty.Register("handleAccepted3_Invoked1", typeof(System.EventHandler<System.Workflow.Activities.ExternalDataEventArgs>), typeof(IntraSell.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Handlers")]
        public event EventHandler<ExternalDataEventArgs> handleAccepted3_Invoked1
        {
            add
            {
                base.AddHandler(handleAccepted3_Invoked1Event, value);
            }
            remove
            {
                base.RemoveHandler(handleAccepted3_Invoked1Event, value);
            }
        }


        #endregion DependencyProperty

        #region  Properties
        public int OrderNumber
        {
            get { return (int)GetValue(OrderNumberProperty); }
            set { SetValue(OrderNumberProperty, value); }
        }
        public static readonly DependencyProperty OrderNumberProperty =
            DependencyProperty.Register("OrderNumber", typeof(int), typeof(Freigabe));

        public string OrderType
        {
            get { return (string)GetValue(OrderTypeProperty); }
            set { SetValue(OrderTypeProperty, value); }
        }
        public static readonly DependencyProperty OrderTypeProperty =
            DependencyProperty.Register("OrderType", typeof(string), typeof(Freigabe));

        /// <summary>
        /// Workflow Start 
        /// </summary>
        public DateTime StartTime
        {
            get { return (DateTime)GetValue(StartTimeProperty); }
            set { SetValue(StartTimeProperty, value); }
        }
        public static readonly DependencyProperty StartTimeProperty =
            DependencyProperty.Register("StartTime", typeof(DateTime), typeof(Freigabe));

        /// <summary>
        /// Workflow End 
        /// </summary>
        public DateTime? EndTime
        {
            get
            {
                if (GetValue(EndTimeProperty) == null)
                    return null;
                else
                    return (DateTime)GetValue(EndTimeProperty);
            }
            set { SetValue(EndTimeProperty, value); }
        }
        public static readonly DependencyProperty EndTimeProperty =
            DependencyProperty.Register("EndTime", typeof(DateTime?), typeof(Freigabe));


        public string RejectReason
        {
            get { return (string)GetValue(RejectReasonProperty); }
            set { SetValue(RejectReasonProperty, value); }
        }
        public static readonly DependencyProperty RejectReasonProperty =
            DependencyProperty.Register("RejectReason", typeof(string), typeof(Freigabe));

        public string Subject
        {
            get { return (string)GetValue(SubjectProperty); }
            set { SetValue(SubjectProperty, value); }
        }
        public static readonly DependencyProperty SubjectProperty =
            DependencyProperty.Register("Subject", typeof(string), typeof(Freigabe));




        #endregion

        #region Current

        //CurrentPerson
        public Person CurrentPerson
        {
            get { return (Person)GetValue(CurrentPersonProperty); }
            set { SetValue(CurrentPersonProperty, value); }

        }

        public static readonly DependencyProperty CurrentPersonProperty =
            DependencyProperty.Register("CurrentPerson", typeof(Person), typeof(Freigabe));


        //CallingPerson
        public Person CallingPerson
        {
            get { return (Person)GetValue(CallingPersonProperty); }
            set { SetValue(CallingPersonProperty, value); }

        }
        public static readonly DependencyProperty CallingPersonProperty =
            DependencyProperty.Register("CallingPerson", typeof(Person), typeof(Freigabe));




        public string CurrentTask
        {
            get { return (string)GetValue(CurrentTaskProperty); }
            set { SetValue(CurrentTaskProperty, value); }
        }
        public static readonly DependencyProperty CurrentTaskProperty =


            DependencyProperty.Register("CurrentTask", typeof(string), typeof(Freigabe));


        #endregion

        #region Persons in workflow


        //Mitarbeiter
        public Person Mitarbeiter
        {
            get { return (Person)GetValue(MitarbeiterProperty); }
            set { SetValue(MitarbeiterProperty, value); }
        }

        public static readonly DependencyProperty MitarbeiterProperty =
            DependencyProperty.Register("Mitarbeiter", typeof(Person), typeof(Freigabe));



        //Customer
        public Person Customer
        {
            get { return (Person)GetValue(CustomerProperty); }
            set { SetValue(CustomerProperty, value); }
        }
        public static readonly DependencyProperty CustomerProperty =
            DependencyProperty.Register("Customer", typeof(Person), typeof(Freigabe));


        //AdditionalPersons
        public Person[] AdditionalPersons
        {
            get { return (Person[])GetValue(AdditionalPersonsProperty); }
            set { SetValue(AdditionalPersonsProperty, value); }
        }
        public static readonly DependencyProperty AdditionalPersonsProperty =
            DependencyProperty.Register("AdditionalPersons", typeof(Person[]), typeof(Freigabe));



        #endregion Persons in workflow

        #region Links in workflow
        //LinkConfirm
        public string LinkConfirm
        {
            get { return (string)GetValue(LinkConfirmProperty); }
            set { SetValue(LinkConfirmProperty, value); }
        }
        public static readonly DependencyProperty LinkConfirmProperty =
            DependencyProperty.Register("LinkConfirm", typeof(string), typeof(Freigabe));

        //LinkReject
        public string LinkReject
        {
            get { return (string)GetValue(LinkRejectProperty); }
            set { SetValue(LinkRejectProperty, value); }
        }
        public static readonly DependencyProperty LinkRejectProperty =
            DependencyProperty.Register("LinkReject", typeof(string), typeof(Freigabe));
        #endregion Links in workflow

        #region Mails




        /// <summary>
        /// Create task in the person worklist 
        /// </summary>
        /// <param name="p">Person who gets the task</param>
        private void CreateTask(Person p)
        {
            CurrentPerson = p;

            string taskURL = LinkConfirm;
            taskURL += "&WorkflowGUID=" + this.WorkflowInstanceId.ToString();
            taskURL += "&ResponseGUID=" + Guid.NewGuid(); //unique Id for the response 

        }

        /// <summary>
        /// Send final mail for rejected workflow
        /// </summary>
        /// <param name="p"></param>
        private void SendMailRejection(Person p)
        {

            String mailtext = MakeMailText(true, true);

            Mailer.Mail(
                WORKLFOW_EMAIL,
                p.Email,
               (p == Mitarbeiter ? "Ablehnung für Ihre " : "Ablehnung für eine ") ,
                mailtext);
        }

        /// <summary>
        /// Send final mail for released workflow
        /// </summary>
        /// <param name="p"></param>
        private void SendMailReleased(Person p)
        {

            String mailtext = MakeMailText(true, false);

            Mailer.Mail(
                 WORKLFOW_EMAIL,
                 p.Email,
                (p == Mitarbeiter ? "Hono-Abschluss für Ihre " : "Hono-Abschluss für eine ")  ,
                 mailtext);
        }


 

        private void FreigabeMailAddPers_ExecuteCode(object sender, EventArgs e)
        {

            CurrentPerson = AdditionalPersons[GetNextAddPersonIndex()];
            log.Debug("Next add Person is : " + CurrentPerson.Email);
            CreateTask(CurrentPerson);

        }

        /// <summary>
        /// Make mail text 
        /// </summary>
        /// <param name="istWorkflowFinish"></param>
        /// <param name="isAblehnung"></param>
        /// <returns></returns>
        private string MakeMailText(bool istWorkflowFinish, bool isAblehnung)
        {
            string txt = "";
            txt += "\n<html>";
            txt += "\n<body style='font-family: Verdana; font-size: 10pt'>";
            txt += "\n</body>";
            txt += "\n</html>";
            txt = txt.Replace("\n", "\r\n");
            return txt;
        }
        #endregion

        #region Status


        private void StatusNew_ExecuteCode(object sender, EventArgs e)
        {
            log.Debug("StatusNew_ExecuteCode");
            IntraSellProxy.SETVARVALUE("CALL FROM WORKFLOW", "DONE");
            string res = IntraSellProxy.firstRow("select count(*) from buchRechnung");

            IntraSellProxy.SETVARVALUE("CALL FROM WORKFLOW", res);

            //TODO test BLL Connection 
            StartTime = DateTime.Now;
            //WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex, this.InstanceType, "Workflow", (int)ApprovalLevel.New, this.WorkflowInstanceId);
        }

        private void StatusReleased_ExecuteCode(object sender, EventArgs e)
        {
            log.Debug("StatusReleased_ExecuteCode");
            Release();
        }



        /// <summary>
        /// Workflow Finished 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void WorkflowFinished_ExecuteCode(object sender, EventArgs e)
        {
            //NOTHING to DO 
        }

        # region Mitarbeiter

        private void FreigabeMailMitarbeiter_ExecuteCode(object sender, EventArgs e)
        {
            CreateTask(Mitarbeiter);


            //Console.WriteLine("First activity for workflow {0} with index {1} started at {2}",
            //                    WorkflowEnvironment.WorkflowInstanceId.ToString(),
            //                    InstanceIndex,
            //                    StartTime.ToLongTimeString());
        }

        private void StatusMitarbeieter_ExecuteCode(object sender, EventArgs e)
        {
            Mitarbeiter.ResponseDate = DateTime.Now;
        }

        private void StatusRejectMitarbeiter_ExecuteCode(object sender, EventArgs e)
        {
            Reject();
        }


        /// <summary>
        /// Release the Workflow 
        /// </summary>
        private void Release()
        {
            log.Debug("StatusReleased_ExecuteCode");

            EndTime = DateTime.Now;

            //WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex,
            //    this.InstanceType, "Workflow",
            //    (int)ApprovalLevel.Released, this.WorkflowInstanceId);


            //Remove Tasks
            //WorkflowWithPersistence.getBllInstance().CreateWorkitem(this.WorkflowInstanceId, this.InstanceIndex, this.InstanceType,
            //    System.Convert.ToInt32(0), "-", "-", "-", true, false)

            //Send mail to all participants that the workflow was released


            if (Mitarbeiter.Participates)
                SendMailReleased(Mitarbeiter);

            String mailtext = MakeMailText(true, false);
            //Create finished Task to have the rejected reason saved 
            //WorkflowWithPersistence.getBllInstance().CreateWorkitem(WorkflowInstanceId, InstanceIndex, InstanceType,
            //    System.Convert.ToInt32(CurrentPerson.PersonID),
            //    MakeMailSubject(), mailtext, "_new", false, true);
        }


        /// <summary>
        /// Activities after rejections / same for all persons
        /// </summary>
        private void Reject()
        {
            log.Debug("Reject");

            EndTime = DateTime.Now;

            //Send mail to all participants that the workflow was rejected


            if (Mitarbeiter.Participates && Mitarbeiter.ResponseDate != null)
                SendMailRejection(Mitarbeiter);

            foreach (Person adPerson in AdditionalPersons)
                if (adPerson.Participates && adPerson.ResponseDate != null)
                    SendMailRejection(adPerson);

            String mailtext = MakeMailText(true, true);

            RemoveTasks(mailtext);

            //Cancel Workflow 
            throw new Exception("Workflow cancelled!");

        }


        #endregion Mitarbeiter
 

        #endregion

        #region Event handling
        void approveEvent_Invoked(object sender, ExternalDataEventArgs e)
        {
            // this.reportResult = "Report Approved";
        }

        private void delayActivity5Sek_InitializeTimeoutDuration(object sender, EventArgs e)
        {
            log.Debug("delayActivity_InitializeTimeoutDuration");
        }


        private void codeActivityRemovePMTask_ExecuteCode(object sender, EventArgs e)
        {
            RemoveTasks("-");
        }

        private void RemoveTasks(string mailText)
        {
            ////Remove Tasks
            //WorkflowWithPersistence.getBllInstance().CreateWorkitem(this.WorkflowInstanceId, this.InstanceIndex, this.InstanceType,
            //    System.Convert.ToInt32(0), "-", mailText, "-", true, true);
        }
        #endregion

        #region Accepted


        private void handleAcceptedHR_Invoked(object sender, ExternalDataEventArgs e)
        {
            CallingPerson = new Person();
            CallingPerson.PersonID = (e as DocumentProcessedEventArgs).Message;
        }

        private void handleAcceptedCO_Invoked(object sender, ExternalDataEventArgs e)
        {
            CallingPerson = new Person();
            CallingPerson.PersonID = (e as DocumentProcessedEventArgs).Message;
        }

        private void handleAcceptedPM_Invoked(object sender, ExternalDataEventArgs e)
        {

        }


        #endregion

        #region Rejection

        private void handleRejected_Invoked(object sender, ExternalDataEventArgs e)
        {
            this.RejectReason = (e as DocumentProcessedEventArgs).Message;
        }

        private void handleRejectedPM_Invoked(object sender, ExternalDataEventArgs e)
        {
            CurrentPerson.ResponseDate = DateTime.Now;
            this.RejectReason = (e as DocumentProcessedEventArgs).Message;
            Reject();
        }

        private void handleRejectedHR_Invoked(object sender, ExternalDataEventArgs e)
        {
            this.RejectReason = (e as DocumentProcessedEventArgs).Message;
        }



        private void handleRejectCO_Invoked(object sender, ExternalDataEventArgs e)
        {
            this.RejectReason = (e as DocumentProcessedEventArgs).Message;
        }
        #endregion

        #region AdditionalPersons
        public bool isLastAdditionalPersonReady()
        {
            return (AdditionalPersons[AdditionalPersons.Length - 1].ResponseDate == null); //last have not responded 
        }

        private void StatusAddPers_ExecuteCode(object sender, EventArgs e)
        {
            CurrentPerson.ResponseDate = DateTime.Now;
            // AdditionalPersons[GetNextAddPersonIndex()].ResponseDate = DateTime.Now;
            //WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex,
            //    this.InstanceType, "Workflow",
            //    (int)ApprovalLevel.ApprovedAdditionalPerson,
            //    this.WorkflowInstanceId);
        }

        private void nextPerson_ExecuteCode(object sender, EventArgs e)
        {
            GetNextAddPersonIndex();
        }

        /// <summary>
        /// Get the next person in the additional persons
        /// </summary>
        /// <returns></returns>
        private int GetNextAddPersonIndex()
        {
            int i = 0;
            int countResponders = 0;

            for (i = 0; i < AdditionalPersons.Length; i++)
                if (AdditionalPersons[i].ResponseDate != null)
                {
                    countResponders += 1;
                }
            log.Debug("Next Addi is :" + countResponders);

            return countResponders;
        }
        #endregion

        private void SendMail_ExecuteCode(object sender, EventArgs e)
        {
            String body = "TEST"; 
            Mailer.Mail("grigor.tonkov@gmail.com", "grigor.tonkov@gmail.com", "You got an order", body); 
        }

    }

}
