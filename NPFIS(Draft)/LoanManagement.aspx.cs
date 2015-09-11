using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class LoanManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                gvTransactions.DataSource = helpers.LoadEmpTransactRecord(EmpID);
                gvTransactions.DataKeyNames = new string[] { "LOANTYPE", "PRINCIPALAMOUNT", "DATEFILED", "BALANCE", "PAID", "TRANSACTCODE" };
                gvTransactions.DataBind();

            }
        }

        protected void gvTransactions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;
                string TransactCode = ((Label)gvTransactions.Rows[RowIndex].FindControl("lblTransactCode")).Text;
                gvAmortizations.DataSource = helpers.LoadAmortizations(TransactCode);
                gvAmortizations.DataKeyNames = new string[] { "PAYDATE", "PAYAMOUNT", "BALANCE", "PAID" };
                gvAmortizations.DataBind();
            }
        }
    }
}