using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace OFOS
{
    public partial class FoodItems : System.Web.UI.Page
    {
        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
              System.DateTime t1 = System.DateTime.Parse("2016/12/12 08:00:00.000");
              System.DateTime t2 = System.DateTime.Parse("2016/12/12 23:00:00.000");
              System.DateTime t3 = System.DateTime.Now;
              if (t3.TimeOfDay < t1.TimeOfDay || t3.TimeOfDay > t2.TimeOfDay)
              {
                  status.Text = "You Can't Order Now...Visit Again During 11:00 AM to 11:00 PM.";
                  status1.Text = "Thank You";
                  status.Visible = true;
                  status1.Visible = true;
                  home.Visible = false;
              }



            if (Session["user"] == null)
            {
                sizlr.Visible = true;
                sizlr.Text = "Sizzlers Are Not Available For ONLINE ORDER";
                hl.Visible = true;
                Register.Visible = true;
                b.Visible = false;
                b1.Visible = false;
            }
            else
            {
                my_order.Visible = true;
                hl.Visible = false;
                u.Text = Session["user"].ToString();
                Label1.Text = u.Text;
                
                if (Session["user"].ToString() == "Guest")
                {
                    b.Visible = false;
                    b1.Visible = true;
                    Label1.Visible = true;
                    Label2.Visible = true;
                }
                else
                {
                    b.Visible = true;
                    b1.Visible = false;
                    dropdown.Visible = true;
                }
            }

        }

        protected void LogOut_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/FoodItems.aspx");
        }

        protected void signin_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Button_soup_onclick(object sender, EventArgs e)
        {
            pic.Visible = false;
            
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                string selectSQL = "select Item_no,Item_name,Description,Image_url,Price from [dbo].[Item_Master] where (Type='SOUPS')";
                SqlCommand cmd = new SqlCommand(selectSQL, con);                
                griditem.DataSource = cmd.ExecuteReader();
                griditem.DataBind();
            }
            catch (Exception err)
            {
                status.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button_starter_onclick(object sender, EventArgs e)
        {
            pic.Visible = false;
           
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                string selectSQL = "select Item_no,Item_name,Description,Image_url,Price from [dbo].[Item_Master] where (Type='STARTERS')";
                SqlCommand cmd = new SqlCommand(selectSQL, con);
                griditem.DataSource = cmd.ExecuteReader();
                griditem.DataBind();
            }
            catch (Exception err)
            {
                status.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button_rice_onclick(object sender, EventArgs e)
        {
            pic.Visible = false;
           
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                string selectSQL = "select Item_no,Item_name,Description,Image_url,Price from [dbo].[Item_Master] where (Type='RICE')";
                SqlCommand cmd = new SqlCommand(selectSQL, con);
                griditem.DataSource = cmd.ExecuteReader();
                griditem.DataBind();
            }
            catch (Exception err)
            {
                status.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button_noodles_onclick(object sender, EventArgs e)
        {
            pic.Visible = false;
            
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                string selectSQL = "select Item_no,Item_name,Description,Image_url,Price from [dbo].[Item_Master] where (Type='NOODLES')";
                SqlCommand cmd = new SqlCommand(selectSQL, con);
                griditem.DataSource = cmd.ExecuteReader();
                griditem.DataBind();
            }
            catch (Exception err)
            {
                status.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button_maincourse_onclick(object sender, EventArgs e)
        {
            pic.Visible = false;
            
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                string selectSQL = "select Item_no,Item_name,Description,Image_url,Price from [dbo].[Item_Master] where (Type='MAIN COURSE')";
                SqlCommand cmd = new SqlCommand(selectSQL, con);
                griditem.DataSource = cmd.ExecuteReader();
                griditem.DataBind();
            }
            catch (Exception err)
            {
                status.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button_dessert_onclick(object sender, EventArgs e)
        {
            pic.Visible = false;
                  
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                string selectSQL = "select Item_no,Item_name,Description,Image_url,Price from [dbo].[Item_Master] where (Type='DESSERTS')";
                SqlCommand cmd = new SqlCommand(selectSQL, con);
                griditem.DataSource = cmd.ExecuteReader();
                griditem.DataBind();
            }
            catch (Exception err)
            {
                status.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void griditem_Click(Object sender, EventArgs e)
        {
            pic.Visible = false;

            if (Session["user"] == null)
            {
                Response.Redirect("~/Login.aspx?msg=Please Log In");
            }
            else
            {
                SqlConnection con = new SqlConnection(constr);
                try
                {
                    con.Open();
                    string inSQL = null;
                    SqlCommand cmd = null;
                    if (Session["order_id"] == null)
                    {

                        inSQL = "insert into [dbo].[Orders] (Cust_Id) VALUES(@id)";
                        cmd = new SqlCommand(inSQL, con);
                        cmd.Parameters.AddWithValue("@id", (int)Session["customer_id"]);
                        cmd.ExecuteNonQuery();

                        string selectSQL = "select MAX(Order_Id) from [dbo].[Orders]";
                        cmd = new SqlCommand(selectSQL, con);
                        int x = (int)cmd.ExecuteScalar();
                        Session["order_id"] = x;
                        my_order.Visible = true;
                    }                 
                        Button btn = (Button)sender;
                        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
                        Button b = (Button)gvr.Cells[6].FindControl("button_cart");
                        b.Visible = false;
                        Label l = (Label)gvr.Cells[6].FindControl("l1");
                        l.Visible = true;
                        TextBox temp = gvr.Cells[5].FindControl("tb_quantity") as TextBox;
                        temp.Enabled = false;

                        string check = "select count(*) from [dbo].[Order_Details] where Order_Id=@id and Item_no=@item";
                        cmd = new SqlCommand(check, con);

                        cmd.Parameters.AddWithValue("@id", (int)Session["order_id"]);
                        cmd.Parameters.AddWithValue("@item", gvr.Cells[0].Text);

                        int exist = (int)cmd.ExecuteScalar();
                        if (exist > 0)
                        {
                            string UpdateSql = "update [dbo].[Order_Details] set Quantity = Quantity + @value, Amount = (Quantity + @value) * Price where Order_Id=@id and Item_no=@item";
                            cmd = new SqlCommand(UpdateSql, con);
                            cmd.Parameters.AddWithValue("@value", temp.Text);
                            cmd.Parameters.AddWithValue("@id", (int)Session["Order_Id"]);
                            cmd.Parameters.AddWithValue("@item", gvr.Cells[0].Text);
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {
                            string insertSQL = "insert into [dbo].[Order_Details] (Order_Id, Item_no, Quantity, Price,Amount) VALUES(@order_id, @item_no, @qty, @price,@amount)";
                            cmd = new SqlCommand(insertSQL, con);
                            cmd.Parameters.AddWithValue("@order_id", (int)Session["order_id"]);
                            cmd.Parameters.AddWithValue("@item_no", gvr.Cells[0].Text);
                            cmd.Parameters.AddWithValue("@qty", Convert.ToInt32(temp.Text));
                            cmd.Parameters.AddWithValue("@price", gvr.Cells[4].Text);
                            cmd.Parameters.AddWithValue("@amount", (Convert.ToInt32(temp.Text)) * (Convert.ToInt32(gvr.Cells[4].Text)));
                            cmd.ExecuteNonQuery();

                        }
                    }

                catch (Exception err)
                {
                    status.Text = err.Message;
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void MyOrder_click(Object sender, EventArgs e)
        {
            Response.Redirect("~/MyOrder.aspx");
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");
        }

    }
}