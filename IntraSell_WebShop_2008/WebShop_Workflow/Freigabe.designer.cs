using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Drawing;
using System.Reflection;
using System.Workflow.ComponentModel.Compiler;
using System.Workflow.ComponentModel.Serialization;
using System.Workflow.ComponentModel;
using System.Workflow.ComponentModel.Design;
using System.Workflow.Runtime;
using System.Workflow.Activities;
using System.Workflow.Activities.Rules;

namespace IntraSell
{
    partial class Freigabe
    {
        #region Designer generated code

        /// <summary> 
        /// Erforderliche Methode für die Designerunterstützung. 
        /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCode]
        private void InitializeComponent()
        {
            this.CanModifyActivities = true;
            System.Workflow.Activities.Rules.RuleConditionReference ruleconditionreference1 = new System.Workflow.Activities.Rules.RuleConditionReference();
            this.FreigabeMailMitarbeiter = new System.Workflow.Activities.CodeActivity();
            this.ifWorkerDoNotParticipets = new System.Workflow.Activities.IfElseBranchActivity();
            this.ifWorkerParticipates = new System.Workflow.Activities.IfElseBranchActivity();
            this.StatusReleased = new System.Workflow.Activities.CodeActivity();
            this.delayActivity = new System.Workflow.Activities.DelayActivity();
            this.ifMitarbeiterParticipates = new System.Workflow.Activities.IfElseActivity();
            this.SendMail = new System.Workflow.Activities.CodeActivity();
            this.StatusNew = new System.Workflow.Activities.CodeActivity();
            // 
            // FreigabeMailMitarbeiter
            // 
            this.FreigabeMailMitarbeiter.Name = "FreigabeMailMitarbeiter";
            this.FreigabeMailMitarbeiter.ExecuteCode += new System.EventHandler(this.FreigabeMailMitarbeiter_ExecuteCode);
            // 
            // ifWorkerDoNotParticipets
            // 
            this.ifWorkerDoNotParticipets.Name = "ifWorkerDoNotParticipets";
            // 
            // ifWorkerParticipates
            // 
            this.ifWorkerParticipates.Activities.Add(this.FreigabeMailMitarbeiter);
            ruleconditionreference1.ConditionName = "WorkerParticipates";
            this.ifWorkerParticipates.Condition = ruleconditionreference1;
            this.ifWorkerParticipates.Description = "Mitarbeiter muss bestätigen";
            this.ifWorkerParticipates.Name = "ifWorkerParticipates";
            // 
            // StatusReleased
            // 
            this.StatusReleased.Name = "StatusReleased";
            this.StatusReleased.ExecuteCode += new System.EventHandler(this.StatusReleased_ExecuteCode);
            // 
            // delayActivity
            // 
            this.delayActivity.Name = "delayActivity";
            this.delayActivity.TimeoutDuration = System.TimeSpan.Parse("00:00:10");
            this.delayActivity.InitializeTimeoutDuration += new System.EventHandler(this.delayActivity5Sek_InitializeTimeoutDuration);
            // 
            // ifMitarbeiterParticipates
            // 
            this.ifMitarbeiterParticipates.Activities.Add(this.ifWorkerParticipates);
            this.ifMitarbeiterParticipates.Activities.Add(this.ifWorkerDoNotParticipets);
            this.ifMitarbeiterParticipates.Name = "ifMitarbeiterParticipates";
            // 
            // SendMail
            // 
            this.SendMail.Name = "SendMail";
            this.SendMail.ExecuteCode += new System.EventHandler(this.SendMail_ExecuteCode);
            // 
            // StatusNew
            // 
            this.StatusNew.Name = "StatusNew";
            this.StatusNew.ExecuteCode += new System.EventHandler(this.StatusNew_ExecuteCode);
            // 
            // Freigabe
            // 
            this.Activities.Add(this.StatusNew);
            this.Activities.Add(this.SendMail);
            this.Activities.Add(this.ifMitarbeiterParticipates);
            this.Activities.Add(this.delayActivity);
            this.Activities.Add(this.StatusReleased);
            this.Name = "Freigabe";
            this.CanModifyActivities = false;

        }

        #endregion

        private EventDrivenActivity Einverstanden;
        private CodeActivity StatusMitarbeieter;
        private HandleExternalEventActivity handleRejected;
        private CodeActivity SendMail;
        private CodeActivity StatusReleased;
        private IfElseBranchActivity ifWorkerDoNotParticipets;
        private IfElseBranchActivity ifWorkerParticipates;
        private IfElseActivity ifMitarbeiterParticipates;
        private CodeActivity StatusNew;
        private DelayActivity delayActivity;
        private CodeActivity FreigabeMailMitarbeiter;

























































































































































    }
}
