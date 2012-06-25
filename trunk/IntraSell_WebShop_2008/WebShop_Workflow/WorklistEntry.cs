using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IntraSell
{
    [Serializable]
	public class WorklistEntry
	{
        public Guid InstanceGuid;
        public int ObjectId;
        public string ObjectType;
        public Person Person;
        public string Task;
        public string TaskURL;
        public string Status;
        public string Description;
        public DateTime DueDate;
        public DateTime Start;
        public DateTime? End;
        public DateTime FirstProcessing; //erste Bearbeitung //Workflow Start
        public DateTime? LastProcessing; //letzte Bearbeitung //Workflow Ende 

	}
}
