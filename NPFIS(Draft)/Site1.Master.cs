using System;
using System.Collections.Generic;
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
            Session["User"] = null;
            Session["Name"] = null;
            Response.Redirect("WebLogin.aspx");
        }
    }
}