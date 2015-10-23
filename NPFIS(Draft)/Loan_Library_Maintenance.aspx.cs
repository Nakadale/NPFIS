using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Loan_Library_Maintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            
            if (!IsPostBack)
            {
                if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }

                LoanLib();

            }
        }

        public void LoanLib()
        {
            ddlLoantype.DataSource = Helper.LoadLoanLib();
            ddlLoantype.DataTextField = "LoanType";
            ddlLoantype.DataValueField = "LoanId";
            ddlLoantype.DataBind();
            ListItem Item = new ListItem("");
            ddlLoantype.Items.Insert(0, Item);
            
        }

        public void ddlLoantype_SelectedIndexChanged(object sender, EventArgs e)
        {

            DropDownList ddlLoantype = (DropDownList)sender;
            txtbxDescription.Text = Helper.LoadLoanLibDescription(ddlLoantype.ToString());
        }

        
        



    }
}