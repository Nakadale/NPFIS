using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace NPFIS_Draft_
{
    public partial class LoanManagement : System.Web.UI.Page
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

        protected void btnSelectSearchedMember_Click(object sender, EventArgs e)
        {
            TextBox Member = (TextBox)this.txtMemberSearch;
            TextBox division = (TextBox)this.txtDivision;
            TextBox branch = (TextBox)this.txtBranch;
            string EmpID = ((DropDownList)gvSearch.Rows[gvSearch.SelectedIndex].FindControl("lblEmpIDDisp")).Text;
            helpers.LoadSearchedMember(EmpID,Member,branch,division);
        }

        protected void txtMemberSearch_TextChanged(object sender, EventArgs e)
        {

        }
        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;

                TextBox Member = (TextBox)this.txtMemberSearch;
                TextBox division = (TextBox)this.txtDivision;
                TextBox branch = (TextBox)this.txtBranch;
                string EmpID = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
                helpers.LoadSearchedMember(EmpID, Member, branch, division);
                if (helpers.CheckIfLoanTransactionExist(EmpID))
                {
                    lblNumTran.Text = "";
                    gvTransactions.DataSource = helpers.LoadEmpTransactRecord(EmpID);
                    gvTransactions.DataKeyNames = new string[] { "LOANTYPE", "PRINCIPALAMOUNT", "DATEFILED", "BALANCE", "PAID", "TRANSACTCODE" };
                    gvTransactions.DataBind();
                    gvSearch.DataSource = null;
                    gvSearch.DataBind();
                }
                else
                {
                    lblNumTran.Text = "No Loan History";
                }
            }
        }

        protected void gvTransactions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "View")
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenus", @"window.open('LoanTransactionInfo2.aspx', 'Loan Transaction Information', 'width=895, height=600');", true);
            }
        }


        protected void gvAmortizations_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;
            int RowIndex = int.Parse(gv.SelectedIndex.ToString());
            ((CheckBox)gv.Rows[RowIndex].FindControl("ckPaid")).Enabled = true;
        }

        protected void gvAmortizations_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView gv = (GridView)sender;
            gvAmortizations.EditIndex = -1;
            string EmpID = ((Label)gvSearch.Rows[gv.SelectedIndex].FindControl("lblEmpIDDisp")).Text;
            //helpers.LoadSearchedMember(EmpID, Member, branch, division);
            gvTransactions.DataSource = helpers.LoadEmpTransactRecord(EmpID);
            gvTransactions.DataKeyNames = new string[] { "LOANTYPE", "PRINCIPALAMOUNT", "DATEFILED", "BALANCE", "PAID", "TRANSACTCODE" };
            gvTransactions.DataBind();
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
            int RowIndex = int.Parse(gv.SelectedIndex.ToString());

            string TransactCode = ((Label)gvTransactions.Rows[RowIndex].FindControl("lblTransactCode")).Text;
            gvAmortizations.DataSource = helpers.LoadAmortizations(TransactCode);
            gvAmortizations.DataKeyNames = new string[] { "PAYDATE", "PAYAMOUNT", "BALANCE", "PAID", "TRANSACTCODE", "AMORTCODE" };
            gvAmortizations.DataBind();
            //btnResched.Visible = true;
            //btnReComp.Visible = true;
            Session[ID] = ((Label)gvTransactions.SelectedRow.FindControl("lblTransactCode")).Text;
        }

        protected void gvAmortizations_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gv = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow && ((GridView)sender).EditIndex == -1)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor = 'hand';this.style.textDecoration = 'underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration = 'none';";
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
                //e.Row.Attributes["onclick"] = "if (!confirm('Are you sure this has been paid?')) return false;";
//                e.Row.Attributes["onclick"] = @" return alertify.defaults.glossary.title='Amortization Payment';
//                                                alertify.confirm('Are you sure this amortization date has been paid?', 
//                                                function (e) {
//                                                if (e) {
//                                                    return true;
//                                                } else {
//                                                    return false;
//                                                }})
//                                                .set({
//                                                'labels': {ok:'Accept', cancel:'Deny'}
//                                                }).show();";

                if ((bool)DataBinder.Eval(e.Row.DataItem, "Paid") == false)
                {
                    //((CheckBox)e.Row.FindControl("ckPaid")).Enabled = true;
                    ((CheckBox)e.Row.FindControl("ckPaid")).Checked = false;
                }
                else
                {
                    //((CheckBox)e.Row.FindControl("ckPaid")).Enabled = false;
                    ((CheckBox)e.Row.FindControl("ckPaid")).Checked = true;

                }
            }
        }

        protected void lnkSelectTransact_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenus2", @"window.open('LoanTransactionInfo2.aspx', 'Loan Transaction Information', 'width=895, height=600');", true);
        }

        protected void gvSearch_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void gvAmortizations_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //GridViewRow gvr = (GridViewRow)((e.CommandArgument));
            //int RowIndex;
            //int.TryParse(e.CommandArgument.ToString(),out RowIndex);
            //((CheckBox)gvAmortizations.Rows[RowIndex].FindControl("ckPaid")).Enabled = true;
        }

        protected void ckPaid_CheckedChanged1(object sender, EventArgs e)
        {
            int RowIndex = gvAmortizations.SelectedIndex;
            string TransactCode = ((Label)gvAmortizations.Rows[RowIndex].FindControl("lblTransactCode")).Text;
            string AmortCode = ((Label)gvAmortizations.Rows[RowIndex].FindControl("lblAmortCode")).Text;
            bool ChkPaid = ((CheckBox)gvAmortizations.Rows[RowIndex].FindControl("ckPaid")).Checked;


            if (helpers.UpdateLoanAmortization(TransactCode, AmortCode, ChkPaid))
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Transaction saved!');});", true);
                //ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#MemberMaintenance').collapse('show');", true);
                helpers.UpdateLoanTransactionPaid(TransactCode);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionError", @"$(document).ready(function(){alertify.error('Transaction failed!');});", true);
            }
        }

        protected void gvSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gv = (GridView)sender;
            gv.PageIndex = e.NewPageIndex;
            BindTransactCode("");
        }


    }
}