<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OFOS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
     <link href="~/StyleSheet1.css" rel="stylesheet" type="text/css" runat="server"  />
    <style>

        input[type=text],input[type=password] {
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    background-color:#ffff4c;
    border-radius: 4px;
}

        .auto-style1 {
            height: 26px;
        }

    </style>
</head>
<body>
    <asp:Image ID="i" runat="server" ImageUrl="PIC\logo.png" Width="350px"  Height="150px"/>
    <center>
    <form id="form1" runat="server">

        <asp:Label ID="status0" runat="server" ForeColor="#3DFF33" Font-Bold="true" Font-Size="Large" Font-Names="arial"/>
        <br /><br /><br />
            <center>
                <asp:Button Text="REGISTERED USER" runat="server" Width="232px" OnClick="user_click" CssClass="b4" CausesValidation="false" />
                <asp:Button Text="GUEST" runat="server" Width="232px" OnClick="guest_click" CssClass="b4" CausesValidation="false"/>
                <br /><br />
                <h3><asp:Label ID="status" runat="server" ForeColor="white" font-size="Larger" Font-Names="arial" />
               </h3> <br />
              
            <div id="registered"  runat="server" visible="false">
           
                <table cellpadding="20">
                    <div class="form__field"> 
                    <tr>
                <td>
                    <h3><asp:Label ID="lbl_login_user" runat="server" CssClass="fontawesome-user"><span class="hidden" >USERNAME</span></asp:Label></h3>
                </td>
                <td>
                <asp:TextBox ID="tb_user" runat="server" Placeholder="USERNAME" CssClass="form__input" BackColor="#595959" />
                </td>
            </tr>
            <tr>
                <td>
                    <h3><asp:Label ID="lbl_login_pwd" runat="server" CssClass="fontawesome-lock"><span class="hidden">PASSWORD</span>    
              </asp:Label></h3>
                </td>
                <td>
                <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password" Placeholder="PASSWORD" CssClass="form__input" BackColor="#595959" />
                </td>
            </tr>
                     </div>   
        </table>
                <br />
                &emsp;
            <asp:Button ID="button_login" runat="server" Text="Login" OnClick="Login_Click" CssClass="button button2" Width="160px"></asp:Button>
        <asp:HyperLink ID="link_regi" runat="server" NavigateUrl="~/Registration.aspx" CssClass="button button2" Text="Create Account"/>
                </div>
        <div id="guest" runat="server" visible="false">
            
       <h3>
       <table cellpadding="20" style="align-items:center">
         <tr>
            <td style="text-align:right"><asp:Label ID="Label2" runat="server" Text="NAME : " ForeColor="white"></asp:Label></td>
            <td><asp:TextBox ID="tb_name" runat="server" BackColor="#595959"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="tb_name" ErrorMessage="Please provide your name."
                 ForeColor="Red" />
            </td>
                 
            </tr>
        <tr>
            <td style="text-align:right"><asp:Label ID="Label5" runat="server" Text="EMAIL ID : " ForeColor="white"></asp:Label></td>
            <td><asp:TextBox ID="tb_email" runat="server" BackColor="#595959"></asp:TextBox>
                <asp:RegularExpressionValidator id="rev_email" runat="server" 
                    ForeColor="Red"  ErrorMessage="This email is not in the correct format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tb_email" /> 
            </td>
        </tr>
        <tr>
            <td style="text-align:right"><asp:Label ID="Label6" runat="server" Text="CONTACT NO :" ForeColor="White"></asp:Label></td>
            <td><asp:TextBox ID="tb_contact" runat="server" BackColor="#595959"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rev_contact" runat="server" 
                ControlToValidate="tb_contact" ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits."
                 ForeColor="Red" /></td>
        </tr>
        <tr>
            <td style="text-align:right"><asp:Label ID="Label7" runat="server" Text="HOUSE NO :" ForeColor="white"></asp:Label></td>
            <td><asp:TextBox ID="tb_house" runat="server" BackColor="#595959"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align:right"><asp:Label ID="Label8" runat="server" Text="STREET" ForeColor="white"></asp:Label></td>
            <td><asp:TextBox ID="tb_street" runat="server" BackColor="#595959"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align:right" class="auto-style1"><asp:Label ID="Label9" runat="server" Text="CITY :" ForeColor="white"></asp:Label></td>
            <td class="auto-style1"><asp:DropDownList ID="DropDownList1_city" runat="server" BackColor="#595959" style="margin-left: 0px" Width="164px" Height="44px">
                <asp:ListItem>Surat</asp:ListItem>
                <asp:ListItem>Vadodara</asp:ListItem>
                <asp:ListItem>Ahemdabad</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        
            
        </table>
           </h3>
            <asp:Button ID="Button1_register" runat="server" Text="SUBMIT" 
                  OnClick="Button1_register_Click" CssClass="button button2"  />
                 
        </div>
            </center>
    </form>
       
    
</body>
</html>
