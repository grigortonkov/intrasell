using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Workflow.Runtime.Hosting;
using System.Workflow.ComponentModel;

namespace IntraSell
{
	class PersitenceService : SqlWorkflowPersistenceService
	{
        public PersitenceService(string s, bool b, TimeSpan d1, TimeSpan d2)
            : base(s, b, d1, d2)
        { }
        public Activity LoadWorkflowInstanceState(Guid id)
        {
           return base.LoadWorkflowInstanceState(id); 
        }
	}
}
