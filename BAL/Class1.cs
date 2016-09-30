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
    public class RegistrationBAL
    {
        RegistrationDAL rdal = new RegistrationDAL();
        public int register_BAL(RegistrationBO rbo)
        {
            try
            {
                return rdal.register_DAL(rbo);
            }
            catch (Exception ex)
            {
                ex.GetType();
            }
            return 0;

        }
        public int login_BAL(RegistrationBO rbo)
        {
            try
            {
                return rdal.validate_user(rbo);
            }
            catch (Exception ex)
            {
                ex.GetType();
            }
            return 0;
        }
        public DataTable getuserlist_BAL()
        {
            return rdal.getuserlist_DAL();
        }
        public bool IsValidUser_BAL(string UserName)
        {
            DataTable table = rdal.getuserdetails_DAL(UserName);

            if (table.Rows.Count == 0)
            {
                return false;
            }
            return true;
        }
        public bool SendMessage(string UserName, string sender, string subject, string body)
        {
            return rdal.SendMessage_DAL(UserName, sender, subject, body);
        }
    }
}
