using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            ddlLoanID.DataSource = LoanMaintenanceHelper.LoadLoanID();
            ddlLoanID.DataTextField = "LoanID";
            ddlLoanID.DataValueField = "LoanID";
            ddlLoanID.DataBind();
        }

        protected void BTNDelete_Click(object sender, EventArgs e)
        {
            if (LoanMaintenanceHelper.DeleteRecord(ddlLoanID.SelectedValue.ToString()))
            {

            }
            else 
            {

            }
        }

        protected void BTNnew_Click(object sender, EventArgs e)
        {
            //TxtLoanID.Enabled = true; not sure about this yet.
            TxtLoanType.Enabled = true;
            TxtDescription.Enabled = true;
            TxtInterestRate.Enabled = true;
            this.ddlLoanID.Items.Clear();
            this.ddlLoanID.Items.Add(LoanMaintenanceHelper.GetLastLoanID());
            this.ddlLoanID.DataBind();
            TxtLoanType.Text = "";
            TxtDescription.Text = "";
            TxtInterestRate.Text = "";
        }

        protected void BTNEdit_Click(object sender, EventArgs e)
        {
            TxtLoanType.Enabled = true;
            TxtDescription.Enabled = true;
            TxtInterestRate.Enabled = true;
        }

        protected void ddlLoanID_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox TxtLoanType = (TextBox)this.TxtLoanType;
            TextBox TxtDescription = (TextBox)this.TxtDescription;
            TextBox TxtInterestRate = (TextBox)this.TxtInterestRate;
            LoanMaintenanceHelper.LoadLoanInformation(ddlLoanID.SelectedValue.ToString(), TxtLoanType, TxtDescription, TxtInterestRate);
        }

        protected void BTNCancel_Click(object sender, EventArgs e)
        {
            this.TxtLoanType.Enabled = false;
            this.TxtDescription.Enabled = false;
            this.TxtInterestRate.Enabled = false;
            BindGrid();
        }

        protected void BTNSave_Click(object sender, EventArgs e)
        {
            string ddlLoanID = this.ddlLoanID.SelectedValue.ToString();
            string TxtLoanType = this.TxtLoanType.Text;
            string TxtDescription = this.TxtDescription.Text;
            string TxtInterestRate = this.TxtInterestRate.Text;
            if (LoanMaintenanceHelper.CheckIfExist(ddlLoanID))
            { // for updating of old transactions
                if (LoanMaintenanceHelper.UpdateLoanType(ddlLoanID, TxtLoanType, TxtDescription, TxtInterestRate))
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
                if (LoanMaintenanceHelper.InsertLoanType(ddlLoanID, TxtLoanType, TxtDescription, TxtInterestRate))
                {
                    //will put up something with more flair here
                }
                else
                {
                    //will put up something with more flair here
                }

            }
        }
    }
}