<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="OFOS.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
     <meta charset="utf-8"/>
    
    <link rel="stylesheet" href="alogin/css/stylenew.css" media="screen" type="text/css" />

    <title>Admin Login</title>
</head>

<body>
    <asp:Image ID="i" runat="server" ImageUrl="PIC\logo.png" Width="350px"  Height="150px"/>

    <div class="align">
        
    <div class="site__container">
    <center><font size="7">ADMIN LOGIN</font></center>
    <div class="grid__container">
        <form id="form1" runat="server" class="form form--login">
            
        <br />
        

            <center><asp:Label ID="status" runat="server" ForeColor="White" /></center>
            <br />
            <br />

        <div class="form__field">
           
          <asp:Label ID="lbl_login_admin" runat="server" CssClass="fontawesome-user" ForeColor="#3DFF33">
              <span class="hidden" >UserName</span></asp:Label>
                    
                &nbsp;&nbsp;&nbsp;
            
            <asp:TextBox ID="tb_admin" runat="server" placeholder="UserName"  CssClass="form__input" ></asp:TextBox>
        </div>
            <br />
            <br />
            
         <div class="form__field"> 
                
              <asp:Label ID="lbl_login_pwd" runat="server" CssClass="fontawesome-lock" ForeColor="#3DFF33">
                <span class="hidden">Password</span>    
              </asp:Label>
            
                &nbsp;&nbsp;&nbsp;
                   
            <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password" placeholder="Password" CssClass="form__input"></asp:TextBox>
        </div>
            <br />
            <br />
            <br />
            <br />
        <div class="form__field">
            <asp:Button ID="button_login_admin" CssClass="form__input" runat="server" Text="LOGIN" OnClick="Admin_Login_Click" />
        </div>
             </form>
          

    </div>
        </div>
    </div>
</body>
</html>
