<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage_COD.aspx.cs" Inherits="OFOS.Manage_COD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    
    <title>Manage COD</title>
    <!-- Bootstrap Core CSS -->
    <link href="sidebar/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="sidebar/css/simple-sidebar.css" rel="stylesheet">

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
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LogOut</asp:LinkButton>
             
        </p>
        
   
   
        <div>
        <br />
  
        
      
        <center><h1>MANAGE COD</h1></center>

    
        <p>
            &nbsp;</p>

        <div style="margin-left: 360px">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
      
          <p>
              &nbsp;</p>
        <p style="margin-left: 40px"/>

            <h4>Enter the ORDER_ID whose status needs to be updated :</h4>&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" CssClass=" form-control" Height="30px" Width="144px"></asp:TextBox>
        <p>

            &nbsp;<p>

            &nbsp;<p style="margin-left: 120px"/>

            &nbsp;<p style="margin-left: 320px"/>

            <asp:Button ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click" CssClass="btn" />
              
    </div>
    </form>
                             </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="sidebar/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="sidebar/js/bootstrap.min.js"></script>

   
   
        

</body>
</html>
