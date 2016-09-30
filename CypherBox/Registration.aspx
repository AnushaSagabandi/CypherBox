<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CYPHER_BOX.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form id="form1" runat="server">
        <div id="header">Registration</div>
        <div id="left1"></div>
    <div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Label ID="Label1" runat="server" Text="Sign Up"></asp:Label>
        <br />
        <br />
        <br />
    
    </div>
        <asp:Label ID="Label2" runat="server" CssClass="roundCorner" Text="First Name *"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_firstname" CssClass="roundCorner"  runat="server" Width="141px"></asp:TextBox>
&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_firstname" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_firstname" Display="Dynamic" ErrorMessage="Enter letters only" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" CssClass="roundCorner" Text="Last Name *"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_lastname" CssClass="roundCorner" runat="server" Width="142px"></asp:TextBox>
&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_lastname" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_lastname" Display="Dynamic" ErrorMessage="Enter letters only" Font-Italic="False" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" CssClass="roundCorner" Text="User Name *"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox_username" CssClass="roundCorner" runat="server" Width="144px"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_username" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox_username" Display="Dynamic" ErrorMessage="User Name length must be between 7 to 10 characters" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="[a-zA-Z0-9\s]{7,15}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" CssClass="roundCorner" Text="Password *"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox_password" CssClass="roundCorner" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_password" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox_password" Display="Dynamic" ErrorMessage="password length must be between 7 to 10 characters" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="[a-zA-Z0-9\s]{7,15}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label6" CssClass="roundCorner" runat="server" Text="Confirm Password *"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox_cpassword" CssClass="roundCorner" runat="server" TextMode="Password" Width="139px"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_cpassword" Display="Dynamic" ErrorMessage="*" Font-Size="Small" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_password" ControlToValidate="TextBox_cpassword" Display="Dynamic" ErrorMessage="Passwords don't match" Font-Size="Small" ForeColor="#FF3300"></asp:CompareValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox_cpassword" Display="Dynamic" ErrorMessage="password length must be between 7 to 10 characters" Font-Size="X-Small" ForeColor="#FF3300" ValidationExpression="[a-zA-Z0-9\s]{7,15}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label7" CssClass="roundCorner" runat="server" Text="Email ID *"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox_emailid" CssClass="roundCorner" runat="server" Width="147px"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox_emailid" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox_emailid" Display="Dynamic" ErrorMessage="Please enter valid Email ID" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button_submitregistration" CssClass="roundCorner" runat="server" OnClick="Button_submitregistration_Click" Text="Sign Up" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label_errormessage" runat="server" Font-Size="Small" ForeColor="#FF3300"></asp:Label>
        </form>
</body>
</html>
