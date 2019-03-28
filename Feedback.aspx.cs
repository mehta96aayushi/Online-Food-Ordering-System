using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace OFOS
{
    public partial class Feedback : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                b.Visible = false;
                Response.Redirect("FoodItems.aspx");
            }
            else
            {            
                l2.Visible = true;
                l.Text = Session["user"].ToString();                
            }
        }

        protected void LogOut_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/FoodItems.aspx");
        }

        protected void Btn1_Click(object sender, EventArgs e)
        {
            if (tb_fd.Text.Length == 0)
            {
                Lbl_status.Visible = true;
                Lbl_status.Text = "Please provide feedback";
            }
            else
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";
                SqlConnection con = new SqlConnection(connectionString);
                try
                {
                    con.Open();
                    string insertSQL;
                    insertSQL = "INSERT INTO [dbo].[Feedback] (";
                    insertSQL += "Cust_Id, Username, Comment) ";
                    insertSQL += "VALUES (";
                    insertSQL += "@Cust_Id, @Username, @Comment)";
                    

                    SqlCommand cmd = new SqlCommand(insertSQL, con);
                    

                    cmd.Parameters.AddWithValue("@Cust_Id", (int)Session["customer_id"]);
                    cmd.Parameters.AddWithValue("@Username", Session["user"]);
                    cmd.Parameters.AddWithValue("@Comment", tb_fd.Text);

                    int added;
                    added = cmd.ExecuteNonQuery();

                    Lbl_status.Visible = true;
                    Lbl_status.Text = "Your Feedback has been submitted.";
                }
                catch (Exception err)
                {
                    Lbl_status.Text = err.ToString();
                }
                finally
                {
                    con.Close();
                }

                Btn1.Visible = false;
            }                      
        }

        protected void Home_click(object sender, EventArgs e)
        {
            Response.Redirect("FoodItems.aspx");
        }
    }
}