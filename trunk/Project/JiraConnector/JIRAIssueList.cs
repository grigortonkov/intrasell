using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JiraConnector
{
    class JIRAIssueList
    {
        public String expand;
        public String startAt;
        public String maxResults;
        public List<JIRAIssue> issues;
    }
}
