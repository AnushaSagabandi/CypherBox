<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="CYPHER_BOX.Loginpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
  <title></title>
    <link href="css/Background.css" rel="stylesheet" />
        <style>
.roundCorner
{
    border-radius: 25px;
    background-color: #4F81BD;
    color:#FFFFFF;
    text-align :center;
    font-family:arial, helvetica, sans-serif;
    padding: 5px 10px 10px 10px;
    font-weight:bold;
    }
    </style>
  </head>
<body>
     <div id="header">
         <br />
         <br />

         LOGIN
     </div>
    <div id="left1">

    </div>
    <form id="form1" runat="server">
        <br /><br /><br />
        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<asp:TextBox ID="TextBox_username" CssClass="roundCorner" runat="server" Width="153px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_username" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_username" Display="Dynamic" ErrorMessage="Length must be between 7 to 15 characters" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z0-9\s]{7,15}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_password" runat="server" CssClass="roundCorner" TextMode="Password" Width="155px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_password" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_password" Display="Dynamic" ErrorMessage="Length must be between 7 to 15 characters" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z0-9\s]{7,15}$"></asp:RegularExpressionValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <div >
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" CssClass="roundCorner" runat="server" OnClick="Button1_Click" Text="Login"  Font-Names="Aharoni" Font-Overline="False" Font-Size="Small" Height="29px" Width="113px" />
       </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="label_incorrectlogin" runat="server" Font-Size="Small" ForeColor="#FF3300"></asp:Label>
        <div id="" style="height: 44px"></div>
    </form>
     
</body>
</html>
