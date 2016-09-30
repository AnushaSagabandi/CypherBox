<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchpage.aspx.cs" Inherits="CYPHER_BOX.searchpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_search" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Button_search" runat="server" Text="Search" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserName" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [registration] WHERE [UserName] = @UserName" InsertCommand="INSERT INTO [registration] ([FirstName], [LastName], [UserName], [Password], [Cpassword], [emailID]) VALUES (@FirstName, @LastName, @UserName, @Password, @Cpassword, @emailID)" SelectCommand="searchuser" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [registration] SET [FirstName] = @FirstName, [LastName] = @LastName, [Password] = @Password, [Cpassword] = @Cpassword, [emailID] = @emailID WHERE [UserName] = @UserName" OnSelecting="SqlDataSource1_Selecting">
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


        <div>
    
    </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBoxList ID="CheckBoxList_users" runat="server">
        </asp:CheckBoxList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:Button ID="Button_addselected" runat="server" OnClick="Button_addselected_Click" Text="Add Selected" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="TO"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_sendmessage" runat="server" Height="30px" Width="318px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Subject"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_subject" runat="server" Height="24px" Width="321px"></asp:TextBox>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Body"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_body" runat="server" Height="153px" Width="351px"></asp:TextBox>
        <br />
        <br/>
        <asp:Label ID="Label5" runat="server" Text="EncryptedMessage"></asp:Label>
        <br />
        <asp:TextBox ID="encryptedMessage" runat="server" Visible="False" Width="349px" Height="211px" style="margin-left: 262px"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button_sendmessage" runat="server" OnClick="Button_sendmessage_Click" Text="Send Message" />
   
        <br />
   
    </form>
</body>
</html>
