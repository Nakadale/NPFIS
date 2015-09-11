using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                DropDownList DDLMembers = (DropDownList)DDLMember;
                BindMember(DDLMembers);
                DropDownList DDLLoan = (DropDownList)DDLLoanType;
                BindLoanType(DDLLoan);

            }
        }

        private void BindGrid()
        {
            gvAmortizations.DataSource = helpers.LoadAmortizations("000");
            gvAmortizations.DataBind();
        }
        private void BindLoanType(DropDownList ddl)
        {
            ddl.DataSource = helpers.LoadLoanType();
            ddl.DataTextField = "Description";
            ddl.DataValueField = "LoanID";
            ddl.DataBind();
        }

        private void BindMember(DropDownList ddl)
        {
            ddl.DataSource = helpers.LoadMemberList();
            ddl.DataTextField = "Member_Name";
            ddl.DataValueField = "EmpId";
            ddl.DataBind();
        }

        private void BindTransactCode(DropDownList ddl,string EmpID)
        {
            ddl.DataSource = helpers.LoadEmpTransactions(EmpID);
            ddl.DataTextField = "TransactCode";
            ddl.DataValueField = "TransactCode";
            ddl.DataBind();
        }

        private void BindAmortizations(string TransactID)
        {
            gvAmortizations.DataSource = helpers.LoadAmortizations(TransactID);
            gvAmortizations.DataKeyNames = new string[] { "PAYDATE", "PAYAMOUNT","INTAMOUNT","BALANCE" };
            gvAmortizations.DataBind();
        }

        protected void DDLMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.TxtDivision.Text = helpers.GetDivisionName(DDLMember.SelectedValue.ToString());
            this.TxtBranch.Text = helpers.GetBranchName(DDLMember.SelectedValue.ToString());
            DropDownList ddlTransactCode = (DropDownList)ddlTranCode;
            BindTransactCode(ddlTransactCode,DDLMember.SelectedValue.ToString());
        }

        protected void DDLLoanType_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.TxtInterestRate.Text = helpers.GetInterestRate(DDLLoanType.SelectedValue.ToString());
        }

        protected void BTNSave_Click(object sender, EventArgs e)
        {
            string DDLEmpID = this.DDLMember.SelectedValue.ToString();
            string DDLTransactCode = this.ddlTranCode.SelectedValue.ToString();
            string DDLLoanType = this.DDLLoanType.SelectedValue.ToString();
            string TxtDivision = this.TxtDivision.Text;
            string TxtBranch = this.TxtBranch.Text;
            string TxtLoanApp = this.TxtLoanAppNo.Text;
            string TxtLoanDate = this.TxtLoanDate.Text;
            string TxtIssuedCheque = this.TxtIssuedCheque.Text;
            string TxtIssuedChequeDate = this.TxtIssuedChequeDate.Text;
            string TxtChequeReleasedDate = this.TxtChequeReleasedDate.Text;
            double TxtPrincipalAmount;
            double.TryParse(this.TxtPrincipalAmount.Text, out TxtPrincipalAmount);
            double TxtInterestRate;
            double.TryParse(this.TxtInterestRate.Text, out TxtInterestRate);
            double TxtServiceFee;
            double.TryParse(this.TxtServiceFee.Text,out TxtServiceFee);
            int TxtPaymentTerms; 
            int.TryParse(this.TxtPaymentTerms.Text, out TxtPaymentTerms);
            string TxtStartAmort = this.TxtStartAmort.Text;
            string TxtEndAmort = this.TxtEndAmort.Text;
            bool ChPaidUpLoad = this.CkPaidUpLoan.Checked;
            string DDLLDDLLoanType = this.DDLLoanType.Text;

            if (helpers.CheckIfExist(DDLTransactCode))
            { // for updating of old transactions
                if (helpers.UpdateLoanTransaction(DDLTransactCode, DDLEmpID, DDLLoanType, TxtDivision, TxtLoanApp, TxtLoanDate, TxtIssuedCheque, TxtIssuedChequeDate, TxtChequeReleasedDate, TxtStartAmort, TxtEndAmort, TxtPrincipalAmount, TxtPaymentTerms, TxtInterestRate, TxtServiceFee, ChPaidUpLoad))
                {
                    //will put up something with more flair here
                }
                else
                {
                    //will put up something with more flair here
                }
            }
            else
            { // for insertion of new transactions
                if (helpers.InsertLoanTransaction(DDLTransactCode, DDLEmpID, DDLLoanType, TxtDivision, TxtLoanApp, TxtLoanDate, TxtIssuedCheque, TxtIssuedChequeDate, TxtChequeReleasedDate, TxtStartAmort, TxtEndAmort, TxtPrincipalAmount, TxtPaymentTerms, TxtInterestRate, TxtServiceFee, ChPaidUpLoad))
                {
                    //will put up something with more flair here
                }
                else
                {
                    //will put up something with more flair here
                }

            }
        }

        protected void BTNEdit_Click(object sender, EventArgs e)
        {
            this.BTNCancel.Visible = true;
            this.DDLLoanType.Enabled = true;
            this.TxtLoanAppNo.Enabled = true;
            this.TxtLoanDate.Enabled = true;
            this.TxtIssuedCheque.Enabled = true;
            this.TxtIssuedChequeDate.Enabled = true;
            this.TxtChequeReleasedDate.Enabled = true;
            this.TxtPrincipalAmount.Enabled = true;
            this.TxtInterestRate.Enabled = true;
            this.TxtServiceFee.Enabled = true;
            this.TxtPaymentTerms.Enabled = true;
            this.TxtStartAmort.Enabled = true;
            this.TxtEndAmort.Enabled = true;
            this.CkPaidUpLoan.Enabled = true;
            this.DDLMember.Enabled = false;
            BTNnew.Enabled = true;
            BTNDelete.Enabled = false;
            BTNSearch.Enabled = false;
            BTNPrint.Enabled = false;
        }

        protected void BTNCancel_Click(object sender, EventArgs e)
        {
            this.BTNCancel.Visible = false;
            this.DDLLoanType.Enabled = false;
            this.TxtLoanAppNo.Enabled = false;
            this.TxtLoanDate.Enabled = false;
            this.TxtIssuedCheque.Enabled = false;
            this.TxtIssuedChequeDate.Enabled = false;
            this.TxtChequeReleasedDate.Enabled = false;
            this.TxtPrincipalAmount.Enabled = false;
            this.TxtInterestRate.Enabled = false;
            this.TxtServiceFee.Enabled = false;
            this.TxtPaymentTerms.Enabled = false;
            this.TxtStartAmort.Enabled = false;
            this.TxtEndAmort.Enabled = false;
            this.CkPaidUpLoan.Enabled = false;
            this.DDLMember.Enabled = true;
            BTNnew.Enabled = true;
            BTNEdit.Enabled = true;
            BTNDelete.Enabled = true;
            BTNSearch.Enabled = true;
            BTNPrint.Enabled = true;
            this.ddlTranCode.Visible = true;
            this.txtTranCode.Visible = false;
        }
        protected void BTNnew_Click(object sender, EventArgs e)
        {
            this.DDLLoanType.Enabled = true;
            this.TxtLoanAppNo.Enabled = true;
            this.TxtLoanDate.Enabled = true;
            this.TxtIssuedCheque.Enabled = true;
            this.TxtIssuedChequeDate.Enabled = true;
            this.TxtChequeReleasedDate.Enabled = true;
            this.TxtPrincipalAmount.Enabled = true;
            this.TxtInterestRate.Enabled = true;
            this.TxtServiceFee.Enabled = true;
            this.TxtPaymentTerms.Enabled = true;
            this.TxtStartAmort.Enabled = true;
            this.TxtEndAmort.Enabled = true;
            this.CkPaidUpLoan.Enabled = true;
            BTNEdit.Enabled = false;
            BTNDelete.Enabled = false;
            BTNSearch.Enabled = false;
            BTNPrint.Enabled = false;
            BTNCancel.Visible = true;
            this.ddlTranCode.Items.Clear();
            this.ddlTranCode.Items.Add(helpers.GetLastTranCode());
            this.ddlTranCode.DataBind();
        }

        protected void ddlTranCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox TxtLoanApp = (TextBox)this.TxtLoanAppNo;
            TextBox TxtLoanDate = (TextBox)this.TxtLoanDate;
            TextBox TxtIssuedCheque = (TextBox)this.TxtIssuedCheque;
            TextBox TxtIssuedChequeDate = (TextBox)this.TxtIssuedChequeDate;
            TextBox TxtChequeReleasedDate = (TextBox)this.TxtChequeReleasedDate;
            TextBox TxtPrincipalAmount = (TextBox)this.TxtPrincipalAmount;
            TextBox TxtInterestRate = (TextBox)this.TxtInterestRate;
            TextBox TxtServiceFee = (TextBox)this.TxtServiceFee;
            TextBox TxtPaymentTerms = (TextBox)this.TxtPaymentTerms;
            TextBox TxtStartAmort = (TextBox)this.TxtStartAmort;
            TextBox TxtEndAmort = (TextBox)this.TxtEndAmort;
            CheckBox ChPaidUpLoad = (CheckBox)this.CkPaidUpLoan;
            DropDownList DDLLDDLLoanType = (DropDownList)this.DDLLoanType;
            //helpers.LoadEmpTransactRecord(ddlTranCode.SelectedValue.ToString(), TxtLoanApp, TxtLoanDate, TxtIssuedCheque, TxtIssuedChequeDate, TxtChequeReleasedDate, TxtPrincipalAmount, TxtInterestRate, TxtServiceFee, TxtPaymentTerms, TxtStartAmort, TxtEndAmort, CkPaidUpLoan, DDLLoanType);
            BindAmortizations(ddlTranCode.SelectedValue.ToString());
        }

        protected void BTNDelete_Click(object sender, EventArgs e)
        {
            if (helpers.DeleteRecord(ddlTranCode.SelectedValue.ToString()))
            {
                lblstatus.Text = "Success!";
            }
            else
            {
                lblstatus.Text = "NOOOOOOOOOOOO!!!Zombies!!!";
            }
        }

        protected void btnAddRec_Click(object sender, EventArgs e)
        {
            //if (helpers.InsertLoanAmortization())
            //{

            //}
            //else
            //{

            //}
        }

        protected void txtEditAmount_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFooterAmount_TextChanged(object sender, EventArgs e)
        {
            double PrincipalAmount;
            double.TryParse(TxtPrincipalAmount.Text, out PrincipalAmount);

            double InterestRate;
            double.TryParse(TxtInterestRate.Text, out InterestRate);

            int NumTerm;
            int.TryParse(TxtPaymentTerms.Text, out NumTerm);

            double Interest;

            Interest = PrincipalAmount * (InterestRate / (NumTerm / 12));

            ((Label)gvAmortizations.FooterRow.FindControl("lblEditInterest")).Text = Interest.ToString();

        }
    }
}