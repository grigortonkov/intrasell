using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Workflow.Activities;


namespace IntraSell
{
 
	public class FreigabeService: IFreigabeService
	{

        #region IFreigabeService Member
 

        public void SetApproved(Guid workflowProcessId, string message)
        {
            DocumentProcessedEventArgs args = new DocumentProcessedEventArgs(workflowProcessId, message);
            EventHandler<DocumentProcessedEventArgs> evh = DocumentApproved;
            if (evh != null)
                evh(null, args); // boom!
        }

 

        public void SetDisagreed(Guid workflowProcessId, string message)
        {
            DocumentProcessedEventArgs args = new DocumentProcessedEventArgs(workflowProcessId, message);
            EventHandler<DocumentProcessedEventArgs> evh = DocumentRejected;
            if (evh != null)
                evh(null, args); // boom!
        }


        public event EventHandler<DocumentProcessedEventArgs> DocumentApproved;

        public event EventHandler<DocumentProcessedEventArgs> DocumentRejected;

        #endregion
    
  
}
}
