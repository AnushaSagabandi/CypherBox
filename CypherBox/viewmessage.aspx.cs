using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;
using BAL;

namespace CypherBox
{
    public partial class viewmessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Loginpage.aspx");
            }
            SendMessageBAL rbal = new SendMessageBAL();

            Repeater1.DataSource = rbal.GetAllMessages(Session["UserName"].ToString().Trim());
            Repeater1.DataBind();
        }
    }
}