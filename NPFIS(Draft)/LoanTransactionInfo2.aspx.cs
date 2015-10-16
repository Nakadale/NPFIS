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
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            TextBox DDLLoanType = this.txtLoanType;
            TextBox TxtMember = this.txtMember;
            TextBox TxtDivision = this.TxtDivision;
            TextBox TxtBranch = this.TxtBranch;
            TextBox TxtLoanApp = this.TxtLoanAppNo;
            TextBox TxtLoanDate = this.TxtLoanDate;
            TextBox TxtIssuedCheque = this.TxtIssuedCheque;
            TextBox IssuedChequeDate = this.TxtIssuedChequeDate;
            TextBox ChequeReleasedDate = this.TxtChequeReleasedDate;
            TextBox TxtPrincipalAmount = this.TxtPrincipalAmount;
            TextBox TxtInterestRate = this.TxtInterestRate;
            TextBox TxtServiceFee = this.TxtServiceFee;
            TextBox TxtPaymentTerms = this.TxtPaymentTerms;
            TextBox TxtStartAmort = this.TxtStartAmort;
            TextBox TxtEndAmort = this.TxtEndAmort;
            CheckBox ChPaidUpLoad = this.CkPaidUpLoan;
            HyperLink ScannedApp = this.HlScannedApp;
            string TransactID = Session[ID].ToString();
            BindWebForm(TransactID, DDLLoanType, TxtMember, TxtDivision, TxtBranch, TxtLoanApp, TxtLoanDate, TxtIssuedCheque,
                IssuedChequeDate, ChequeReleasedDate, TxtPrincipalAmount, TxtInterestRate, TxtServiceFee, TxtPaymentTerms, TxtStartAmort, TxtEndAmort, ChPaidUpLoad, HlScannedApp);
        }
        private void BindWebForm(string TransactID, TextBox DDLLoanType, TextBox TxtMember, TextBox TxtDivision, TextBox TxtBranch, TextBox TxtLoanApp, TextBox TxtLoanDate, TextBox TxtIssuedCheque,
            TextBox IssuedChequeDate, TextBox ChequeReleasedDate, TextBox TxtPrincipalAmount, TextBox TxtInterestRate, TextBox TxtServiceFee, TextBox TxtPaymentTerms,
            TextBox TxtStartAmort, TextBox TxtEndAmort, CheckBox ChPaidUpLoad, HyperLink HlScannedApp)
        {
            helpers.LoadTransactInfo(TransactID, DDLLoanType, TxtMember, TxtDivision, TxtBranch, TxtLoanApp, TxtLoanDate, TxtIssuedCheque,
                IssuedChequeDate, ChequeReleasedDate, TxtPrincipalAmount, TxtInterestRate, TxtServiceFee, TxtPaymentTerms, TxtStartAmort, TxtEndAmort, ChPaidUpLoad, HlScannedApp);
        }
    }
}