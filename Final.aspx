<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Final.aspx.cs" Inherits="OFOS.Final" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Page</title>
     <link href="~/StyleSheet1.css" rel="stylesheet" type="text/css" runat="server"  />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="status" runat="server" Text="Sign out" Visible="false"/>
        <asp:Button CssClass="b1" Text="Thank You!" ID="btn_ty" runat="server" OnClick="thankYou_click" Visible="false" />
        <asp:Button CssClass="b1" Text="Sign Out" ID="b" runat="server" OnClick="Logout1_click" />
        <asp:Button CssClass="b1"  id="btn_fd" Text="Feedback" OnClick="FeedBack_click" runat="server" Visible="false" />      
      
        <h2><asp:Label Style="float:right; color:white; margin-right:30px;" ID="l" runat="server" />
           <asp:Label ID="l2" Style="float:right; color:white;" Text="Hello&nbsp" runat="server" />
       </h2>
      <br /><br /><br /><br />
        <center> 
         <h3><asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#00ccff"></asp:Label></h3>
        <br />
               
             <asp:Button ID="BtnHome" runat="server" CssClass="button button2" Text="GO BACK TO HOME PAGE" OnClick="BtnHome_click" />
       </center>

    </div>
    </form>
</body>
</html>
