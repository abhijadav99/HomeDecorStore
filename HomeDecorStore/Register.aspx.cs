﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeDecorStore
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string checkUser = $"SELECT Username FROM Users WHERE Username='{txtUsername.Text.Trim()}'";
                DataTable dt = Database.GetData(checkUser);

                if (dt.Rows.Count == 0)
                {
                    string query = $@"INSERT INTO Users (Username, Password, Email, Role) 
                                VALUES ('{txtUsername.Text.Trim()}', 
                                        '{txtPassword.Text.Trim()}', 
                                        '{txtEmail.Text.Trim()}', 
                                        'User')";
                    Database.ExecuteQuery(query);
                    ltMessage.Text = "<div class='alert alert-success mt-3'>Registration successful! Please login.</div>";
                }
                else
                {
                    ltMessage.Text = "<div class='alert alert-danger mt-3'>Username already exists</div>";
                }
            }
        }
    }
}