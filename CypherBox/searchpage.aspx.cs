using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CYPHER_BOX
{
    public partial class searchpage : System.Web.UI.Page
    {
        //List<string> list = new List<string>();
        string Selectedmail;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {           
            Selectedmail=GridView1.SelectedRow.Cells[4].Text;
           // list.Add(Selectedmail);
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            TextBox_sendmessage.Text = Selectedmail;
        }
    }
}