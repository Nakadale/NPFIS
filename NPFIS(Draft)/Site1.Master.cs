using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = Session["Name"].ToString();
        }

        protected void LnkLogout_Click(object sender, EventArgs e)
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
            Response.Redirect("WebLogin.aspx");
        }
    }
}