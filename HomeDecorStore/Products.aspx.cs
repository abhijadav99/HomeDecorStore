using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeDecorStore
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadProducts();
            }
        }
        private void LoadCategories()
        {
            string query = "SELECT CategoryID, CategoryName FROM Categories";
            DataTable dt = Database.GetData(query);

            ddlCategories.DataSource = dt;
            ddlCategories.DataTextField = "CategoryName";
            ddlCategories.DataValueField = "CategoryID";
            ddlCategories.DataBind();

            // Keep "All Categories" as first item
            ddlCategories.Items.Insert(0, new ListItem("All Categories", "0"));
        }
        private void LoadProducts()
        {
            string query = @"SELECT p.*, c.CategoryName 
                    FROM Products p
                    INNER JOIN Categories c ON p.CategoryID = c.CategoryID
                    WHERE (@CategoryID = 0 OR p.CategoryID = @CategoryID)"; // Added WHERE clause

            // Create parameters
            SqlParameter[] parameters = {
        new SqlParameter("@CategoryID", ddlCategories.SelectedValue)
    };

            DataTable dt = Database.GetDataParameters(query, parameters); // Changed to parameterized method
            rptProducts.DataSource = dt;
            rptProducts.DataBind();
        }
        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProducts(); // Reload products when category changes
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            try
            {
                int userId = GetCurrentUserId();
                Button btn = (Button)sender;
                int productId = Convert.ToInt32(btn.CommandArgument);

                // Use new parameterized method
                int result = Database.AddToCart(userId, productId);

                if (result > 0)
                {
                    // Show success message or update UI
                    ltMessage.Text = "<div class='alert alert-success'>Item added to cart!</div>";
                }
            }
            catch (Exception ex)
            {
                // Handle error
                ltMessage.Text = $"<div class='alert alert-danger'>Error: {ex.Message}</div>";
            }
        }
        //private int GetCurrentUserId()
        //{
        //    if (Session["UserID"] == null)
        //    {
        //        string username = User.Identity.Name;
        //        string query = $"SELECT UserID FROM Users WHERE Username='{username}'";
        //        DataTable dt = Database.GetData(query);

        //        if (dt.Rows.Count > 0)
        //        {
        //            Session["UserID"] = Convert.ToInt32(dt.Rows[0]["UserID"]);
        //        }
        //    }
        //    return Convert.ToInt32(Session["UserID"]);
        //}
        private int GetCurrentUserId()
        {
            if (Session["UserID"] == null)
            {
                string username = User.Identity.Name;
                string query = "SELECT UserID FROM Users WHERE Username=@Username";

                SqlParameter[] parameters = {
            new SqlParameter("@Username", username)
        };

                DataTable dt = Database.GetDataParameters(query, parameters);

                if (dt.Rows.Count > 0)
                {
                    Session["UserID"] = Convert.ToInt32(dt.Rows[0]["UserID"]);
                }
            }
            return Convert.ToInt32(Session["UserID"]);
        }
    }

}