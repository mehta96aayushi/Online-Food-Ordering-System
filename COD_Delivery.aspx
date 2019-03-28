<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COD_Delivery.aspx.cs" Inherits="OFOS.COD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> COD Delivery</title>
         <link href="~/StyleSheet1.css" rel="stylesheet" type="text/css" runat="server"  />
    <style>
        input[type=text] {
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border-radius: 1px;
    background:#595959;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

           <asp:Button CssClass="b1" Text="Sign Out" ID="b" runat="server" OnClick="LogOut_click" />
           <asp:Button CssClass="b1" Text="Thank You!" ID="b1" runat="server" OnClick="LogOut_click" />
     
      
        <h2><asp:Label Style="float:right; color:white; margin-right:30px;" ID="l" runat="server" />
           <asp:Label ID="l2" Style="float:right; color:white;" Text="Hello&nbsp" runat="server" />
       </h2>
      <br />
        <br />
     
        <center>&emsp;&emsp;&emsp;&emsp;<font size="7" color="#00ccff"><b><u>CASH ON DELIVERY</u></b> </font></center>
            <br />
            <br />
        <center>
                <h3><b><asp:Label ID="Label1" runat="server" Text="" ForeColor="White" ></asp:Label></b></h3>
        <br />
       </center>

        <b><font color="#00ccff">
        
        <p>    &nbsp;</p>
        <p style="margin-left: 40px">
            NAME :&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name" runat="server" Width="240px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="Name must be provided"
                Display="Dynamic" ControlToValidate="Name" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
            </p>
        <p style="margin-left: 40px">
            HOUSE NO :&emsp;&emsp;&nbsp;
            <asp:TextBox ID="House_no" runat="server" Width="240px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ErrorMessage="House no must be provided"
                Display="Dynamic" ControlToValidate="House_no" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>

        </p>
        <p style="margin-left: 40px">
            STREET :&emsp;&emsp;&emsp;&nbsp;&nbsp;
            <asp:TextBox ID="Street" runat="server" Width="240px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please provide the street"
                Display="Dynamic" ControlToValidate="Street" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 40px">
            CITY :&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:DropDownList ID="D_city" runat="server" style="margin-left: 0px" Width="164px" Height="44px" BackColor="#595959">
                <asp:ListItem>Ahmedabad</asp:ListItem>
                <asp:ListItem>Surat</asp:ListItem>
                <asp:ListItem>Vadodara</asp:ListItem>
                </asp:DropDownList>
       
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ErrorMessage="Enter the city"
                Display="Dynamic" ControlToValidate="D_city" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 40px">
            CONTACT NO :&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Contact" runat="server" Width="240px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter your contact number"
                Display="Dynamic" ControlToValidate="Contact" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
        
            <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="Contact" 
                ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits."
                ForeColor="Red" Font-Size="Small" />
        </p><br />
        <p style="margin-left: 320px">
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:Button ID="Button2" runat="server" Text="DELIVER" OnClick="Button2_Click" CssClass="button button2" />
        </p>
    </font></b>
            </div>
        </form>
    
</body>
</html>
