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

namespace HonoWorkflow
{
    partial class WebServiceWorkflow
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
            System.Workflow.ComponentModel.ActivityBind activitybind1 = new System.Workflow.ComponentModel.ActivityBind();
            System.Workflow.ComponentModel.ActivityBind activitybind2 = new System.Workflow.ComponentModel.ActivityBind();
            this.codeActivity1 = new System.Workflow.Activities.CodeActivity();
            this.ConfirmGoal = new System.Workflow.Activities.WebServiceInputActivity();
            // 
            // codeActivity1
            // 
            this.codeActivity1.Name = "codeActivity1";
            this.codeActivity1.ExecuteCode += new System.EventHandler(this.codeActivity1_ExecuteCode);
            activitybind1.Name = "WebServiceWorkflow";
            activitybind1.Path = "ConfirmGoal_Roles1";
            activitybind2.Name = "WebServiceWorkflow";
            activitybind2.Path = "ConfirmGoal_InputReceived1";
            // 
            // ConfirmGoal
            // 
            this.ConfirmGoal.InterfaceType = typeof(HonoWorkflow.IFreigabeService);
            this.ConfirmGoal.IsActivating = true;
            this.ConfirmGoal.Name = "ConfirmGoal";
            this.ConfirmGoal.SetBinding(System.Workflow.Activities.WebServiceInputActivity.RolesProperty, ((System.Workflow.ComponentModel.ActivityBind)(activitybind1)));
            this.ConfirmGoal.SetBinding(System.Workflow.Activities.WebServiceInputActivity.InputReceivedEvent, ((System.Workflow.ComponentModel.ActivityBind)(activitybind2)));
            // 
            // WebServiceWorkflow
            // 
            this.Activities.Add(this.ConfirmGoal);
            this.Activities.Add(this.codeActivity1);
            this.Name = "WebServiceWorkflow";
            this.CanModifyActivities = false;

        }

        #endregion

        private CodeActivity codeActivity1;
        private WebServiceInputActivity ConfirmGoal;





    }
}
