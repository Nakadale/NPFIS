using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Member_Loan_Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LoanMaintenance').collapse('show');", true);
        }
    }
}