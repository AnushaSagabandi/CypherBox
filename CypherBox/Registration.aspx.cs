using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using BO;

namespace CYPHER_BOX
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_submitregistration_Click(object sender, EventArgs e)
        {
            RegistrationBO rbo = new RegistrationBO();
            RegistrationBAL rbal = new RegistrationBAL();
            rbo.firstname = TextBox_firstname.Text.Trim();
            rbo.lastname = TextBox_lastname.Text.Trim();
            rbo.username = TextBox_username.Text.Trim();
            rbo.password = TextBox_password.Text.Trim();
            rbo.cpassword = TextBox_cpassword.Text.Trim();
            rbo.emailid = TextBox_emailid.Text.Trim();
            int value = rbal.register_BAL(rbo);
            if (value == 0)
            {
                
                Response.Redirect("Loginpage.aspx");
            }

            else
            {
                Label_errormessage.Text = "Username already Exists!!!";
            }
        }

    }
}