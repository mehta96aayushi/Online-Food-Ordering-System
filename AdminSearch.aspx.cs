using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OFOS
{
    public partial class AdminSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (!IsPostBack)
            {*/
                if (Session["admin"] == null)
                {
                    Response.Redirect("Admin_Login.aspx?msg=You need to login first");           
                }
            //}
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect("Admin_Login.aspx");
        }

        protected void btns_Click(object sender, EventArgs e)
        {
            details.Visible = true;

            string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True";
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                String selectQuery = "select c.Cust_Id, c.Username, o.Order_Id from [dbo].[Orders] o inner join [dbo].[Customers] c on o.Status=1 and c.City=@city and o.Cust_Id=c.Cust_Id";
                int f = 0;

                if (rdBtn_gst.Checked)
                {
                    selectQuery += " AND c.Password IS NULL";
                }
                else if (rdBtn_regi.Checked)
                {
                    selectQuery += " AND c.Password IS NOT NULL";
                }

                //status.Text = clndr.SelectedDate.ToShortDateString();
                if (clndr.SelectedDate.Date != DateTime.MinValue.Date)
                {
                    f = 1;
                    selectQuery += " AND o.Date=@Date";
                }

                SqlCommand cmd = new SqlCommand(selectQuery, con);

                if (f == 1)
                {
                    cmd.Parameters.AddWithValue("@Date", clndr.SelectedDate.ToShortDateString());
                }

                cmd.Parameters.AddWithValue("@city", dropdown_city.SelectedItem.Text);
                gridview1.DataSource = cmd.ExecuteReader();
                gridview1.DataBind();

            }
            catch (Exception err)
            {
                Sts.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void gridview1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            Button b = (Button)gvr.Cells[0].FindControl("button");

            Sts.Text = gvr.Cells[3].Text;

            string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True"; 
            SqlConnection con = new SqlConnection(constr);

            try
            {
                con.Open();                
                String selectQuery = "select od.Item_no, im.Item_name, od.Quantity from [dbo].[Order_Details] od inner join [dbo].[Item_Master] im ON od.Order_Id=@Order_Id AND im.Item_no=od.Item_no";
                SqlCommand cmd = new SqlCommand(selectQuery, con);

                cmd.Parameters.AddWithValue("@Order_Id", gvr.Cells[3].Text);
                gridview2.DataSource = cmd.ExecuteReader();
                gridview2.DataBind();
            }
            catch (Exception err)
            {
                Sts.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

    }
}