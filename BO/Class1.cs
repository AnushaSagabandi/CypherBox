using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BO
{
    public class RegistrationBO
    {
        private string _firstname;
        private string _lastname;
        private string _username;
        private string _password;
        private string _cpassword;
        private string _emailid;
        private string _subject;
        private string _sender;
        private string _receiver;
        private string _body;

        public string firstname
        {
            get { return _firstname; }
            set { _firstname = value; }

        }
        public string lastname
        {
            get { return _lastname; }
            set { _lastname = value; }
            
        }
        public string username
        {
            get { return _username; }
            set { _username = value; }

        }
        public string password
        {
            get { return _password; }
            set { _password = value; }

        }
        public string cpassword
        {
            get { return _cpassword; }
            set { _cpassword = value; }

        }
        public string emailid
        {
            get { return _emailid; }
            set { _emailid = value; }
        }
        public string subject
        {
            get { return _subject; }
            set { _subject = value; }
        }
        public string sender
        {
            get { return _sender; }
            set { _sender = value; }
        }
        public string body
        {
            get { return _body; }
            set { _body = value; }
        }
        public string receiver
        {
            get { return _receiver; }
            set { _receiver = value; }
        }

    }
   

    }
       
