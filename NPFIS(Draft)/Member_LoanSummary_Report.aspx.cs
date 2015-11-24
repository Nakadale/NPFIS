using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Member_Loan_Summary_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            if (txtReportDate.Text == "")
            {
                txtReportDate.Text = "01/01/1980";
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LoanMaintenance').collapse('show');", true);

        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            if (txtReportDate.Text == "")
            {
                txtReportDate.Text = "01/01/1980";
            }

            string Month = txtReportDate.Text;
            string MonthName = "";

            switch(Month.Substring(3,2))
            {
                case "01" : MonthName = "JANUARY";break;
                case "02" : MonthName = "FEBRUARY";break;
                case "03" : MonthName = "MARCH";break;
                case "04" : MonthName = "APRIL";break;
                case "05" : MonthName = "MAY";break;
                case "06" : MonthName = "JUNE";break;
                case "07" : MonthName = "JULY";break;
                case "08" : MonthName = "AUGUST";break;
                case "09" : MonthName = "SEPTEMBER";break;
                case "10" : MonthName = "OCTOBER";break;
                case "11" : MonthName = "NOVEMBER";break;
                case "12" : MonthName = "DECEMBER";break;
            }


            ReportParameter asof = new ReportParameter("asof", MonthName + " " + Month.Substring(6, 4));
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { asof });

            ReportViewer1.LocalReport.Refresh();
        }
    }
}