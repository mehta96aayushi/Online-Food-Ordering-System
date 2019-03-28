using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {

                b.Visible = false;
                l2.Visible = false;
                l.Visible = false;
            }
            else
            {
             
                
                //b.Visible = true;
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



            if (Session["order_id"]==null)
            {
                Response.Redirect("FoodItems.aspx");
            }
            else
            {
                if (Session["total"] == null)
                {
                    Response.Redirect("MyOrder.aspx");
                }
            }
            


            Label2.Text = " ₹ "+Session["total"].ToString();
            if (!IsPostBack)
            {
                Session["pay"] = null;
            }
        }

      

       
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["pay"] = "OT";
            Response.Redirect("OnlineTrans.aspx");
        
        }
        protected void LogOut_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/FoodItems.aspx");
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["pay"] = "COD";
            Response.Redirect("COD_Delivery.aspx");
        }
    }
}