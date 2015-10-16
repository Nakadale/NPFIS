using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Members_Share : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            TxtName.Enabled = true;
            TxtBranch.Enabled = true;
            TxtDivision.Enabled = true;
            TxtMonthlySalary.Enabled = true;
            TxtPercentageShare.Enabled = true;
        
        }

        private void BindTransactCode(string SearchKey)
        {
            gvSearch.DataSource = helpers.LoadSearchedMembers(SearchKey);
            gvSearch.DataKeyNames = new string[] { "EMPID", "FIRSTNAME", "LASTNAME", "MIDNAME", "BIRTHDATE" };
            gvSearch.DataBind();
        }

        protected void btnSearchMember_Click(object sender, EventArgs e)
        {
            string txtSearchKeyword = (string)txtSearch.Text;
            BindTransactCode(txtSearchKeyword);
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;

                TextBox divisionname = (TextBox)TxtDivision;
                TextBox salary = (TextBox)this.TxtMonthlySalary;
                TextBox computedshare = (TextBox)this.TxtComputedShare;
                TextBox branch = (TextBox)this.TxtBranch;
                TextBox perofshare = (TextBox)this.TxtPercentageShare;
                TextBox fullname = (TextBox)this.TxtName;
                TextBox empid2 = (TextBox)this.Txtempid;
                
                TxtBranch.Enabled = false;
                TxtComputedShare.Enabled = false;
                TxtDivision.Enabled = false;
                TxtMonthlySalary.Enabled = false;
                TxtPercentageShare.Enabled = false;
                TxtName.Enabled = false;
                Txtempid.Enabled = false;

                string tempempid = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
                Helper.LoadMemberShare(tempempid, fullname, divisionname, branch, salary, perofshare, empid2);

               // GridView1.Visible = true;
                GridView1.DataSource = Helper.LoadShareDetails(((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text);
                GridView1.DataKeyNames = new string[] { "dateremit", "amount", "salarybasis", "perofsharebasis", "remarks" };
                GridView1.DataBind();

               

                if (String.IsNullOrEmpty(Txtempid.Text))
                    btnEdit.Enabled = false;
                else
                    btnEdit.Enabled = true;
                
                gvSearch.DataSource = null;
                gvSearch.DataBind();
            }
        }

        protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void LoadShare(string empid)
        {
            GridView1.DataSource = Helper.LoadShareDetails(empid);
            GridView1.DataBind();
        }
    }
}