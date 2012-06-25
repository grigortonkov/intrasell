using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
namespace IntraSell
{
    public partial class _Default : System.Web.UI.Page
    {

        private static readonly ILog log = LogManager.GetLogger(typeof(_Default));
 

  
        protected void Page_Load(object sender, EventArgs e)
        {
            log.Debug("Page_Load"); 

            Response.Write ("Hello to GRITON!");
        }

        protected void btnStart_Click(object sender, EventArgs e)
        { 
           Person p  = new Person("1", "grigor.tonkov@gmail.com");
           p.Firstname = "Grigor";
           p.Lastname = "Tonkov";
           p.Participates = false; 

           string linkConfirm = "~/";
           string linkReject = "~/";
           Guid id = WorkflowWithPersistence.startWorkflow(1, "GoalAchievement", p, p, new Person[] { p }, linkConfirm, linkReject, "test");
           Response.Write("Workflow started:" + id.ToString());
           this.txtProcessId.Text = id.ToString(); 
        }

        protected void btnGetCount_Click(object sender, EventArgs e)
        {
            Response.Write(String.Format("We have {0} processes running!",  WorkflowWithPersistence.getWorkflowsCount())); 
        }

        protected void btnRelease_Click(object sender, EventArgs e)
        {
            WorkflowWithPersistence.setApproved(new Guid(this.txtProcessId.Text), "no message");
            Response.Write("Released");
        }
    }
}
