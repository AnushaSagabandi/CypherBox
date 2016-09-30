using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CypherBox
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("messageEncryption.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("sendmessage.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("fileEncryption.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
             Response.Redirect("Default.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewmessage.aspx");
        }
        
    }
}