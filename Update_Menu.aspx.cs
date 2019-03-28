using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class Update_Menu : System.Web.UI.Page
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
            Response.Redirect("Add_items.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx");

        }
    }
}