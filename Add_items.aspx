<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_items.aspx.cs" Inherits="OFOS.Add_items" %>

<!DOCTYPE html>


    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Add Items</title>
     <!-- Bootstrap Core CSS -->
    <link href="sidebar/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="sidebar/css/simple-sidebar.css" rel="stylesheet"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
 <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            
            <ul class="sidebar-nav">
               
                <li class="sidebar-brand">
                    
                       <font color="#3DFF33"><u><b>ADMIN FEATURES</b></u></font>

                </li>
                <li>
                    <a href="Update_Menu.aspx">Update Menu</a>
                </li>
                <li>
                    <a href="Manage_COD.aspx">Manage COD</a>
                </li>
                <li>
                    <a href="Review_fb.aspx">Review Feedback</a>
                </li>
                <li>
                    <a href="AdminSearch.aspx">Search</a>
                </li>
                
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        

         <form id="form1" runat="server">
             
        <p style="margin-left:950px">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="false"  CssClass="btn-link">LogOut</asp:LinkButton>
             
        </p>
      
        <br />
      <div>
              <center><h1> ADD ITEM </h1></center>
          </div>
    
        <p>
            &nbsp;</p>
        <p style="margin-left: 30px">
            <h5><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h5>
        </p>
        <p>
            &nbsp;</p>
        <p style="margin-left: 40px; width: 900px;">
            <b>ITEM NO :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Width="500px" CssClass=" form-control-static"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Item_Id required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>ITEM NAME :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Item Name required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
        
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>TYPE :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="dropdown_type" runat="server" Width="500px" CssClass=" form-control-static">
                <asp:ListItem>SOUPS</asp:ListItem>
                <asp:ListItem>STARTERS</asp:ListItem>
                <asp:ListItem>RICE</asp:ListItem>
                <asp:ListItem>NOODLES</asp:ListItem>
                <asp:ListItem>MAIN COURSE</asp:ListItem>
                <asp:ListItem>DESSERTS</asp:ListItem>
            </asp:DropDownList>

        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>PRICE :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Item Price required" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
        
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>DESCRIPTION :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>IMAGE URL :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
        </p>
        <p style="margin-left: 40px">
            &nbsp;</p>
        <p style="margin-left: 400px">
            <asp:Button ID="Button1" runat="server" CssClass=" btn" Height="32px" OnClick="Button1_Click" Text="ADD " Width="100px"  />
         </p>
        <p>
            &nbsp;</p>
                   
    </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="sidebar/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="sidebar/js/bootstrap.min.js"></script>

    

</body>
</html>
