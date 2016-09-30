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
    public class LoginBAL
    {
        LoginDAL rdal = new LoginDAL();

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
    }
}
