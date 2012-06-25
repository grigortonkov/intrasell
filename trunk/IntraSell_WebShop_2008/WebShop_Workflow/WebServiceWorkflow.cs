using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Drawing;
using System.Linq;
using System.Workflow.ComponentModel.Compiler;
using System.Workflow.ComponentModel.Serialization;
using System.Workflow.ComponentModel;
using System.Workflow.ComponentModel.Design;
using System.Workflow.Runtime;
using System.Workflow.Activities;
using System.Workflow.Activities.Rules;
using System.Web;
using System.Web.Services;


namespace HonoWorkflow
{
    public sealed partial class WebServiceWorkflow : SequentialWorkflowActivity
    {
        public WebServiceWorkflow()
        {
            InitializeComponent();
        }

        public static DependencyProperty ConfirmGoal_Roles1Property = DependencyProperty.Register("ConfirmGoal_Roles1", typeof(System.Workflow.Activities.WorkflowRoleCollection), typeof(HonoWorkflow.WebServiceWorkflow));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Aktivität")]
        public WorkflowRoleCollection ConfirmGoal_Roles1
        {
            get
            {
                return ((System.Workflow.Activities.WorkflowRoleCollection)(base.GetValue(HonoWorkflow.WebServiceWorkflow.ConfirmGoal_Roles1Property)));
            }
            set
            {
                base.SetValue(HonoWorkflow.WebServiceWorkflow.ConfirmGoal_Roles1Property, value);
            }
        }

        public static DependencyProperty ConfirmGoal_InputReceived1Event = DependencyProperty.Register("ConfirmGoal_InputReceived1", typeof(System.EventHandler), typeof(HonoWorkflow.WebServiceWorkflow));

        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        [BrowsableAttribute(true)]
        [CategoryAttribute("Handler")]
        public event EventHandler ConfirmGoal_InputReceived1
        {
            add
            {
                base.AddHandler(ConfirmGoal_InputReceived1Event, value);
            }
            remove
            {
                base.RemoveHandler(ConfirmGoal_InputReceived1Event, value);
            }
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        private void codeActivity1_ExecuteCode(object sender, EventArgs e)
        {

        }
    }

}
