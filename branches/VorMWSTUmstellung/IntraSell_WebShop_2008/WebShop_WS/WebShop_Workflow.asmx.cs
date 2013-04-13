using System;
using System.Web.Services;
using System.Configuration;
using System.Collections.Generic;

namespace IntraSell
{
    /// <summary>
    /// Zusammenfassungsbeschreibung für HonoWorkflow
    /// </summary>
    [WebService(Namespace = "http://www.griton.eu/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Um das Aufrufen dieses Webdiensts aus einem Skript mit ASP.NET AJAX zuzulassen, heben Sie die Auskommentierung der folgenden Zeile auf. 
    // [System.Web.Script.Services.ScriptService]
    public class HonoWorkflow : System.Web.Services.WebService
    {

        [WebMethod]
        public int getWorkflowsCount()
        {
            return WorkflowWithPersistence.getWorkflowsCount();
        }

        [WebMethod]
        public Guid startWorkflow(int ObjectID, string ObjectType,
            Person person, Person customer, Person[] AdditionalPersons,
            string LinkConfirm, string LinkReject, string WorfklowSubject)
        {
            //string smtp_server = ConfigurationManager.AppSettings.Get("SMTP_SERVER");
            //string workflow_email = ConfigurationManager.AppSettings.Get("EMAIL_WORKFLOW"); 

            return WorkflowWithPersistence.startWorkflow(ObjectID,
                ObjectType, person, customer, AdditionalPersons,
                LinkConfirm, LinkReject, WorfklowSubject);
        }

        [WebMethod]
        public string InsertApproval(int goalContractId, string objectType, string approvedBy, int Level, Guid workflowGUID)
        {
            string connString =
              ConfigurationManager.ConnectionStrings["honoConnectionString"].ConnectionString;
            //  WorkflowBLL bll = new WorkflowBLL();
            // bll.setWorkflowBLLConnection(connString);
            String result = null;
            //System.Convert.ToString(
            //    bll.CreateApproval(goalContractId, objectType, approvedBy, Level,workflowGUID))
            return result; ;
        }

        /// <summary>
        /// Throw Agree Event 
        /// </summary>
        /// <param name="processId">Workflow GUI Instance</param>
        /// <param name="message">Contains the Person ID of the person</param>
        [WebMethod]
        public void SetApproved(Guid processId, string message)
        {
            WorkflowWithPersistence.setApproved(processId, message);
        }


        /// <summary>
        /// Throw disagree Event 
        /// </summary>
        /// <param name="processId">Workflow GUI Instance</param>
        /// <param name="message">Disagree Message</param>
        [WebMethod]
        public void SetDisagreed(Guid processId, string message)
        {
            WorkflowWithPersistence.setDisagreed(processId, message);
        }


        [WebMethod]
        public string GetConnString()
        {
            return ConfigurationManager.ConnectionStrings["honoConnectionString"].ConnectionString;
        }

        [WebMethod]
        public List<WorklistEntry> getWorklist()
        {
            return WorkflowWithPersistence.getWorklist();
        }

    }
}
