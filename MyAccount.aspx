<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="DemoPro.MyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Account</title>

    <link href="~/StyleSheet1.css" rel="stylesheet" type="text/css" runat="server"  />
    <style>
textarea {
    width: 100%;
    height: 150px;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px;
    border-radius: 1px;
    background-color:#595959;
    font-size: 16px;
    resize: none;
}
</style>

</head>
<body>
    <center>
        <form id="form1" runat="server">    
            <br />
            <asp:Button CssClass="b1" Text="Sign Out" ID="b" runat="server" OnClick="Logout1_click" />
            <asp:Button CssClass="b1" Text="Go Back" ID="btn_back" runat="server" OnClick="goBack_click" />
           
            <br /><br /><br />
            <asp:DetailsView ID = "AccDetails" runat = "server" AutoGenerateRows = "False" DataSourceID = "sql1" 
                onDataBound="AccDetails_DataBound" onItemUpdating="AccDetails_ItemUpdating"
                 CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <Fields>
                    <asp:BoundField DataField = "Username" HeaderText = "Username" ReadOnly = "True" />
                    
                    <asp:Templatefield HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="lblpwd" runat="server" Text='<%#Eval("Password") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="tbpwd" runat="server" />
                            <asp:RequiredFieldValidator id="rfv1" runat="server" ErrorMessage="Please provide password." ControlToValidate="tbpwd" />
                        </EditItemTemplate>
                    </asp:Templatefield>

                    <asp:Templatefield HeaderText="Email ID">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Email") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="tbemail" runat="server" />
                            <asp:RegularExpressionValidator id="rev_email" runat="server" ErrorMessage="Your email is not in the correct format." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbemail" />
                        </EditItemTemplate>
                    </asp:Templatefield>
                    
                    <asp:Templatefield HeaderText="Contact No">
                        <ItemTemplate>
                            <asp:Label ID="lblcnt" runat="server" Text='<%#Eval("Contact_no") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="tbcnt" runat="server" />
                            <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="tbcnt" 
                                ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits." />
                        </EditItemTemplate>
                    </asp:Templatefield>

                    <asp:BoundField DataField = "House_no" HeaderText = "Your House_no" />
                    <asp:BoundField DataField = "Street" HeaderText = "Your Street" />
                  
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("City") %>' />
                        </ItemTemplate>                        
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlcity" runat="server">
                                <asp:ListItem>Surat</asp:ListItem>
                                <asp:ListItem>Vadodara</asp:ListItem>
                                <asp:ListItem>Ahemdabad</asp:ListItem>
                            </asp:DropDownList> 
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ButtonType="Button"/>
                </Fields>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
            </asp:DetailsView>

            <asp:Sqldatasource ID="sql1" runat="server" 
            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True"
            SelectCommand="select Username, Password, Email, Contact_no, House_no, Street, City from [dbo].[Customers]
                 where Username=@Username"
            UpdateCommand="update [dbo].[Customers] set Password=@Password, Email=@Email, Contact_no=@Contact_no,
                 House_no=@House_no, Street=@Street, City=@City where Username=@Username">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="user" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Contact_no" Type="String" />
                    <asp:Parameter Name="House_no" Type="String" />
                    <asp:Parameter Name="Street" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:SessionParameter Name="Username" SessionField="user" />
                </UpdateParameters>
            </asp:Sqldatasource>

            <br /><br />
            <asp:Label ID="lbl1" runat="server" Text="" ForeColor="white"></asp:Label>
        </form>
     </center>
</body>
</html>
