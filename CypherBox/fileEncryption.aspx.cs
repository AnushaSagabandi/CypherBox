using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
//using encryptionBusinessLayer;
using BAL;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace CypherBox
{
    public partial class fileEncryption : System.Web.UI.Page
    {
        string global;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

    
        protected void readText_Click(object sender, EventArgs e)
        {
            if (FileUp.HasFile)
            {
                try
                {
                    clsXor encrypt = new clsXor();
                    string filename = Path.GetFileName(FileUp.FileName);
                    global = filename;
                    FileUp.SaveAs(Server.MapPath("~/") + filename);
                    // textFromFile.Text = "Upload status: File uploaded!";
                    String readPath = Server.MapPath("~/") + filename;
                    String fileText = File.ReadAllText(readPath);
                    String encryptedText = encrypt.encryption(fileText,"hidden");
                    textFromFile.Text = encryptedText;
                    lbl.Text = "You can see the encrypted file content above";
                    String writePath = Server.MapPath("~/") + "encrypted_" + filename;
                    StreamWriter sw = new StreamWriter(writePath);
                    sw.Write(textFromFile.Text);
                    sw.Close();
                }
                catch (Exception ex)
                {
                    textFromFile.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else
            {
                textFromFile.Text = "Please select file!";
                lbl.Text = "";
            }
        }

        protected void decryptFile_Click(object sender, EventArgs e)
        {
            if (FileUp.HasFile)
            {
                try
                {
                    clsXor decrypt = new clsXor();
                    string filename = Path.GetFileName(FileUp.FileName);
                    global = filename;
                    FileUp.SaveAs(Server.MapPath("~/Decryption/") + filename);
                    // textFromFile.Text = "Upload status: File uploaded!";
                    String readPath = Server.MapPath("~/Decryption/") + filename;
                    String fileText = File.ReadAllText(readPath);
                    textFromFile.Text = decrypt.decryption(fileText, "hidden");
                    lbl.Text = "You can see the decrypted file content above";
                    String writePath = Server.MapPath("~/") + "decrypted_" + filename;

                    StreamWriter sw = new StreamWriter(writePath);
                    sw.Write(textFromFile.Text);
                    sw.Close();
                }
                catch (Exception ex)
                {
                    textFromFile.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else
            {
                textFromFile.Text = "Please select file!";
                lbl.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHome.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string fromaddr = "jaiviru419@gmail.com";
            string toaddr = "ajumde@uncc.edu";//TO ADDRESS HERE
            string password = "JaiMaharashtra419";


            MailMessage msg = new MailMessage();
            msg.Subject = "Username &password";
            msg.From = new MailAddress(fromaddr);
            msg.Body = "Hello <br /> You have received an encrypted file <br /> Regards <br /> "+ fromaddr +"";
            msg.To.Add(new MailAddress(toaddr));
            String writePath = Server.MapPath("~/") + "File";
            try 
            {
                StreamWriter sw = new StreamWriter(writePath, false);
                sw.Write(textFromFile.Text);
                sw.Close();
            }
            catch(Exception exp){
                
            }
            Attachment data = new Attachment(
                         Server.MapPath("~/File"), "");
            msg.Attachments.Add(data);
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.EnableSsl = true;
            NetworkCredential nc = new NetworkCredential(fromaddr, password);
            smtp.Credentials = nc;
            try { 
            smtp.Send(msg);
            lbl.Text = "Tha Email is sent successfully";
            }
            catch(Exception excp){
            lbl.Text = "Tha Email is not sent";
            }
            msg.Dispose();
            File.Delete(Server.MapPath("~/") + "File");
        }

        protected void DwnldFile_Click(object sender, EventArgs e)
        {
          string FilePath = Server.MapPath("~/Decryption/");
            //string FileName = Path.GetFileName(FileUp.FileName); ;
          string FileName = FilePath + "trial.txt";
            // Creates the file on server
           File.WriteAllText(FileName, textFromFile.Text);

            // Prompts user to save file
            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.ContentType = "text/plain";
            response.AddHeader("Content-Disposition", "attachment; filename=" + FileName + ";");
            response.TransmitFile(FileName);
            response.Flush();

            // Deletes the file on server
            File.Delete(FileName);

            response.End();
           
        }
    }
}