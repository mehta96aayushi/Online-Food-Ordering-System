<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineTrans.aspx.cs" Inherits="OFOS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Online Transaction</title>
    
            <link href="~/StyleSheet1.css" rel="stylesheet" type="text/css" runat="server"  />
    <style>
        input[type=text],input[type=password] {
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    background-color:#595959;
    border-radius: 1px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
       

        <center><font size="7" color="#00ccff"><b><u> ONLINE TRANSACTION</u></b></font> 
            <p> &nbsp;</p>
       <h3><b><asp:Label ID="Label1" runat="server" Text="" ForeColor="white"></asp:Label></b></h3>
        </center>  <b> <font color="#00ccff">
        <p> &nbsp;</p>
        <p style="margin-left: 40px"> NAME :&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
                <asp:TextBox ID="Name" runat="server" Width="228px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                Display="Dynamic" ControlToValidate="Name" ForeColor="red" Font-Size="Medium"></asp:RequiredFieldValidator>
        &nbsp;</p>
        <p style="margin-left: 40px"> ACCOUNT NO :&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:TextBox ID="Acc_no" runat="server" Width="228px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                Display="Dynamic" ControlToValidate="Acc_no" ForeColor="red" Font-Size="Medium"></asp:RequiredFieldValidator>
        
        </p>
        <p style="margin-left: 40px"> ACCOUNT PASSWORD :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Acc_pwd" runat="server" Width="228px" TextMode="Password"  ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*"
                Display="Dynamic" ControlToValidate="Acc_pwd" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
        
        </p></font></b> 
        <p style="margin-left: 40px"> &nbsp;</p>
        <center>
            <asp:Button ID="Button1" runat="server" Text="PAY" OnClick="Button1_Click" 
                 CssClass="button button2" />
            <asp:Button ID="Button2" runat="server" Text="CONTINUE WITH COD" OnClick="Button2_Click" 
                 CssClass="button button2" CausesValidation="false" />
        </center>

    </form>
</body>
</html>
