using System;
using System.Collections;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Drawing;
using System.Linq;
using System.IO;
using System.Workflow.Activities;
using System.Workflow.Activities.Rules;
using System.Workflow.ComponentModel;
using System.Workflow.ComponentModel.Compiler;
using System.Workflow.ComponentModel.Design;
using System.Workflow.ComponentModel.Serialization;
using System.Workflow.Runtime;
using log4net;

namespace HonoWorkflow
{
    public sealed partial class Freigabe : SequentialWorkflowActivity
    {
        const string WORKLFOW_EMAIL = "honoworkflow_donotrespond@mii.at";

        private static readonly ILog log = LogManager.GetLogger(typeof(Freigabe));


        public Freigabe()
        {
            InitializeComponent();
        }

        #region DependencyProperty
        public static DependencyProperty handleExternalEventActivity1_Invoked1Event = DependencyProperty.Register("handleExternalEventActivity1_Invoked1", typeof(System.EventHandler<System.Workflow.Activities.ExternalDataEventArgs>), typeof(HonoWorkflow.Freigabe));

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

        public static DependencyProperty handleExternalEventActivity1_Roles1Property = DependencyProperty.Register("handleExternalEventActivity1_Roles1", typeof(System.Workflow.Activities.WorkflowRoleCollection), typeof(HonoWorkflow.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Aktivität")]
        public WorkflowRoleCollection handleExternalEventActivity1_Roles1
        {
            get
            {
                return ((System.Workflow.Activities.WorkflowRoleCollection)(base.GetValue(HonoWorkflow.Freigabe.handleExternalEventActivity1_Roles1Property)));
            }
            set
            {
                base.SetValue(HonoWorkflow.Freigabe.handleExternalEventActivity1_Roles1Property, value);
            }
        }

        public static DependencyProperty handleAccepted3_sender1Property = DependencyProperty.Register("handleAccepted3_sender1", typeof(System.Object), typeof(HonoWorkflow.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Parameters")]
        public Object handleAccepted3_sender1
        {
            get
            {
                return ((object)(base.GetValue(HonoWorkflow.Freigabe.handleAccepted3_sender1Property)));
            }
            set
            {
                base.SetValue(HonoWorkflow.Freigabe.handleAccepted3_sender1Property, value);
            }
        }

        public static DependencyProperty handleAccepted3_Roles1Property = DependencyProperty.Register("handleAccepted3_Roles1", typeof(System.Workflow.Activities.WorkflowRoleCollection), typeof(HonoWorkflow.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Activity")]
        public WorkflowRoleCollection handleAccepted3_Roles1
        {
            get
            {
                return ((System.Workflow.Activities.WorkflowRoleCollection)(base.GetValue(HonoWorkflow.Freigabe.handleAccepted3_Roles1Property)));
            }
            set
            {
                base.SetValue(HonoWorkflow.Freigabe.handleAccepted3_Roles1Property, value);
            }
        }

        public static DependencyProperty handleAccepted3_Invoked1Event = DependencyProperty.Register("handleAccepted3_Invoked1", typeof(System.EventHandler<System.Workflow.Activities.ExternalDataEventArgs>), typeof(HonoWorkflow.Freigabe));

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

        public static DependencyProperty handleAccepted3_e1Property = DependencyProperty.Register("handleAccepted3_e1", typeof(HonoWorkflow.DocumentProcessedEventArgs), typeof(HonoWorkflow.Freigabe));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Parameters")]
        public DocumentProcessedEventArgs handleAccepted3_e1
        {
            get
            {
                return ((HonoWorkflow.DocumentProcessedEventArgs)(base.GetValue(HonoWorkflow.Freigabe.handleAccepted3_e1Property)));
            }
            set
            {
                base.SetValue(HonoWorkflow.Freigabe.handleAccepted3_e1Property, value);
            }
        }
        #endregion DependencyProperty

        #region  Properties
        public int InstanceIndex
        {
            get { return (int)GetValue(InstanceIndexProperty); }
            set { SetValue(InstanceIndexProperty, value); }
        }
        public static readonly DependencyProperty InstanceIndexProperty =
            DependencyProperty.Register("InstanceIndex", typeof(int), typeof(Freigabe));

        public string InstanceType
        {
            get { return (string)GetValue(InstanceTypeProperty); }
            set { SetValue(InstanceTypeProperty, value); }
        }
        public static readonly DependencyProperty InstanceTypeProperty =
            DependencyProperty.Register("InstanceType", typeof(string), typeof(Freigabe));

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



        //People Manager 
        public Person PeopleManager
        {
            get { return (Person)GetValue(PeopleManagerProperty); }
            set { SetValue(PeopleManagerProperty, value); }
        }
        public static readonly DependencyProperty PeopleManagerProperty =
            DependencyProperty.Register("PeopleManager", typeof(Person), typeof(Freigabe));


        //HR
        public Person[] HR
        {
            get { return (Person[])GetValue(HRProperty); }
            set { SetValue(HRProperty, value); }
        }
        public static readonly DependencyProperty HRProperty =
            DependencyProperty.Register("HR", typeof(Person[]), typeof(Freigabe));



        //CO
        public Person CO
        {
            get { return (Person)GetValue(COProperty); }
            set { SetValue(COProperty, value); }
        }
        public static readonly DependencyProperty COProperty =
            DependencyProperty.Register("CO", typeof(Person), typeof(Freigabe));


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

        private void FreigabeMailMitarbeiter_ExecuteCode(object sender, EventArgs e)
        {
            CreateTask(Mitarbeiter);


            //Console.WriteLine("First activity for workflow {0} with index {1} started at {2}",
            //                    WorkflowEnvironment.WorkflowInstanceId.ToString(),
            //                    InstanceIndex,
            //                    StartTime.ToLongTimeString());
        }

        private void CreateTask(Person p)
        {
            CurrentPerson = p;

            string taskURL = LinkConfirm;
            taskURL += "&WorkflowGUID=" + this.WorkflowInstanceId.ToString();
            taskURL += "&ResponseGUID=" + Guid.NewGuid(); //unique Id for the response 
 

            string mailtext = "Bitte " + (p == Mitarbeiter ? "Ihre " : "die ") + MakeObjectTypeName() + " <a href='" + taskURL + "'>hier</a> kontrollieren. \n "
                 + "\n" + MakeMailText(false, false);

            Mailer.Mail(
                WORKLFOW_EMAIL,
                p.Email,
               (p == Mitarbeiter ? "Hono-Freigabe für Ihre " : "Hono-Freigabe Eine ") + MakeMailSubject(),
                mailtext);


            CurrentTask = MakeMailSubject();
            bool removeOld = true;
            if (p == CO || HR.Contains<Person>(p))
                removeOld = false; //because they get the tasks ate the same time 

            //Create Task
            WorkflowWithPersistence.getBllInstance().CreateWorkitem(this.WorkflowInstanceId, this.InstanceIndex, this.InstanceType,
                System.Convert.ToInt32(p.PersonID),
                MakeMailSubject(), mailtext, taskURL, removeOld);

        }

        private void SendMailRejection(Person p)
        {

            String mailtext = MakeMailText(true, true);


            Mailer.Mail(
                WORKLFOW_EMAIL,
                 p.Email,
              (p == Mitarbeiter ? "Ablehnung für Ihre " : "Ablehnung für eine ") + MakeMailSubject(),
               mailtext);
        }


        private void SendMailReleased(Person p)
        {

            String mailtext = MakeMailText(true, false);

            Mailer.Mail(
                 WORKLFOW_EMAIL,
                 p.Email,
                (p == Mitarbeiter ? "Hono-Abschluss für Ihre " : "Hono-Abschluss für eine ") + MakeMailSubject(),
                mailtext);
        }



        private void FreigabeMailPeopleManager_ExecuteCode(object sender, EventArgs e)
        {

            CreateTask(PeopleManager);

        }


        private void FreigabeMailAddPers_ExecuteCode(object sender, EventArgs e)
        {

            CurrentPerson = AdditionalPersons[GetNextAddPersonIndex()];
            log.Debug("Next add Person is : " + CurrentPerson.Email);
            CreateTask(CurrentPerson);

        }

        private void FreigabeMailHR_ExecuteCode(object sender, EventArgs e)
        {

            foreach (Person p in HR)
                CreateTask(p);

        }



        private void FreigabeMailCO_ExecuteCode(object sender, EventArgs e)
        {
            CreateTask(CO);
        }

        private string MakeObjectTypeName()
        {
            string sbj;
            if (this.InstanceType == "GoalContract")
                sbj = "Zielvereinbarung";
            else if (this.InstanceType == "GoalAchievement")
                sbj = "Zielbewertung ";
            else if (this.InstanceType == "IndividualBonusPlan")
                sbj = "Individual Bonus";
            else if (this.InstanceType == "IndividualBonus")
                sbj = "Individual Bonus Bewertung";
            else
                sbj = InstanceType;
            return sbj;
        }

        /// <summary>
        /// Mailsubject erstellen
        /// </summary>
        /// <returns></returns>
        private string MakeMailSubject()
        {
            return MakeObjectTypeName() + " für " + Mitarbeiter.Firstname + " " + Mitarbeiter.Lastname + ", " + Subject + " [" + InstanceIndex + "]";
        }



        private string MakeMailText(bool istWorkflowFinish, bool isAblehnung)
        {
            string txt = "";
            //txt +="<font face=\"Verdana,sans-serif;\">";
            txt += "<html>";
            txt += "<head>";
            txt += "    <title>Honorierungsmodell MI-Group Email Freigabe</title>";
            txt += "     <link rel=\"stylesheet\" type=\"text/css\" href=\"http://92.51.141.139:81/Media/Keola.css\" />";
            txt += "</head>";
            txt += "<body>";
            
            if (isAblehnung)
            {
                txt += "\nNach der durchgeführten Änderung wird der komplette Workflow neu gestartet.";
                txt += "\nBegründung: " + this.RejectReason;
            }
            else
            {
                if (istWorkflowFinish)
                {
                    txt += "Folgende " + MakeObjectTypeName() + " wurde abgeschlossen und akzeptiert: ";
                }
                else
                {
                    txt += "\n<b>Bitte um Freigabe folgender " + MakeObjectTypeName() + ":</b>";
                }
            }

            txt += "\n<b>Mitarbeiter:</b> \t\t" + Mitarbeiter.Firstname.Trim() + " " + Mitarbeiter.Lastname.Trim();
            txt += "\n<b>People Manager:</b> \t\t" + PeopleManager.Firstname.Trim() + " " + PeopleManager.Lastname.Trim();

            txt += "\n\n<b>Start des Workflows:</b> " + this.StartTime + " \n";
            txt += "<b>Ende des Workflows:</b> " + this.EndTime;

            txt += "\n\n<b>Workflow Teilnehmer:</b>";
            if (Mitarbeiter.Participates)
                txt += "\n" + (CurrentPerson == Mitarbeiter && !istWorkflowFinish ? "*" : "-") + " Mitarbeiter: \t\t" + Mitarbeiter.Firstname.Trim() + " " + Mitarbeiter.Lastname.Trim();

            if (Mitarbeiter.ResponseDate.HasValue)
                txt += " (bestätig am " + Mitarbeiter.ResponseDate.Value + ")";

            if (PeopleManager.Participates)
                txt += "\n" + (CurrentPerson == PeopleManager && !istWorkflowFinish ? "*" : "-") + " People Manager: \t" + PeopleManager.Firstname.Trim() + " " + PeopleManager.Lastname.Trim();
            if (PeopleManager.ResponseDate.HasValue)
                txt += " (bestätig am " + PeopleManager.ResponseDate.Value + ")";

            //  Add Persons 

            foreach (Person p in AdditionalPersons)
            {
                txt += "\n" + (CurrentPerson == p && !istWorkflowFinish ? "*" : "-") + " Zusatzperson: \t\t" + p.Firstname.Trim() + " " + p.Lastname.Trim();
                if (p.ResponseDate.HasValue)
                    txt += " (bestätig am " + p.ResponseDate.Value + ")";

            }

            foreach (Person hrPerson in HR)
            {
                if (hrPerson.Participates)
                    txt += "\n" + (CurrentPerson == hrPerson && !istWorkflowFinish ? "*" : "-") + " Human Resources: \t" + hrPerson.Firstname.Trim() + " " + hrPerson.Lastname.Trim();
                if (hrPerson.ResponseDate.HasValue)
                    txt += " (bestätig am " + hrPerson.ResponseDate.Value + ")";
            }
            if (CO.Participates)
                txt += "\n" + (CurrentPerson == CO && !istWorkflowFinish ? "*" : "-") + " Controlling: \t\t" + CO.Firstname.Trim() + " " + CO.Lastname.Trim();

            if (CO.ResponseDate.HasValue)
                txt += " (bestätig am " + CO.ResponseDate.Value + ")";

            txt += "\n\n\nBei Fragen wende Dich bitte an die HR Abteilung.";
            txt += "\n\nVielen Dank! \n\nDeine HR Abteilung";

            //txt += "</font>";
            txt += "</body>";
            txt = txt.Replace("\n", "\r\n");
            return txt;
        }
        #endregion

        #region Status

        private void StatusNew_ExecuteCode(object sender, EventArgs e)
        {
            log.Debug("StatusNew_ExecuteCode");
            //TODO test BLL Connection 
            StartTime = DateTime.Now;
            WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex, this.InstanceType, "Workflow", (int)ApprovalLevel.New, this.WorkflowInstanceId);
        }
        private void StatusReleased_ExecuteCode(object sender, EventArgs e)
        {

            log.Debug("StatusReleased_ExecuteCode");

            EndTime = DateTime.Now;

            WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex,
                this.InstanceType, "Workflow",
                (int)ApprovalLevel.Released, this.WorkflowInstanceId);


            //Remove Tasks
            WorkflowWithPersistence.getBllInstance().CreateWorkitem(this.WorkflowInstanceId, this.InstanceIndex, this.InstanceType,
                System.Convert.ToInt32(0), "-", "-", "-", true);



            //Send mail to all participants that the workflow was rejected


            if (Mitarbeiter.Participates)
                SendMailReleased(Mitarbeiter);


            if (PeopleManager.Participates)
                SendMailReleased(PeopleManager);

            foreach (Person hrPerson in HR)
                if (hrPerson.Participates)
                    SendMailReleased(hrPerson);


            if (CO.Participates)
                SendMailReleased(CO);




            Console.WriteLine("First activity for workflow {0} with index {1} started at {2}",
                                WorkflowEnvironment.WorkflowInstanceId.ToString(),
                                InstanceIndex,
                                StartTime.ToLongTimeString(),
                                this.WorkflowInstanceId);
        }

        # region Mitarbeiter
        private void StatusMitarbeieter_ExecuteCode(object sender, EventArgs e)
        {
            Mitarbeiter.ResponseDate = DateTime.Now;
            WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex,
                InstanceType,
                "Workflow",
                (int)ApprovalLevel.ApprovedWorker,
                this.WorkflowInstanceId);

            Console.WriteLine("Second activity for workflow {0} with index {1} started at {2}",
                               WorkflowEnvironment.WorkflowInstanceId.ToString(),
                               InstanceIndex,
                               StartTime.ToLongTimeString());
        }

        private void StatusRejectMitarbeiter_ExecuteCode(object sender, EventArgs e)
        {

            Reject();
        }

        private void Reject()
        {

            EndTime = DateTime.Now;

            WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex,
              InstanceType,
              "Workflow",
              (int)ApprovalLevel.Rejected,
              this.WorkflowInstanceId);

            //Send mail to all participants that the workflow was rejected


            if (Mitarbeiter.Participates && Mitarbeiter.ResponseDate != null)
                SendMailRejection(Mitarbeiter);


            if (PeopleManager.Participates && PeopleManager.ResponseDate != null)
                SendMailRejection(PeopleManager);

            foreach (Person adPerson in AdditionalPersons)
                if (adPerson.Participates && adPerson.ResponseDate != null)
                    SendMailRejection(adPerson);


            foreach (Person hrPerson in HR)
                if (hrPerson.Participates && hrPerson.ResponseDate != null)
                    SendMailRejection(hrPerson);


            if (CO.Participates && CO.ResponseDate != null)
                SendMailRejection(CO);



            RemoveTasks();


            //Cancel Workflow 
            throw new Exception("Workflow cancelled!");

        }


        #endregion Mitarbeiter

        #region People Manager
        private void StatusPM_ExecuteCode(object sender, EventArgs e)
        {
            PeopleManager.ResponseDate = DateTime.Now;
            WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex, this.InstanceType, "Workflow", (int)ApprovalLevel.ApprovedPeopleManager, this.WorkflowInstanceId);
        }
        #endregion People Manager

        #region HR

        private void StatusHR_ExecuteCode(object sender, EventArgs e)
        {
            Accept_HR_CO();
        }

        private void Accept_HR_CO()
        {
            foreach (Person hrPerson in HR)
            {
                if (CallingPerson.PersonID == hrPerson.PersonID)
                {
                    hrPerson.ResponseDate = DateTime.Now;
                    WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex, this.InstanceType, "Workflow", (int)ApprovalLevel.ApprovedHR, this.WorkflowInstanceId);
                    return;
                }
            }

            //else
            {
                CO.ResponseDate = DateTime.Now;
                WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex, this.InstanceType, "Workflow", (int)ApprovalLevel.ApprovedCO, this.WorkflowInstanceId);
            }
        }

