<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="CYPHER_BOX.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
<h2> Done </h2>

<p>
    <strong>Your message has been successfully sent to following users:</strong></p>
    <asp:Label ID="lblSuccess" runat="server"></asp:Label><p>
        <strong>Your message could not be sent to following users: </strong>
    </p>
    <asp:Label ID="lblFail" runat="server"></asp:Label><br />
    <br />
    <br />
    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back To Inbox" />
    </div>
    </form>
</body>
</html>
