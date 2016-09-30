<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewmessage.aspx.cs" Inherits="CypherBox.viewmessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
        
            <table border="1" bordercolor="Thistle" width="100%">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <tr>
                            <td align="left" width="30"><strong>Sender</strong> </td>
                            <td align="left" width="40%"><strong>Subject</strong> </td>
                            <td align="left" width="25%"><strong>Date</strong> </td>
                            <td align="left" width="5%"><strong>--</strong> </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblSender" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.senderID")%>'></asp:Label>
                            </td>
                            <td align="left">
                                <asp:HyperLink ID="hprSubject" runat="server" NavigateUrl='<%#DataBinder.Eval(Container, "DataItem.MessageID", "ReadMail.aspx?id={0}")%>'><%#DataBinder.Eval(Container,"DataItem.subject")%></asp:HyperLink>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.datentime")%>'></asp:Label>
                            </td>
                            <td align="left"><strong>
                                <asp:Label ID="lblStatus" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.status")%>'></asp:Label>
                                </strong></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        
  
    

    </form>
</body>
</html>
