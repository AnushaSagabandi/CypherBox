<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="CypherBox.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="css/Background.css" rel="stylesheet" />
    <style type="text/css">
        #form1 {
            height: 204px;
        }

.roundCorner
{
    border-radius: 25px;
    background-color: #4F81BD;
    color:#FFFFFF;
    text-align :center;
    font-family:arial, helvetica, sans-serif;
    padding: 5px 10px 10px 10px;
    font-weight:bold;
    width:100px;
    height:30px;
}
        </style>
</head>
<body style="height: 334px" background="mainpage.jpg">
    <form id="form1" runat="server">
     <div id="header"><br /><br />Welcome User! What would like to do next?</div>
        <br />
        <br />
        <br />
        <div>
        <table style="width: 76%;"> 
             <tr>
            <td>
           <asp:Button ID="Button5" runat="server"  CssClass="roundCorner" Text="View Messages" Width="509px" OnClick="Button5_Click" style="margin-left: 363px" Height="55px" />
                </td>
        </tr>         
        <tr>
            <td>
           <asp:Button ID="Button1" runat="server"  CssClass="roundCorner" Text="Simply encrypt and decrypt" Width="509px" OnClick="Button1_Click" style="margin-left: 363px" Height="55px" />
                </td>
        </tr>
        <tr>
            <td>
           
                <asp:Button ID="Button2" runat="server"  CssClass="roundCorner" Text="Send an encrypted message to another user" OnClick="Button2_Click" style="margin-left: 363px" Width="511px" Height="45px" />
           
            </td>
        </tr>
        <tr>
            <td>
            
                <asp:Button ID="Button3" runat="server"  CssClass="roundCorner" Text="Encrypt and decrypt a file" Width="510px" OnClick="Button3_Click" style="margin-left: 364px" Height="51px" />
            
            </td>
        </tr>
            <tr>
            <td>
            
                <asp:Button ID="Button4" runat="server"  CssClass="roundCorner" Text="Home" Width="200px"  style="margin-left: 364px" Height="51px" OnClick="Button4_Click" />
            
            </td>
        </tr>
        </table>

    </div>
    </form>
</body>
</html>
