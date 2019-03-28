using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace OFOS
{
    public partial class COD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["order_id"]==null)
            {
                Response.Redirect("FoodItems.aspx");
            }
            else
            {
                if(Session["pay"]==null)
                {
                    Response.Redirect("MyOrder.aspx?Payment mode needs to be selected");
                }
            }
            if (Session["user"] == null)
            {

                b.Visible = false;

            }
            else
            {

               
                l2.Visible = true;
                l.Text = Session["user"].ToString();
                if (Session["user"].ToString() == "Guest")
                { 
                    b1.Visible = true;
                    b.Visible = false;
                }
                else
                {
                    b.Visible = true;
                    b1.Visible = false;
                }

            }

            
            if (IsPostBack==false)
            {
                if (Session["pay"].ToString() == "OT")
                {
                    Label1.Text = "Transaction successful!"+"<br/>"+"Payment of ₹" + Session["total"] + " received." + "<br/><br/>" + "Please provide Delivery details.";
                }
                else if(Session["pay"].ToString()=="COD")
                {
                    Label1.Text = "Please provide Delivery details.";
                }
                string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";
                string q = "select Name,House_no,Street,City,Contact_No from [dbo].[Customers] WHERE Cust_Id=@Cust_Id";
                SqlConnection con = new SqlConnection(constr);

                SqlCommand cmd = new SqlCommand(q, con);
                SqlDataReader reader;
                try
                {
                    con.Open();

                    cmd.Parameters.AddWithValue("@Cust_Id", Session["customer_id"]);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Name.Text = reader["Name"].ToString();
                        House_no.Text = reader["House_no"].ToString();
                        Street.Text = reader["Street"].ToString();
                        D_city.Text = reader["City"].ToString();
                        Contact.Text = reader["Contact_no"].ToString();
                    }
                }
                catch (Exception err)
                {
                    Label1.Text = err.ToString();
                }
                finally
                {
                    con.Close();
                }
            }
        }
     
        protected void LogOut_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/FoodItems.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";

            string q = "INSERT into [dbo].[Delivery] (Order_Id,Name,House_no,Street,City,Contact_no) values (@Order_Id,@Name,@House_no,@Street,@City,@Contact_No)";
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(q, con);
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@Order_Id", Session["order_id"]);
                cmd.Parameters.AddWithValue("@Name", Name.Text);
                cmd.Parameters.AddWithValue("House_no", House_no.Text);
                cmd.Parameters.AddWithValue("@Street", Street.Text);
                cmd.Parameters.AddWithValue("@City", D_city.Text);
                cmd.Parameters.AddWithValue("@Contact_No", Contact.Text);
                cmd.ExecuteNonQuery();

                if (Session["pay"].ToString() == "COD")
                {
                    string q2 = "UPDATE [dbo].[Orders] SET Status=1,Date=@date WHERE Order_Id=@order_id";
                    SqlCommand cmd2 = new SqlCommand(q2, con);
                    cmd2.Parameters.AddWithValue("@order_id", (int)Session["order_id"]);
                    cmd2.Parameters.AddWithValue("@date", System.DateTime.Now.ToString());

                    cmd2.ExecuteNonQuery();
                    //cmd2.ExecuteScalar();

                    string q3 = "INSERT into [dbo].[Payment] (Order_Id,Mode,COD_Pay_Status) values (@Order_Id,@Mode,@COD_Pay_Status)";
                    SqlCommand cmd3 = new SqlCommand(q3, con);
                    cmd3.Parameters.AddWithValue("@Order_Id", (int)Session["order_id"]);
                    cmd3.Parameters.AddWithValue("@Mode", "COD");
                    cmd3.Parameters.AddWithValue("@COD_Pay_Status", "Pending");
                    cmd3.ExecuteNonQuery();                                      
                }                

                Response.Redirect("Final.aspx");
            }
            catch(Exception err)
            {
                Label1.Text = err.ToString();
            }
            finally
            {
                con.Close();
            }
        }
         
    }
}