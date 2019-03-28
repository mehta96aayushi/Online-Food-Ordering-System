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
    public partial class Manage_COD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Admin_Login.aspx?You need to login first");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            
            Response.Redirect("Admin_Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String conStrng = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";
            SqlConnection con = new SqlConnection(conStrng);

            string q1 = "SELECT COD_Pay_Status FROM [dbo].[Payment] WHERE Order_Id=@order_id ";
            SqlCommand cmd1 = new SqlCommand(q1, con);

            try
            {
                con.Open();
                cmd1.Parameters.AddWithValue("@order_id", TextBox1.Text);

                SqlDataReader rd;
                rd = cmd1.ExecuteReader();
                rd.Read();

                if (rd["COD_Pay_Status"].ToString() == "Received")
                {
                    Label1.Text = "<h5>" + "Status for Order ID " + TextBox1.Text + " is already updated." + "</h5>";
                }
                else
                {

                    rd.Close();

                    String q = "UPDATE [dbo].[Payment] SET COD_Pay_Status='Received' WHERE Order_Id=@order_id AND Mode='COD' ";

                    SqlCommand cmd = new SqlCommand(q, con);

                    cmd.Parameters.AddWithValue("@order_id", TextBox1.Text);
                    if (cmd.ExecuteNonQuery() == 0)
                    {
                        Label1.Text = "<h5>" + "Invalid Order ID" + " " + TextBox1.Text + "</h5>";
                    }
                    else
                    {
                        Label1.Text = "<h5>" + "Status for the entered Order_Id " + TextBox1.Text + " is updated." + "</h5>";
                    }
                }

            }
            catch (Exception err)
            {
                Label1.Text = "Invalid Order Id";
            }
            finally
            {
                con.Close();
            }
        }
    }
}