        private void StatusRejectHR_ExecuteCode(object sender, EventArgs e)
        {
            Reject();
        }
        #endregion HR

        #region CO
        private void statusCO_ExecuteCode(object sender, EventArgs e)
        {
            Accept_HR_CO();
        }

        private void StatusRejectCO_ExecuteCode(object sender, EventArgs e)
        {
            Reject();
        }
        #endregion CO

        #endregion

        #region Event handling
        void approveEvent_Invoked(object sender, ExternalDataEventArgs e)
        {
            // this.reportResult = "Report Approved";
        }

        private void delayActivity5Sek_InitializeTimeoutDuration(object sender, EventArgs e)
        {
            log.Debug("delayActivity5Sek_InitializeTimeoutDuration");
        }


        private void codeActivityRemovePMTask_ExecuteCode(object sender, EventArgs e)
        {
            RemoveTasks();
        }

        private void RemoveTasks()
        {
            //Remove Tasks
            WorkflowWithPersistence.getBllInstance().CreateWorkitem(this.WorkflowInstanceId, this.InstanceIndex, this.InstanceType,
                System.Convert.ToInt32(0), "-", "-", "-", true);
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

        #region "Rejection"

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
            WorkflowWithPersistence.getBllInstance().CreateApproval(this.InstanceIndex,
                this.InstanceType, "Workflow",
                (int)ApprovalLevel.ApprovedAdditionalPerson,
                this.WorkflowInstanceId);
        }

        private void nextPerson_ExecuteCode(object sender, EventArgs e)
        {
            GetNextAddPersonIndex();
        }

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



    }

}
