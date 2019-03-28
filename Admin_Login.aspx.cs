using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["admin"] = null;            
            status.Text = Request.QueryString["msg"];
        }

        protected void Admin_Login_Click(object sender, EventArgs e)
        {
            String constrng = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";
            SqlConnection con = new SqlConnection(constrng);
           
            string selectSQL = "select * from [dbo].[Admin] where Username=@username AND Password=@password";
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@username", tb_admin.Text);
                cmd.Parameters.AddWithValue("@password", tb_pwd.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read() == false)
                {
                    status.Text = "Invalid Username or Password.";
                }
                else
                {
                    Session["admin"] = tb_admin.Text;
                    Response.Redirect("Admin_Tasks.aspx");
                }
            }
            catch (Exception err)
            {
                status.Text = err.ToString();
            }
            finally
            {
                con.Close();
            }
        }
       
    }
}