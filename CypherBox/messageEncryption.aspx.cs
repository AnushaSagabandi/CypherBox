using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using encryptionBusinessLayer;
using BAL;

namespace CypherBox
{
    public partial class mesasgeEncryption : System.Web.UI.Page
    {
        private static string _b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk.mnopqrstuvwxyz-123456789+/=";

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Encrypt_Click(object sender, EventArgs e)
        {
            string data = messageInput.Text;
            string key = "hidden";
            
            clsXor encryptclass = new clsXor();
            encryptedMessage.Text =  encryptclass.encryption(data,key);
        }

           

        protected void Decrypt_Click(object sender, EventArgs e)
        {
            string data = messageInput.Text;
            string key = "hidden";
           clsXor decryptclass = new clsXor();
           encryptedMessage.Text = decryptclass.decryption(data, key);
        }

      

    }
}