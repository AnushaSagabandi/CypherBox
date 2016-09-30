using System;
using BO;
using System.Data;
using System.Data.SqlClient;

namespace cypherBoxDataLayer
{
    public class SendMessageDAL
    {
        
        //SQL connection string 
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\MS UNC Charlotte\COURSE 4 SSDI Dr.Harini Ramaprasad\CypherBox\CypherBox\App_Data\cypherBox.mdf;Integrated Security=True");
       // SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Kavyasuma\Downloads\CypherBox\CypherBox\App_Data\cypherBox.mdf;Integrated Security=True");        
        SqlCommand cmd;
        public DataTable getuserlist_DAL()
        {
            SqlCommand cmd = null;
            DataTable table = new DataTable();

            cmd = new SqlCommand("GetUserList",conn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                conn.Open();

                SqlDataAdapter da = null;
                using (da = new SqlDataAdapter(cmd))
                {
                    da.Fill(table);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cmd.Dispose();
                cmd = null;
            }

            return table;

        }

        public DataTable getuserdetails_DAL(string UserName)
        {
            DataTable table=new DataTable();
            cmd = new SqlCommand("GetUserDEtails", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddRange(new SqlParameter[]{ new SqlParameter("@UserName", UserName)});
            cmd.Parameters.AddWithValue("@UserName", UserName);
            SqlDataAdapter da = null;
            using (da = new SqlDataAdapter(cmd))
            {
                da.Fill(table);
            }
            conn.Close();
            return table;                                                         

        }

        public bool SendMessage_DAL(string UserName, string sender, string subject, string body)
        {
            int result = 0;
            cmd = new SqlCommand("SendMessage", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@senderId", sender);
            cmd.Parameters.AddWithValue("@receiverId", UserName);
            cmd.Parameters.AddWithValue("@subject", subject);
            cmd.Parameters.AddWithValue("@body", body);
            conn.Open();
            result=cmd.ExecuteNonQuery();
            conn.Close();
            if (result >= 1)
            {
                return true;
            }
            return false;
            
        }
        public DataTable GetAllMessages(string UserName)
        {

            DataTable table = new DataTable();
            cmd = new SqlCommand("fetchmessage", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddRange(new SqlParameter[]{ new SqlParameter("@UserName", UserName)});
            cmd.Parameters.AddWithValue("@receiverID", UserName);
            SqlDataAdapter da = null;
            using (da = new SqlDataAdapter(cmd))
            {
                da.Fill(table);
            }
            conn.Close();
            return table;   
            
        }
}
    }
