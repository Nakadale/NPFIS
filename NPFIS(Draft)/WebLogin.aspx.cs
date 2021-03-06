﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Authenticate(this.txtbxUser.Text,this.txtbxPassword.Text);
        }
        private void Authenticate(string user, string password)
        {
            DataTable dt = new DataTable();
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
            {

                {
                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE userid=@userid and password=@password and allow = 1", cnn);
                    cmd.Parameters.AddWithValue("@userid", user);
                    cmd.Parameters.AddWithValue("@password", password);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Active"].ToString() == "False")
                        {
                        Session["Name"] = dt.Rows[0]["Name"].ToString();
                        Session["User"] = user;
                        cmd.CommandText = "Update Users Set Active = 1, lastdate = SYSUTCDATETIME() where UserID = @userid";
                        cmd.ExecuteNonQuery();

                        Response.Redirect("LandingPage.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionError", @"$(document).ready(function(){alertify.error('Login failed! User is already logged in.');});", true);
                            return;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionError", @"$(document).ready(function(){alertify.error('Login failed! Please enter valid Username and Password');});", true);
                        return;

                    }

                }

            }


        }

    }
}