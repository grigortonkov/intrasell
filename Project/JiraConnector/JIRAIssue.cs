using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json.Linq;

namespace JiraConnector
{
    class JIRAIssue
    {
        public String expand;
        public String id;
        public String self;
        public string key;
        public JContainer fields;
    }
}
