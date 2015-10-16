using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Members_Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        private void BindTransactCode(string SearchKey)
        {
            gvSearch.DataSource = helpers.LoadSearchedMembers(SearchKey);
            gvSearch.DataKeyNames = new string[] { "EMPID", "FIRSTNAME", "LASTNAME", "MIDNAME", "BIRTHDATE" };
            gvSearch.DataBind();
        }

        protected void lbtnSearch_Click(object sender, EventArgs e)
        {
            
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {



                lblMemberShow.Text = "";
                lblDivisionValue.Text = "";
                lblTotalShareValue.Text = "";
                lblTotalLoanValue.Text = "";
                lblEmpidShow.Text = "";


                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;
                lblMemberShow.Text = ((Label)gvSearch.Rows[RowIndex].FindControl("lblSurnameDisp")).Text + ", " + ((Label)gvSearch.Rows[RowIndex].FindControl("lblFirstNameDisp")).Text + " " + ((Label)gvSearch.Rows[RowIndex].FindControl("lblMiddleNameDisp")).Text;
                this.lblDivisionValue.Text = helpers.GetDivisionName(((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text);
                lblEmpidShow.Text = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;

               

                string empid = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
                Label lblTotalShareValue2 = (Label) lblTotalShareValue;
                Helper.LoadTotalContribution(empid, lblTotalShareValue2); 
                gvShareContribution.DataSource = Helper.LoadShareDetails(((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text);
                gvShareContribution.DataBind();
              


                gvSearch.DataSource = null;
                gvSearch.DataBind();
                
                //  this.TxtBranch.Text = helpers.GetBranchName(((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text);
                //ViewState["EmpID"] = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
            }
        }

        protected void btnSearchMember_Click(object sender, EventArgs e)
        {

            string txtSearchKeyword = (string)txtSearch.Text;
            BindTransactCode(txtSearchKeyword);
            lblTotalShareValue.Text = "";
            lblDivisionValue.Text = "";
            lblMemberShow.Text = "";
            lblEmpidShow.Text = "";
            gvShareContribution.DataSource = Helper.LoadShareDetails("00");
            gvShareContribution.DataBind();




            
        }


        private void LoadShareDetails(string empid)
        {

            gvShareContribution.DataSource = Helper.LoadShareDetails(empid);
            gvShareContribution.DataBind();

        }

       
    }
}