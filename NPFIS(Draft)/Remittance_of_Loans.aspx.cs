using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Remittance_of_Loans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }

            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#MemberMaintenance').collapse('show');", true);
        }
        protected void gvSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gv = (GridView)sender;
            gv.PageIndex = e.NewPageIndex;
            BindTransactCode("");
        }
        protected void btnSearchMember_Click(object sender, EventArgs e)
        {
            string txtSearchKeyword = (string)txtSearch.Text;
            BindTransactCode(txtSearchKeyword);
        }
        private void BindTransactCode(string SearchKey)
        {
            gvSearch.DataSource = helpers.LoadSearchedMembersRemittance(SearchKey);
            gvSearch.DataKeyNames = new string[] { "EMPID", "FIRSTNAME", "LASTNAME", "MIDNAME", "BIRTHDATE", "BRANCH" };
            gvSearch.DataBind();
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Preview")
            {
                GridView gv = (GridView)sender;
                int RowIndex = int.Parse(gv.SelectedIndex.ToString());
                string fname = ((Label)gvSearch.Rows[RowIndex].FindControl("lblFirstNameDisp")).Text;
                string mname = ((Label)gvSearch.Rows[RowIndex].FindControl("lblMiddleNameDisp")).Text;
                string lname = ((Label)gvSearch.Rows[RowIndex].FindControl("lblSurnameDisp")).Text;
                Session["EmpID"] = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
                Session["FullName"] = lname + ", " + fname;
                Session["Branch"] = ((Label)gvSearch.Rows[RowIndex].FindControl("lblBranch")).Text;
                Response.Redirect("RemittanceOfLoansPreview.aspx");
            }
        }

        protected void gvSearch_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gv = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow && ((GridView)sender).EditIndex == -1)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor = 'hand';this.style.textDecoration = 'underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration = 'none';";
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
            }
        }

        protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;

            if (gvSearch.EditIndex == -1)
            {
                foreach (GridViewRow row in gvSearch.Rows)
                {
                    LinkButton linkSelect = (LinkButton)row.FindControl("lnkSelect");
                    string key = gv.DataKeys[row.RowIndex]["EMPID"].ToString();

                    if (row.RowIndex == gvSearch.SelectedIndex && key != "")
                    {
                        linkSelect.Visible = true;
                    }
                    else
                    {
                        linkSelect.Visible = false;
                    }
                }
            }
        }

    }
}