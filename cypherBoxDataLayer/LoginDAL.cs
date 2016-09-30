using System;
using BO;
using System.Data;
using System.Data.SqlClient;

namespace cypherBoxDataLayer
{
    public class LoginDAL
    {
        
        //SQL connection string 
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Administrator\Desktop\CypherBox\CypherBox\App_Data\cypherBox.mdf;Integrated Security=True");
       // SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename="F:\MS UNC Charlotte\COURSE 4 SSDI Dr.Harini Ramaprasad\CypherBox\CypherBox\App_Data\cypherBox.mdf";Integrated Security=True");        
        
        SqlCommand cmd;


        public int validate_user(RegistrationBO rbo)
        {
            try
            {
                cmd = new SqlCommand("validateuserdata", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", rbo.username);
                cmd.Parameters.AddWithValue("@Password", rbo.password);
                conn.Open();

                SqlDataReader read = cmd.ExecuteReader();
                read.Read();
                if(read.HasRows)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }

        }
    }
}
