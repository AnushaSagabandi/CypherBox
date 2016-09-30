using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CYPHER_BOX
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Loginpage.aspx");
            }
            if (Session["SuccessList"] != null)
            {
                string[] successList = (string[])Session["SuccessList"];
                foreach (string item in successList)
                {
                    if (item != null &&
                        item.Trim() != string.Empty)
                    {
                        lblSuccess.Text += Server.HtmlDecode(item + "<br/>");
                    }
                }
                Session.Remove("SuccessList");
            }

            if (Session["FailList"] != null)
            {
                string[] failList = (string[])Session["FailList"];
                foreach (string item in failList)
                {
                    if (item != null &&
                        item.Trim() != string.Empty)
                    {
                        lblFail.Text += Server.HtmlDecode(item + "<br/>");
                    }
                }
                Session.Remove("FailList");
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}