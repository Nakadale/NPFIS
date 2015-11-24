using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class RemittanceofContributionPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            if (!IsPostBack)
            {
                ReportParameter MemberName = new ReportParameter("MemberName", Session["FullName"].ToString());
                ReportParameter branch = new ReportParameter("BranchDivision", Session["Branch"].ToString());
                ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { MemberName, branch });
                ReportViewer1.LocalReport.Refresh();
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#MemberMaintenance').collapse('show');", true);
        }
    }
}