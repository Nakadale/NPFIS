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
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            if (txtReportDate.Text == "")
            {
                txtReportDate.Text = "01/01/1980";
            }
            //DataSet1
            //DataSet1.DataTableInventoryDataTable dt = new DataSetInventory.DataTableInventoryDataTable();
            //DataSetInventoryTableAdapters.DataTableInventoryTableAdapter ad = new DataSetInventoryTableAdapters.DataTableInventoryTableAdapter();

            //ad.Fill(dt, msocode, datefilter);
            //ReportDataSource rds = new ReportDataSource("Inventory", (DataTable)dt);
            //ReportViewer1.LocalReport.DataSources.Clear();
            //ReportViewer1.LocalReport.DataSources.Add(rds);

            ReportParameter asof = new ReportParameter("asof", "Test");
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { asof });

            ReportViewer1.LocalReport.Refresh();
        }
    }
}