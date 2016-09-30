using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
//using encryptionBusinessLayer;
using cypherBoxDataLayer;
using BAL;
using System.Data;
using BO;

namespace CypherBox.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Loginofexistinguser()
        {
            int expected = 1;

            string username = "aditya123";
            string password = "aditya123";
            RegistrationBO rbo = new RegistrationBO();
        //    RegistrationBAL rbal = new RegistrationBAL();
            LoginBAL rbal = new LoginBAL();
            LoginDAL rDAL = new LoginDAL();

            rbo.username = username;
            rbo.password = password;

            int Actual = rDAL.validate_user(rbo);

            Assert.AreEqual(expected, Actual);
        }

        [TestMethod]
        public void Loginwithwrongusername()
        {
            int expected = 0;

            string username = "AXDRED12";
            string password = "123qwe";
            RegistrationBO rbo = new RegistrationBO();
            LoginBAL rbal = new LoginBAL();
            LoginDAL rDAL = new LoginDAL();

            rbo.username = username;
            rbo.password = password;

            int Actual = rDAL.validate_user(rbo);

            Assert.AreEqual(expected, Actual);
        }

        [TestMethod]
        public void Loginwithwrongpassword()
        {
            int expected = 0;

            string username = "AXDRED1";
            string password = "123qwe3";
            RegistrationBO rbo = new RegistrationBO();
            LoginBAL rbal = new LoginBAL();
            LoginDAL rDAL = new LoginDAL();

            rbo.username = username;
            rbo.password = password;

            int Actual = rDAL.validate_user(rbo);

            Assert.AreEqual(expected, Actual);
        }

        [TestMethod]
        public void Loginwithwrongpasswordandusername()
        {
            int expected = 0;

            string username = "AXDRED12";
            string password = "123qwe3";
            RegistrationBO rbo = new RegistrationBO();
            LoginBAL rbal = new LoginBAL();
            LoginDAL rDAL = new LoginDAL();

            rbo.username = username;
            rbo.password = password;

            int Actual = rDAL.validate_user(rbo);

            Assert.AreEqual(expected, Actual);
        }


        [TestMethod]
        public void TestEncryption()
        {
            string testString = "I like it this way";
            string expected = "IdS/A5GPERGHQ5CbEZSrEdCzAdKDQpGnApG3";
            clsXor BizEncryDecry = new clsXor();
            string Actual=BizEncryDecry.encryption(testString,"hidden");
            StringAssert.Contains(expected,Actual);
        }

        [TestMethod]
        public void TestDecryption()
        {
            string testString = "IdS/A5GPERGHQ5CbEZSrEdCzAdKDQpGnApG3";
            string expected = "I like it this way";
            clsXor BizEncryDecry = new clsXor();
            string Actual = BizEncryDecry.decryption(testString, "hidden");
            StringAssert.Contains(expected, Actual);
        }

        [TestMethod]

        //Test with inexistent user name and sender, test fails because of foriegn key reference

        public void InsertMessage1()
        {

            //Instialising the variables for the method

            string UserName = "asd";
            string sender = "miunh";
            string subject = "This is subject";
            string body = "This is the body of the message";

            //creating instances for classes
            SendMessageDAL sDAL = new SendMessageDAL();
            try
            {
                sDAL.SendMessage_DAL(UserName, sender, subject, body);
                Assert.Fail("Expected exception");
            }
            catch (Exception)
            {
                // Expected
            }




        }

        [TestMethod]

        //Test with inexistent sender, test fails because of foriegn key reference

        public void InsertMessage2()
        {

            //Instialising the variables for the method

            string UserName = "abc12345";
            string sender = "miunh";
            string subject = "This is subject";
            string body = "This is the body of the message";

            //creating instances for classes
            SendMessageDAL sDAL = new SendMessageDAL();

            try
            {
                sDAL.SendMessage_DAL(UserName, sender, subject, body);
                Assert.Fail("Expected exception");
            }
            catch (Exception)
            {
                // Expected
            }

        }

        [TestMethod]

        //Test with inexistent user name,test fails because of foriegn key reference

        public void InsertMessage3()
        {

            //Instialising the variables for the method

            string UserName = "asd";
            string sender = "abc12345";
            string subject = "This is subject";
            string body = "This is the body of the message";

            //creating instances for classes
            SendMessageDAL sDAL = new SendMessageDAL();

            try
            {
                sDAL.SendMessage_DAL(UserName, sender, subject, body);
                Assert.Fail("Expected exception");
            }
            catch (Exception)
            {
                // Expected
            }

        }

        [TestMethod]

        //Test with existing user name and sender, test should pass.

        public void InsertMessage4()
        {

            //Expected value for the test case to pass

            bool expected = true;

            //Instialising the variables for the method

            string UserName = "abc1234";
            string sender = "abc12345";
            string subject = "This is subject";
            string body = "This is the body of the message";

            //creating instances for classes
            SendMessageDAL sDAL = new SendMessageDAL();

            //getting return value from method

            bool Actual = sDAL.SendMessage_DAL(UserName, sender, subject, body);

            //actual testing

            Assert.AreEqual(expected, Actual);

        }

        [TestMethod]

        //Test with null username, test fails because of foriegn key reference

        public void InsertMessage5()
        {

            //Instialising the variables for the method

            string UserName = "";
            string sender = "miunh";
            string subject = "This is subject";
            string body = "This is the body of the message";

            //creating instances for classes
            SendMessageDAL sDAL = new SendMessageDAL();

            try
            {
                sDAL.SendMessage_DAL(UserName, sender, subject, body);
                Assert.Fail("Expected exception");
            }
            catch (Exception)
            {
                // Expected
            }

        }
        [TestMethod]

        //Test with null sender, test fails because of foriegn key reference
        public void InsertMessage6()
        {
            //Instialising the variables for the method

            string UserName = "asd";
            string sender = "";
            string subject = "This is subject";
            string body = "This is the body of the message";

            //creating instances for classes
            SendMessageDAL sDAL = new SendMessageDAL();

            try
            {
                sDAL.SendMessage_DAL(UserName, sender, subject, body);
                Assert.Fail("Expected exception");
            }
            catch (Exception)
            {
                // Expected
            }

        }

        [TestMethod]

        //Test with null subject and body, test should pass

        public void InsertMessage7()
        {

            //Expected value for the test case to pass

            bool expected = true;

            //Instialising the variables for the method

            string UserName = "abc1234";
            string sender = "abc12345";
            string subject = "";
            string body = "";

            //creating instances for classes
            SendMessageDAL sDAL = new SendMessageDAL();

            //getting return value from method

            bool Actual = sDAL.SendMessage_DAL(UserName, sender, subject, body);

            //actual testing

            Assert.AreEqual(expected, Actual);

        }

        [TestMethod]
        //Test the the sql stored procedure returns a non empty table as table is not empty.
        public void Testgetuserlist()
        {
            SendMessageDAL sDAL = new SendMessageDAL();
            DataTable table = sDAL.getuserlist_DAL();
            int count = table.Rows.Count;
            Assert.IsTrue(count > 0);
        }

        [TestMethod]
        //Test the sql stored procedure that should return a non empty table as the userName exists.
        public void getuserdetails()
        {
            string userName = "abc1234";
            SendMessageDAL sDAL = new SendMessageDAL();
            DataTable table = sDAL.getuserdetails_DAL(userName);
            int count = table.Rows.Count;
            Assert.IsTrue(count > 0);
            //Assert.IsNotNull(sDAL.getuserdetails_DAL(userName));
        }

        [TestMethod]
        //Test the sql stored procedure that should return an empty table as the userName doesn't exist.
        public void getuserdetails_fail()
        {
            string userName = "abc";
            SendMessageDAL sDAL = new SendMessageDAL();
            DataTable table = sDAL.getuserdetails_DAL(userName);
            int count = table.Rows.Count;
            Assert.IsTrue(count == 0);
        }


    }
}
