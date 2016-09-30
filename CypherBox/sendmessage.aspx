<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sendmessage.aspx.cs" Inherits="CYPHER_BOX.sendmessage" %>

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
    <div id="header">
    <br /><br />Send Encrypted Messages!
    </div>
        <div>
   
    </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br /><br />
        <asp:TextBox ID="TextBox_search" CssClass="roundCorner" runat="server" style="margin-left: 3px" Width="392px"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Button_search" CssClass="roundCorner" runat="server" Text="Search" OnClick="Button_search_Click" />
        <br />
        <br />
       <div style="width:418px; height:150px; overflow:scroll;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserName" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="357px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>  
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                <asp:BoundField DataField="emailID" HeaderText="emailID" SortExpression="emailID" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
         </div>  
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [registration] WHERE [UserName] = @UserName" InsertCommand="INSERT INTO [registration] ([FirstName], [LastName], [UserName], [Password], [Cpassword], [emailID]) VALUES (@FirstName, @LastName, @UserName, @Password, @Cpassword, @emailID)" SelectCommand="searchuser" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [registration] SET [FirstName] = @FirstName, [LastName] = @LastName, [Password] = @Password, [Cpassword] = @Cpassword, [emailID] = @emailID WHERE [UserName] = @UserName">
            <DeleteParameters>
                <asp:Parameter Name="UserName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Cpassword" Type="String" />
                <asp:Parameter Name="emailID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox_search" Name="FirstName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox_search" Name="LastName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox_search" Name="UserName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox_search" Name="emailID" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Cpassword" Type="String" />
                <asp:Parameter Name="emailID" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


       
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" CssClass="roundCorner" runat="server" Text="TO"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_sendmessage" CssClass="roundCorner" runat="server" Height="30px" Width="329px"></asp:TextBox>
        <br />
        <br />
        &nbsp;<asp:Label ID="Label2" CssClass="roundCorner" runat="server" Text="Subject"></asp:Label>
        &nbsp;
        <asp:TextBox ID="TextBox_subject" CssClass="roundCorner" runat="server" Height="24px" Width="323px"></asp:TextBox>
        <br />
        <br />
        <br />
        
        <asp:Label ID="Label3" CssClass="roundCorner" runat="server" Text="Body"></asp:Label>
        <br />

        <br />

        <asp:TextBox ID="TextBox_body" runat="server" CssClass="roundCorner" Height="153px" Width="414px" ></asp:TextBox>
        <br />
        <asp:TextBox ID="encryptedMessage" CssClass="roundCorner" runat="server" Visible="False" Width="349px" Height="38px" style="margin-left: 262px; margin-right: 0px;"></asp:TextBox>
        <br />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button_sendmessage" CssClass="roundCorner" runat="server" OnClick="Button_sendmessage_Click"  OnClientClick="javascript:return confirm('Are you sure you want to send?');" Text="Send Message" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" CssClass="roundCorner" runat="server" Text="Home" OnClick="Button1_Click" />
        <br />
   
    </form>
</body>
</html>
