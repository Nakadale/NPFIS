using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Branch_Division_Library : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            if (!IsPostBack)
            {
                DropDownList ddlBranch = (DropDownList)DDLBranchID;
                BindBranchID(ddlBranch);
                gvDivision.DataSource = BranchHelper.LoadDivision();
                gvDivision.DataKeyNames = new string[] { "BranchID", "DivisionID", "DivisionName" };
                gvDivision.DataBind();
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LibraryMaintenance').collapse('show');", true);
        }
        private void BindBranchID(DropDownList DDLBranchID)
        {
            DDLBranchID.DataSource = BranchHelper.LoadBranchID();
            DDLBranchID.DataTextField = "BranchName";
            DDLBranchID.DataValueField = "BranchID";
            DDLBranchID.DataBind();
        }

        protected void DDLBranchID_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ddlBid = DDLBranchID.SelectedValue.ToString();
            gvDivision.DataSource = BranchHelper.LoadDivisionByBranch(ddlBid);
            gvDivision.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (btnAddSave.Text == "Add")
            {
                gvDivision.FooterRow.Visible = true;
                btnAddSave.Text = "Save";
                btnDeleteCancel.Text = "Cancel";
                ((Label)gvDivision.FooterRow.FindControl("lblBranchIDFooter")).Text = DDLBranchID.SelectedValue.ToString();
            }
            else
            {
                gvDivision.FooterRow.Visible = false;
                btnAddSave.Text = "Add";
                btnDeleteCancel.Text = "Delete";

                string BranchID = ((Label)gvDivision.FooterRow.FindControl("lblBranchIDFooter")).Text;
                string DivisionID = ((TextBox)gvDivision.FooterRow.FindControl("txtDivisionID")).Text;
                string DivisionName = ((TextBox)gvDivision.FooterRow.FindControl("txtDivisionName")).Text;
                if (BranchHelper.CheckDivisionIDandDivisionName(DivisionID, DivisionName) == true)
                {
                    BranchHelper.InsertDivision(BranchID, DivisionID, DivisionName);
                    ((Label)gvDivision.FooterRow.FindControl("lblBranchIDFooter")).Text = "";
                    ((TextBox)gvDivision.FooterRow.FindControl("txtDivisionID")).Text = "";
                    ((TextBox)gvDivision.FooterRow.FindControl("txtDivisionName")).Text = "";
                    gvDivision.FooterRow.Visible = false;

                    string ddlBid = DDLBranchID.SelectedValue.ToString();
                    gvDivision.DataSource = BranchHelper.LoadDivisionByBranch(ddlBid);
                    gvDivision.DataBind();
                }
                else
                {

                }
            }
        }

        protected void gvDivision_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gv = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow && ((GridView)sender).EditIndex == -1)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor = 'hand';this.style.textDecoration = 'underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration = 'none';";
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            BTNSave.Visible = false;
            BTNUpdate.Visible = true;
            TextBox TxtBranch = this.TxtNewBranchName;
            BranchHelper.LoadBranch(DDLBranchID.SelectedValue.ToString(), TxtBranch);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenBranch", @"$('#NewBranch').collapse('show');$('#OldBranch').collapse('hide');", true);
        }


        protected void BTNCancel_Click(object sender, EventArgs e)
        {
            TxtNewBranchName.Text = "";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenBranch", @"$('#NewBranch').collapse('hide');$('#OldBranch').collapse('show');", true);
        }

        protected void txtDivisionName_TextChanged(object sender, EventArgs e)
        {
        }

        protected void DDLBranchID_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string ddlBid = DDLBranchID.SelectedValue.ToString();
            gvDivision.DataSource = BranchHelper.LoadDivisionByBranch(ddlBid);
            gvDivision.DataBind();
        }

        protected void BTNSave_Click(object sender, EventArgs e)
        {
            string BranchID = BranchHelper.GetLastBranchID();
            string Branchname = (string)this.TxtNewBranchName.Text.ToString();
            BranchHelper.InsertBranch(BranchID, Branchname);
            DropDownList ddlBranch = (DropDownList)DDLBranchID;
            BindBranchID(ddlBranch);
        }

        protected void btnDeleteCancel_Click(object sender, EventArgs e)
        {
            if (btnDeleteCancel.Text == "Delete")
            {
                btnAddSave.Text = "Save";
                btnDeleteCancel.Text = "Cancel";
                string DivisionID = ViewState["DivisionID"].ToString().Trim();
                BranchHelper.DeleteDivision(DivisionID);
                gvDivision.FooterRow.Visible = false;

                string ddlBid = DDLBranchID.SelectedValue.ToString();
                gvDivision.DataSource = BranchHelper.LoadDivisionByBranch(ddlBid);
                gvDivision.DataBind();
            }
            else
            {
                gvDivision.FooterRow.Visible = false;
                btnAddSave.Text = "Add";
                btnDeleteCancel.Text = "Delete";
            }
        }

        protected void BTNDelete_Click(object sender, EventArgs e)
        {

        }

        protected void gvDivision_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            string DivisionID = ((Label)gvDivision.Rows[gvDivision.SelectedIndex].FindControl("lblDivisionID")).Text;
            ViewState["DivisionID"] = DivisionID;
        }

        protected void BTNUpdate_Click(object sender, EventArgs e)
        {
            string BranchID = DDLBranchID.SelectedValue.ToString();
            string Branchname = (string)this.TxtNewBranchName.Text.ToString();
            BranchHelper.UpdateBranch(BranchID, Branchname);
            DropDownList ddlBranch = (DropDownList)DDLBranchID;
            BindBranchID(ddlBranch);
            btnEdit.Visible = true;
            BTNUpdate.Visible = false;
        }
    }
}