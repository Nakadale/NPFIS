using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace NPFIS_Draft_
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
            {

                {
                    SqlCommand cmd = new SqlCommand("Update Users Set Active = 0 where UserID = @UserID", cnn);
                    cnn.Open();
                    cmd.Parameters.AddWithValue("@UserID", Session["user"].ToString());
                    cmd.ExecuteNonQuery();
                }
            }
            Session["User"] = null;
            Session["Name"] = null;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}