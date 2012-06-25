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
    partial class WorkflowStatus
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
            this.stateActivity2 = new System.Workflow.Activities.StateActivity();
            this.stateActivity1 = new System.Workflow.Activities.StateActivity();
            this.WorkflowStatusInitialState = new System.Workflow.Activities.StateActivity();
            // 
            // stateActivity2
            // 
            this.stateActivity2.Name = "stateActivity2";
            // 
            // stateActivity1
            // 
            this.stateActivity1.Name = "stateActivity1";
            // 
            // WorkflowStatusInitialState
            // 
            this.WorkflowStatusInitialState.Name = "WorkflowStatusInitialState";
            // 
            // WorkflowStatus
            // 
            this.Activities.Add(this.WorkflowStatusInitialState);
            this.Activities.Add(this.stateActivity1);
            this.Activities.Add(this.stateActivity2);
            this.CompletedStateName = null;
            this.DynamicUpdateCondition = null;
            this.InitialStateName = "WorkflowStatusInitialState";
            this.Name = "WorkflowStatus";
            this.CanModifyActivities = false;

        }

        #endregion

        private StateActivity stateActivity2;
        private StateActivity stateActivity1;
        private StateActivity WorkflowStatusInitialState;

    }
}
