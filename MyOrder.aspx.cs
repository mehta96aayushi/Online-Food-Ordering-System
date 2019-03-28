using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OFOS
{
    public partial class MyOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("FoodItems.aspx");
                b.Visible = false;
               
            }
            else
            {

                b.Visible = true;
                l2.Visible = true;
                l.Text = Session["user"].ToString();
                if (Session["user"].ToString() == "Guest")
                {

                    b.Visible = false;
                    b1.Visible = true;
                }
                else
                {
                    b.Visible = true;
                    b1.Visible = false;
                }

            }

            if (Session["order_id"] == null)
            {
                lbl.Text = "Food cart is empty";
                Button2.Visible = false;
            }
            else
            {
                lbl.Text = "Order Id : " + ((int)Session["order_id"]).ToString();

                string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";

                string q = "SELECT sum(Amount) FROM [dbo].[Order_Details] WHERE Order_Id=@Order_Id";
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand(q, con);

                try
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@Order_Id", (int)Session["order_id"]);

                    object o = cmd.ExecuteScalar();
                    if (o.GetType() != typeof(DBNull))
                    {
                        int sum = (int)cmd.ExecuteScalar();

                        Label1.Text = "Total Amount :  ₹ " + sum;
                        Session["total"] = sum;
                    }
                    else
                    {
                        Label1.Text = "Your order list is empty";
                        Button2.Visible = false;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("FoodItems.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void LogOut_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/FoodItems.aspx");
        }

        protected void gridorder_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            string arg = e.NewValues[0].ToString();
            try
            {
                int n = Int32.Parse(arg);
                if (n < 1 || n>10)
                {
                    //Label2.Text = "Invalid Quantity";
                    gridorder.Rows[0].Cells[2].Text = e.OldValues[2].ToString();
                    //Button1.Enabled = false;
                    //Button2.Enabled = false;
                    gridorder.DataBind();
                }
            }
            catch (FormatException i)
            {
                Response.Write("Invalid Quantity");
            }
        }

        protected void gridorder_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {

                string arg = e.NewValues[0].ToString();
                int o;
                if (!arg.All(char.IsDigit))
                {
                    // Label2.Text = "Invalid Quantity";
                    e.Cancel = true;
                    gridorder.Rows[0].Cells[2].Text = e.OldValues[2].ToString();

                    gridorder.DataBind();
                    this.Page_Load(sender, e);

                }
                int n = Int32.Parse(arg);
                if (n < 1 || n>10)
                {
                    //Label2.Text = "Invalid Quantity";
                    e.Cancel = true;
                    gridorder.Rows[0].Cells[2].Text = e.OldValues[2].ToString();

                    gridorder.DataBind();
                }
            }
            catch (FormatException i)
            {
                //Label2.Text = "Invalid Quantity";
                e.Cancel = true;
                gridorder.Rows[0].Cells[2].Text = e.OldValues[2].ToString();

                gridorder.DataBind();
            }
        }

    }
}
