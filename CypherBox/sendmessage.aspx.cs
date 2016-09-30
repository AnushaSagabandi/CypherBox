using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;
using BAL;
using System.Data;
using encryptionBusinessLayer;

namespace CYPHER_BOX
{
    public partial class sendmessage : System.Web.UI.Page
    {
        RegistrationBO rbo = new RegistrationBO();
        RegistrationBAL rbal = new RegistrationBAL();
        //List<string> list = new List<string>();
        string Selectedmail;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (IsPostBack == false)
            {
                

                if (Request.QueryString["action"] != null &&
                    Session["Message"] != null)
                {
                    RegistrationBO rbo1 = (RegistrationBO)Session["RegistrationBO"];

                    switch (Request.QueryString["action"].ToString())
                    {
                        case "reply":
                            TextBox_subject.Text = "Re: " + rbo.subject;
                            TextBox_sendmessage.Text = rbo.sender + ",";
                            TextBox_body.Text = Server.HtmlDecode
                                ("<br/><br/><br/> Original Message<hr/> From: " +
                                rbo.sender +
                                "<br/> To: " +
                                rbo.receiver +
                                "<br/> Message contents: " +
                                rbo.body);
                            break;

                        case "forward":
                            TextBox_subject.Text = "Fw: " + rbo.subject;
                            TextBox_body.Text = Server.HtmlDecode("<br/><br/><br/> Original Message<hr/> From: " +
                                rbo.sender +
                                "<br/> To: " +
                                rbo.receiver +
                                "<br/> Message contents: " +
                                rbo.body);
                            break;
                    }
                }
            }
        }
       
       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            Selectedmail = GridView1.SelectedRow.Cells[3].Text;

                if (TextBox_sendmessage.Text.Trim().Length>0)
                {
                    TextBox_sendmessage.Text += "," + Selectedmail;
                }
                else
                {

                    TextBox_sendmessage.Text = Selectedmail;
                    // list.Add(Selectedmail);
                }
        }

        
           

        protected void Button_sendmessage_Click(object sender, EventArgs e)
        {
            /*if (TextBox_sendmessage.Text.Trim() == string.Empty)
        {
            //Set the notification label here
            return;
        }*/
        
        // Let us get the list of valid users first
           DataTable table= rbal.getuserlist_BAL();
           clsXor encrypt = new clsXor();
         //Now get the recievers list entered by user        
        string recieversList = TextBox_sendmessage.Text.Replace(" ", "");
        string[] users = recieversList.Split(new char[] { ','});
        string[] failList = new string[users.Length];
        string[] successList = new string[users.Length];
        encryptedMessage.Text = encrypt.encryption(TextBox_body.Text, "hidden");
        int successCount = 0;
        int failCount = 0;

/////////////trial part

       

///////////////////////

        
        foreach (string user in users)
        {
            if (rbal.IsValidUser_BAL(user) == true)
            {
                if (true == rbal.SendMessage(Session["UserName"].ToString().Trim(), user, TextBox_subject.Text, Server.HtmlEncode(encryptedMessage.Text)))
                {
                    successList[successCount++] = user;
                }
                else
                {
                    failList[failCount++] = user;
                }
            }
            else
            {
                failList[failCount++] = user;
            }
        }        

        Session["SuccessList"] = successList;
        Session["FailList"] = failList;

        Response.Redirect("Confirmation.aspx");        
    
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHome.aspx");
        }

        protected void Button_search_Click(object sender, EventArgs e)
        {

        }
    }
}