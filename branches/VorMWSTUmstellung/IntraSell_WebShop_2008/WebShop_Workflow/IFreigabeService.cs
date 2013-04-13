using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Workflow.Activities;

namespace IntraSell
{
    [ExternalDataExchange]
    public interface IFreigabeService
    {
        //public void SetApproved(Guid workflowProcessId, string message);
        event EventHandler<DocumentProcessedEventArgs> DocumentApproved;
        event EventHandler<DocumentProcessedEventArgs> DocumentRejected;
    }


    [Serializable]
    public class DocumentProcessedEventArgs : ExternalDataEventArgs
    {
        public DocumentProcessedEventArgs(Guid instanceId, string message)
            : base(instanceId)
        {
            _message = message;
        }
        private string _message;
        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }
    }
}