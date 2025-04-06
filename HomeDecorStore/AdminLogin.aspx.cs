using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeDecorStore
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated && Session["UserRole"]?.ToString() == "Admin")
            {
                Response.Redirect(GetRouteUrl("AdminDashboardRoute", null));
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = $@"SELECT * FROM Users 
                        WHERE Username='{txtUsername.Text.Trim()}' 
                        AND Password='{txtPassword.Text.Trim()}'
                        AND Role='Admin'";

            DataTable dt = Database.GetData(query);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                Session["UserID"] = row["UserID"];
                Session["Username"] = row["Username"];
                Session["UserRole"] = row["Role"];

                FormsAuthentication.SetAuthCookie(row["Username"].ToString(), false);
                Response.Redirect(GetRouteUrl("AdminDashboardRoute", null));
            }
            else
            {
                ltMessage.Text = "<div class='alert alert-danger mt-3'>Invalid admin credentials</div>";
            }
        }

    }
}