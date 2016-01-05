using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Members_Amortization_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LoanMaintenance').collapse('show');", true);

        }

        protected void btnSearchMember_Click(object sender, EventArgs e)
        {
            string txtSearchKeyword = (string)txtSearch.Text;
            BindTransactCode(txtSearchKeyword);
        }

        private void BindTransactCode(string SearchKey)
        {
            gvSearch.DataSource = helpers.LoadSearchedMembers(SearchKey);
            gvSearch.DataKeyNames = new string[] { "EMPID", "FIRSTNAME", "LASTNAME", "MIDNAME", "BIRTHDATE" };
            gvSearch.DataBind();
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;
                string EmpID = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
                gvTransactions.DataSource = helpers.LoadEmpTransactRecord(EmpID);
                gvTransactions.DataKeyNames = new string[] { "LOANTYPE", "PRINCIPALAMOUNT", "DATEFILED", "BALANCE", "PAID", "TRANSACTCODE" };
                gvTransactions.DataBind();
                gvSearch.DataSource = null;
                gvSearch.DataBind();
                Session["EmpID"] = EmpID;
            }
        }

        protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvTransactions_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (((string)e.CommandName.ToString()) == "Preview")
            {
                GridView gv = (GridView)sender;
                int RowIndex = int.Parse(gv.SelectedIndex.ToString());
                Session["TransactCode"] = ((Label)gvTransactions.Rows[RowIndex].FindControl("lblTransactCode")).Text;
                Response.Redirect("Member_Loan_Summary.aspx");
            }
            else if (((string)e.CommandName.ToString()) == "Print")
            {
                GridView gv = (GridView)sender;
                int RowIndex = int.Parse(gv.SelectedIndex.ToString());
                Session["TransactCode"] = ((Label)gvTransactions.Rows[RowIndex].FindControl("lblTransactCode")).Text;
            }
        }

        protected void gvTransactions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gv = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow && ((GridView)sender).EditIndex == -1)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor = 'hand';this.style.textDecoration = 'underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration = 'none';";
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
                //((CheckBox)e.Row.FindControl("ckPaidAmort")).Enabled = true;

            }
        }

        protected void gvTransactions_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;

            if (gvTransactions.EditIndex == -1)
            {
                foreach (GridViewRow row in gvTransactions.Rows)
                {
                    LinkButton lbtnPreview = (LinkButton)row.FindControl("lnkBtnPreview");
                    LinkButton lbtnPrint = (LinkButton)row.FindControl("lnkBtnPrint");

                    string key = gv.DataKeys[row.RowIndex]["TRANSACTCODE"].ToString();

                    if (row.RowIndex == gvTransactions.SelectedIndex && key != "")
                    {
                        lbtnPreview.Visible = true;
                        lbtnPrint.Visible = true;
                    }
                    else
                    {
                        lbtnPreview.Visible = false;
                        lbtnPrint.Visible = false;
                    }
                }
            }

        }

        protected void gvSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gv = (GridView)sender;
            gv.PageIndex = e.NewPageIndex;
            BindTransactCode("");
        }

        protected void lnkBtnPreview_Click(object sender, EventArgs e)
        {


        }

    }
}