<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OFOS.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>

	<title>Registration page</title>

	<link rel="stylesheet" href="assets/demo.css"/>
	<link rel="stylesheet" href="assets/form-basic.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"/>
    
        <style>

        /* cellpadding */
    th, td { padding: 5px; }

    /* cellspacing */
    table { border-collapse: separate; border-spacing: 5px; } /* cellspacing="5" */
    table { border-collapse: collapse; border-spacing: 0; }   /* cellspacing="0" */

    /* valign */
    th, td { vertical-align: central; }

    /* align (center) */
    table { margin: 0 auto; }
    </style>
</head>
<body style="background-color:#222930;">
    
    <asp:Image ID="i" runat="server" ImageUrl="PIC\logo.png" Width="350px"  Height="150px"/>
    <center>

    <form id="form1" runat="server" class="form-basic">
    <p style=" text-align:right" >
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClick="LinkButton1_Click">Home Page</asp:LinkButton>
     </p>
            
        <div class="main-content"> 
        <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             <br />
            <br />
             <div class="form-title-row">
                <h1>REGISTRATION</h1>
             </div>   
            
            <br />
            <h3> <asp:Label ID="lblStatus" runat="server" Text=""  ForeColor="Green"></asp:Label>
            </h3><br /><br />    
          <table border="0" title="YOUR MEMBERSHIP!!"  >
            <tr>
              <td style="text-align:right"><asp:Label ID="Label1" runat="server" Text="Username : "></asp:Label></td>
                <td style="text-align:left"><asp:TextBox ID="tb_username" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2">   
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
              <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="Username must be provided." 
                  Display="Dynamic" ControlToValidate="tb_username" ForeColor="Red" Font-Size="Small" /> 
            </td></tr>
            <tr>
                <td style="text-align:right"><asp:Label ID="Label2" runat="server" Text="Name : "></asp:Label></td>
                <td style="text-align:left"><asp:TextBox ID="tb_name" runat="server"></asp:TextBox></td>
            </tr>
              <tr><td></td></tr><tr><td></td></tr>
            <tr>
                <td style="text-align:right"><asp:Label ID="Label3" runat="server" Text="Password : "></asp:Label></td>
                <td style="text-align:left"><asp:TextBox ID="tb_pwd" runat="server" TextMode="Password"></asp:TextBox></td>

            </tr>
            <tr><td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfv_pwd" runat="server" ErrorMessage="You must enter a password." 
                    Display="Dynamic" ControlToValidate="tb_pwd" ForeColor="Red" Font-Size="Small" /></td>
            </tr>
            <tr>
                <td style="text-align:right"><asp:Label ID="Label4" runat="server" Text="Reenter Password : "></asp:Label></td>
                <td style="text-align:left"><asp:TextBox ID="tb_repwd" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator id="cv_repwd" runat="server" ErrorMessage="Your password does not match." 
                    ControlToCompare="tb_pwd" ControlToValidate="tb_repwd" ForeColor="Red" Font-Size="Small" /> 
            </td></tr>
            <tr>
                <td style="text-align:right"><asp:Label ID="Label5" runat="server" Text="Email ID : "></asp:Label></td>
                <td style="text-align:left"><asp:TextBox ID="tb_email" runat="server"></asp:TextBox></td>
            </tr>
        <tr><td colspan="2"> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:RegularExpressionValidator id="rev_email" runat="server" ErrorMessage="This email is not in the correct format." 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tb_email"
                ForeColor="Red" Font-Size="Small" /> 
        </td></tr>
        <tr>
            <td style="text-align:right"><asp:Label ID="Label6" runat="server" Text="Contact No. : "></asp:Label></td>
            <td style="text-align:left"><asp:TextBox ID="tb_contact" runat="server"></asp:TextBox></td>
        </tr>
        <tr><td colspan="2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="tb_contact" 
                ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits."
                ForeColor="Red" Font-Size="Small" />
        </td></tr>
        <tr>
            <td style="text-align:right"><asp:Label ID="Label7" runat="server" Text="House No. : "></asp:Label></td>
            <td style="text-align:left"><asp:TextBox ID="tb_house" runat="server"></asp:TextBox></td>
        </tr>
        <%--<tr><td colspan="2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:RegularExpressionValidator ID="rev_cntct" runat="server" ControlToValidate="tb_house" 
                ValidationExpression="[a-z]+[A-Z]+" ErrorMessage="Please enter upto 10 characters."
                ForeColor="Red" Font-Size="Small" />
        </td></tr>--%>         
        <tr>
            <td style="text-align:right"><asp:Label ID="Label8" runat="server" Text="Street:"></asp:Label></td>
            <td style="text-align:left"><asp:TextBox ID="tb_street" runat="server"></asp:TextBox></td>
        </tr>
              <tr><td></td></tr><tr><td></td></tr>
        <tr>
            <td style="text-align:right"><asp:Label ID="Label9" runat="server" Text="City:"></asp:Label></td>
            <td style="text-align:left">
                <asp:DropDownList ID="DropDownList1_city" runat="server" style="margin-left: 0px" Width="240px" >
                <asp:ListItem>Surat</asp:ListItem>
                <asp:ListItem>Vadodara</asp:ListItem>
                <asp:ListItem>Ahemdabad</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        </table>
            <br /><br />
        <asp:Button ID="Button1_register" runat="server" Text="Register Me" OnClick="Button1_register_Click" />
        <br />
               </div>
    </form>
        
    </center>


        
</body>
</html>
