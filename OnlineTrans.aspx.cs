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
    public partial class WebForm2 : System.Web.UI.Page
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
                    Response.Redirect("FoodItems.aspx?First place the order");
                }
            }            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";

            SqlConnection con = new SqlConnection(constr);
            string q = "SELECT Balance FROM [dbo].[Accounts] WHERE (Acc_No=@acc AND Name=@name AND Acc_pwd=@apwd)";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataReader reader;
            try
            {
                con.Open();

                cmd.Parameters.AddWithValue("@name", Name.Text);
                cmd.Parameters.AddWithValue("@acc",  Int32.Parse(Acc_no.Text));
                cmd.Parameters.AddWithValue("@apwd", Acc_pwd.Text);

                reader = cmd.ExecuteReader();
                
                if (reader.Read() == false)
                {
                    Label1.Text = "Invalid details";
                }
                else
                {
                    string balance = reader["Balance"].ToString();
                    Label1.Text = balance;
                    reader.Close();
                    float bal = float.Parse(balance);
                      
                    int total = (int)(Session["total"]);

                    if (bal >= total)
                    {
                         float nbal = bal - total;
                        

                        string q1 = "UPDATE [dbo].[Accounts] SET Balance=@nbal WHERE (Acc_No=@acc AND Name=@name AND Acc_pwd=@apwd)";
                        SqlCommand cmd1 = new SqlCommand(q1,con);
                        cmd1.Parameters.AddWithValue("@nbal", nbal);
                        cmd1.Parameters.AddWithValue("@name", Name.Text);
                        cmd1.Parameters.AddWithValue("@acc", Int32.Parse(Acc_no.Text));
                        cmd1.Parameters.AddWithValue("@apwd", Acc_pwd.Text);
                     
                       cmd1.ExecuteNonQuery();
                        Label1.Text = "Transaction Successful." + "<br/>" +
                            "Payment of ₹ " + total + " received." + "<br/>" + nbal;

                        string q2 = "UPDATE [dbo].[Orders] SET Status=1,Date=@date WHERE Order_Id=@order_id";
                        SqlCommand cmd2 = new SqlCommand(q2, con);
                        cmd2.Parameters.AddWithValue("@order_id", (int)Session["order_id"]);
                        cmd2.Parameters.AddWithValue("@date", System.DateTime.Now.ToString());

                        cmd2.ExecuteScalar();

                        string q3="INSERT into [dbo].[Payment] (Order_Id,Mode,Acc_No) values (@Order_Id,@Mode,@Acc_No)";
                        SqlCommand cmd3 = new SqlCommand(q3, con);
                        cmd3.Parameters.AddWithValue("@Order_Id", (int)Session["order_id"]);
                        cmd3.Parameters.AddWithValue("@Mode", "Online Transaction");
                        cmd3.Parameters.AddWithValue("@Acc_No", Int32.Parse(Acc_no.Text));
                        cmd3.ExecuteNonQuery();
                        Response.Redirect("COD_Delivery.aspx");

                    }
                    else
                    {
                        Label1.Text = "Transaction cancelled due to insufficient balance.";
                    }
                }
            }
            catch (Exception err)
            {
                Label1.Text = "Please provide details.";
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Acc_pwd.Visible = false;
            Session["pay"] = null;
            Session["pay"] = "COD";
            Response.Redirect("COD_Delivery.aspx");
        }
    }
}