using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace OFOS
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_register_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";

            SqlConnection con = new SqlConnection(connectionString);
            string query = "select count(*) from [dbo].[Customers] WHERE Username=@Username";
            SqlCommand cmd = new SqlCommand(query, con);
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@Username", tb_username.Text);
                int exist = (int)cmd.ExecuteScalar();
                if (exist > 0)
                {
                    lblStatus.Text = "Username is already there. Enter another one.";
                }
                else
                {
                    string insertSQL;
                    insertSQL = "INSERT INTO [dbo].[Customers] (";
                    insertSQL += "Name, Username, Password, Email, ";
                    insertSQL += "Contact_No, House_No, Street, City) ";
                    insertSQL += "VALUES (";
                    insertSQL += "@Name, @Username, @Password, @Email, ";
                    insertSQL += "@Contact_No, @House_No, @Street, @City)";

                    cmd = new SqlCommand(insertSQL, con);

                    cmd.Parameters.AddWithValue("@Name", tb_name.Text);
                    cmd.Parameters.AddWithValue("@Username", tb_username.Text);
                    cmd.Parameters.AddWithValue("@Password", tb_pwd.Text);
                    cmd.Parameters.AddWithValue("@Email", tb_email.Text);
                    cmd.Parameters.AddWithValue("@Contact_No", tb_contact.Text);
                    cmd.Parameters.AddWithValue("@House_No", tb_house.Text);
                    cmd.Parameters.AddWithValue("@Street", tb_street.Text);
                    cmd.Parameters.AddWithValue("@City", DropDownList1_city.Text);

                    int added;
                    added = cmd.ExecuteNonQuery();
                    lblStatus.Text ="Registration successful.";                    
                }
            }
            catch (Exception err)
            {
                //lblStatus.Text = "Error inserting record. ";
                lblStatus.Text += err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("FoodItems.aspx");
        }
    }
}