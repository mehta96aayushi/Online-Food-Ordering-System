using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.Sql;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace OFOS
{
    public partial class Add_items : System.Web.UI.Page
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
            
            string query = "select count(*) from [dbo].[Item_Master] WHERE Item_No=@item_no";
            SqlCommand cmd = new SqlCommand(query, con);

            try
            {
                con.Open();

                cmd.Parameters.AddWithValue("@item_no", Int32.Parse(TextBox1.Text));
                int exist = (int)cmd.ExecuteScalar();
                if (exist > 0)
                {
                    Label1.Text = "Item No already exists. Enter another one.";
                }
                else
                {
                    String q = "INSERT INTO [dbo].[Item_Master] values (";
                    q += "@item_no, @item_name, @price, ";
                    q += "@description, @image_url, @type)";

                    cmd = new SqlCommand(q, con);

                    cmd.Parameters.AddWithValue("@item_no", Int32.Parse(TextBox1.Text));
                    cmd.Parameters.AddWithValue("@item_name", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@type", dropdown_type.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@price", Int32.Parse(TextBox4.Text));
                    cmd.Parameters.AddWithValue("@description", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@image_url", TextBox6.Text);
                    cmd.ExecuteNonQuery();

                    Label1.Text = "Item Added successfully.";
                }
            }
            catch (Exception err)
            {
                Label1.Text = "Error Inserting Record.";
                Label1.Text = err.ToString();
            }
            finally
            {
                con.Close();
            }
        }
    }
}