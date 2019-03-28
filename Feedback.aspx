<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="OFOS.Feedback" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Page</title>
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
    
    <form id="form1" runat="server">

        

        <asp:Button CssClass="b1" Text="Sign Out" ID="b" runat="server" OnClick="LogOut_click" />
        <asp:Button CssClass="b1"  id="Home" Text="Home Page" OnClick="Home_click" runat="server"/>
       
        <h2><asp:Label Style="float:right; color:white; margin-right:30px;" ID="l" runat="server" />
           <asp:Label ID="l2" Style="float:right; color:white;" Text="Hello&nbsp" runat="server" />
        </h2>

        <asp:Image ID="i" runat="server" ImageUrl="PIC\logo.png" Width="350px"  Height="150px"/>
        <br /><br /><br />
        
        <center><font size="7" color="#00ccff"><b><u>FEEDBACK</u></b></font> 
        
        <br />
        <br />
        <h3><b><asp:Label ID="Lbl_status" runat="server" Text="" Visible="false" ForeColor="white"/>
        </b></h3>
        <br />
        <br />
        <h2><font color="#00ccff">Enter your Review</h2><br />
        <asp:TextBox ID="tb_fd" runat="server" textmode="MultiLine" CssClass="textarea" Height="104px" Width="298px" />
        <br />
        <br />

        <asp:Button ID="Btn1" runat="server" Text="Submit" OnClick="Btn1_Click" CssClass="button button2" />

        </center>
    </form>
        
</body>
</html>
