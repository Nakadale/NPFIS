using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace NPFIS_Draft_
{
    public partial class NewLoanTransaction : System.Web.UI.Page
    {
        public string EmpID { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            if (!IsPostBack)
            {
                DropDownList DDLLoan = (DropDownList)DDLLoanType;
                BindLoanType(DDLLoan);
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LoanMaintenance').collapse('show');", true);

        }
        private void BindMember(DropDownList ddl)
        {
            ddl.DataSource = helpers.LoadMemberList();
            ddl.DataTextField = "Member_Name";
            ddl.DataValueField = "EmpId";
            ddl.DataBind();
        }
        private void BindLoanType(DropDownList ddl)
        {
            ddl.DataSource = helpers.LoadLoanType();
            ddl.DataTextField = "Description";
            ddl.DataValueField = "LoanID";
            ddl.DataBind();
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            double PrincipalAmount;
            double.TryParse(TxtPrincipalAmount.Text, out PrincipalAmount);
            double ServiceFee;
            double.TryParse(TxtServiceFee.Text, out ServiceFee);
            int Interest = int.Parse(TxtInterestRate.Text);
            string StartAmort = TxtStartAmort.Text;
            int NumPay = int.Parse(TxtPaymentTerms.Text);
            GridView gvAmort = (GridView) this.gvAmortizations;
            TextBox EndAmort = (TextBox)this.TxtEndAmort;
            helpers.GenerateAmortization(NumPay,StartAmort,PrincipalAmount,Interest,ServiceFee,gvAmort, EndAmort);
        }

        private void BindTransactCode(DropDownList ddl, string EmpID)
        {
            ddl.DataSource = helpers.LoadEmpTransactions(EmpID);
            ddl.DataTextField = "TransactCode";
            ddl.DataValueField = "TransactCode";
            ddl.DataBind();
        }
        protected void DDLMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.TxtDivision.Text = helpers.GetDivisionName(DDLMember.SelectedValue.ToString());
            //this.TxtBranch.Text = helpers.GetBranchName(DDLMember.SelectedValue.ToString());
            //DropDownList ddlTransactCode = (DropDownList)ddlTranCode;
            //BindTransactCode(ddlTransactCode, DDLMember.SelectedValue.ToString());
        }

        protected void DDLLoanType_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.TxtInterestRate.Text = helpers.GetInterestRate(DDLLoanType.SelectedValue.ToString());
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if ((int.Parse(gvAmortizations.Rows.ToString())) != 0)
            {
                double InterestAmount;
                string DDLEmpID = ((Label)gvSearch.SelectedRow.FindControl("lblEmpIDDisp")).Text;
                string DDLTransactCode = helpers.GetLastTranCode();
                string DDLLoanType = this.DDLLoanType.SelectedValue.ToString();
                string TxtDivision = this.TxtDivision.Text;
                string TxtBranch = this.TxtBranch.Text;
                string TxtLoanApp = this.TxtLoanAppNo.Text;
                string TxtLoanDate = this.TxtLoanDate.Text;
                string TxtIssuedCheque = this.TxtIssuedCheque.Text;
                string IssuedChequeDate = this.TxtIssuedChequeDate.Text;
                string ChequeReleasedDate = this.TxtChequeReleasedDate.Text;
                double TxtPrincipalAmount;
                double.TryParse(this.TxtPrincipalAmount.Text, out TxtPrincipalAmount);
                double TxtInterestRate;
                double.TryParse(this.TxtInterestRate.Text, out TxtInterestRate);
                double TxtServiceFee;
                double.TryParse(this.TxtServiceFee.Text, out TxtServiceFee);
                int TxtPaymentTerms;
                int.TryParse(this.TxtPaymentTerms.Text, out TxtPaymentTerms);
                string TxtStartAmort = this.TxtStartAmort.Text;
                string TxtEndAmort = this.TxtEndAmort.Text;
                bool ChPaidUpLoad = this.CkPaidUpLoan.Checked;
                string DDLLDDLLoanType = this.DDLLoanType.Text;
                GridView gVAmort = (GridView)this.gvAmortizations;
                string UserID = Session["user"].ToString();

                //InterestAmount = (TxtPrincipalAmount * (TxtInterestRate / 100));
                InterestAmount = (TxtPrincipalAmount / TxtPaymentTerms);
                // Before attempting to save the file, verify
                // that the FileUpload control contains a file.
                if (fuScannedForm.HasFile)
                {    // Call a helper method routine to save the file.
                    SaveFile(fuScannedForm.PostedFile);
                    CreateEntry(DDLTransactCode, fuScannedForm.PostedFile);
                }
                else
                {
                    // Notify the user that a file was not uploaded.
                    //UploadStatusLabel.Text = "You did not specify a file to upload."; 
                }
                // for insertion of new transactions
                if (helpers.InsertLoanTransaction(DDLTransactCode, DDLEmpID, DDLLoanType, TxtDivision, TxtLoanApp, TxtLoanDate, TxtIssuedCheque, IssuedChequeDate, ChequeReleasedDate, TxtStartAmort, TxtEndAmort, TxtPrincipalAmount, TxtPaymentTerms, TxtInterestRate, TxtServiceFee, ChPaidUpLoad, UserID))
                {
                    //will put up something with more flair here
                    if (helpers.InsertLoanAmortization(DDLTransactCode, DDLEmpID, DDLLoanType, InterestAmount, gVAmort, UserID))
                    {
                        Refresh();
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Transaction saved!');});", true);
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#MemberMaintenance').collapse('show');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionError", @"$(document).ready(function(){alertify.error('Transaction failed!');});", true);
                        return;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionError", @"$(document).ready(function(){alertify.error('Transaction failed!');});", true);
                    return;
                }

            } 
            
        }

        private void CreateEntry(string DDLTransactCode, HttpPostedFile File)
        {
            helpers.CreateEntryScannedApp(DDLTransactCode, File.FileName.ToString());
        }

        void Refresh()
        {
            this.DDLLoanType.SelectedIndex = 0;
            this.TxtMember.Text = "";
            this.TxtDivision.Text = "";
            this.TxtBranch.Text = "";
            this.TxtLoanAppNo.Text = "";
            this.TxtLoanDate.Text = "";
            this.TxtIssuedCheque.Text = "";
            this.TxtIssuedChequeDate.Text = "";
            this.TxtChequeReleasedDate.Text = "";
            this.TxtPrincipalAmount.Text = "";
            this.TxtInterestRate.Text = "";
            this.TxtServiceFee.Text = "";
            this.TxtPaymentTerms.Text = "";
            this.TxtStartAmort.Text = "";
            this.TxtEndAmort.Text = "";
            this.DDLLoanType.SelectedIndex = 0;
            gvSearch.DataSource = "";
            gvSearch.DataBind();
            gvAmortizations.DataSource = "";
            gvAmortizations.DataBind();
        }
        void SaveFile(HttpPostedFile file)
        {
            // Specify the path to save the uploaded file to.
            string savePath = Server.MapPath(".") + @"\upload\";

            // Get the name of the file to upload.
            string fileName = fuScannedForm.FileName;

            // Create the path and file name to check for duplicates.
            string pathToCheck = savePath + fileName;

            // Create a temporary file name to use for checking duplicates.
            string tempfileName = "";

            // Check to see if a file already exists with the
            // same name as the file to upload.        
            if (System.IO.File.Exists(pathToCheck))
            {
                int counter = 2;
                while (System.IO.File.Exists(pathToCheck))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    tempfileName = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }

                fileName = tempfileName;

                // Notify the user that the file name was changed.
                //UploadStatusLabel.Text = "A file with the same name already exists." +
                    //"<br />Your file was saved as " + fileName;
            }
            else
            {
                // Notify the user that the file was saved successfully.
                //UploadStatusLabel.Text = "Your file was uploaded successfully.";
            }

            // Append the name of the file to upload to the path.
            savePath += fileName;

            // Call the SaveAs method to save the uploaded
            // file to the specified directory.
            fuScannedForm.SaveAs(savePath);

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

        protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;
                TxtMember.Text = ((Label)gvSearch.Rows[RowIndex].FindControl("lblSurnameDisp")).Text + ", " + ((Label)gvSearch.Rows[RowIndex].FindControl("lblFirstNameDisp")).Text + " " + ((Label)gvSearch.Rows[RowIndex].FindControl("lblMiddleNameDisp")).Text;
                this.TxtDivision.Text = helpers.GetDivisionName(((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text);
                this.TxtBranch.Text = helpers.GetBranchName(((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text);
                //ViewState["EmpID"] = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
                gvSearch.DataSource = null;
                gvSearch.DataBind();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Refresh();
        }
    }
}