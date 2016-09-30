using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cypherBoxDataLayer;
using BO;
using System.Data;
using System.Data.SqlTypes;

namespace BAL
{
    public class SendMessageBAL
    {
        SendMessageDAL sdal = new SendMessageDAL();
       
        public DataTable getuserlist_BAL()
        {
            return sdal.getuserlist_DAL();
        }
        public bool IsValidUser_BAL(string UserName)
        {
            DataTable table = sdal.getuserdetails_DAL(UserName);

            if (table.Rows.Count == 0)
            {
                return false;
            }
            return true;
        }
        public bool SendMessage(string UserName, string sender, string subject, string body)
        {
            return sdal.SendMessage_DAL(UserName, sender, subject, body);
        }
        public DataTable GetAllMessages(string UserName)
        {
            return sdal.GetAllMessages(UserName);
        }
    }
}
