using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IntraSell
{
    [Serializable]
    public class Person
    {

        public Person()
        {
        }

        public Person(string personID, string email)
        {

            this.personID = personID;
            this.email = email;
        }

        private string personID;
        private string email;
        private string firstname;
        private string lastname;
        private bool participates = true;
        private DateTime? responseDate;

        /// <summary>
        /// Workflow Reponse Date 
        /// </summary>
        public DateTime? ResponseDate
        {
            get { return responseDate; }
            set { responseDate = value; }
        }

        /// <summary>
        /// if the person takes part of the freigabe workflow or the worflow flows automatically.
        /// </summary>
        public bool Participates
        {
            get { return participates; }
            set { participates = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }



        public string PersonID
        {
            get { return personID; }
            set { personID = value; }
        }


        public string Firstname
        {
            get { return firstname; }
            set { firstname = value; }
        }


        public string Lastname
        {
            get { return lastname; }
            set { lastname = value; }

        }

    }
}
