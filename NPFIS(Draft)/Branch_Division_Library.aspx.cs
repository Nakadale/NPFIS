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
            btnEdit.Enabled = true;
            BTNDelete.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (btnAddSave.Text == "Add")
            {
                gvDivision.FooterRow.Visible = true;
                btnAddSave.Text = "Save";
                btnDeleteCancel.Text = "Cancel";
                ((Label)gvDivision.FooterRow.FindControl("lblBranchIDFooter")).Text = DDLBranchID.SelectedValue.ToString();
                btnAddSave.Attributes.Add("onclick","Confirm()");
                btnDeleteCancel.Enabled = true;
            }
            else
            {
                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Yes")
                {

                    gvDivision.FooterRow.Visible = false;
                    btnAddSave.Text = "Add";
                    btnDeleteCancel.Text = "Delete";

                    string BranchID = ((Label)gvDivision.FooterRow.FindControl("lblBranchIDFooter")).Text;
                    string DivisionID = ((TextBox)gvDivision.FooterRow.FindControl("txtDivisionID")).Text;
                    string DivisionName = ((TextBox)gvDivision.FooterRow.FindControl("txtDivisionName")).Text;
                    if (DivisionID != "")
                    {
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
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Division saved!');});", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.error('Division ID or Division Name already in use!');});", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Division_ID_Missing", @"$(document).ready(function(){alertify.error('Division ID is missing!');});", true);
                    }

                }
                btnAddSave.Attributes.Add("onclick", "");
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
            BTNSave.Visible = true;
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
            btnEdit.Enabled = true;
            BTNDelete.Enabled = true;
        }

        protected void BTNSave_Click(object sender, EventArgs e)
        {
            if (btnEdit.Enabled == false)
            {
                string BranchID = BranchHelper.GetLastBranchID();
                string Branchname = (string)this.TxtNewBranchName.Text.ToString();
                BranchHelper.InsertBranch(BranchID, Branchname);
                DropDownList ddlBranch = (DropDownList)DDLBranchID;
                BindBranchID(ddlBranch);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Branch saved!');});", true);
                btnEdit.Enabled = false;
                BTNDelete.Enabled = false;
            }
            else
            {
                string BranchID = DDLBranchID.SelectedValue.ToString();
                string Branchname = (string)this.TxtNewBranchName.Text.ToString();
                BranchHelper.UpdateBranch(BranchID, Branchname);
                DropDownList ddlBranch = (DropDownList)DDLBranchID;
                BindBranchID(ddlBranch);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Branch saved!');});", true);
                btnEdit.Enabled = false;
                BTNDelete.Enabled = false;

            }
        }

        protected void btnDeleteCancel_Click(object sender, EventArgs e)
        {
            if (btnDeleteCancel.Text == "Delete")
            {
                //if (confirm("Are you sure you want to delete?"))
                //{
                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Yes")
                {
                    btnAddSave.Text = "Add";
                    btnDeleteCancel.Text = "Delete";
                    string DivisionID = ViewState["DivisionID"].ToString().Trim();
                    BranchHelper.DeleteDivision(DivisionID);
                    gvDivision.FooterRow.Visible = false;

                    string ddlBid = DDLBranchID.SelectedValue.ToString();
                    gvDivision.DataSource = BranchHelper.LoadDivisionByBranch(ddlBid);
                    gvDivision.DataBind();
                    btnAddSave.Attributes.Add("onclick", "");
                    btnDeleteCancel.Enabled = false;

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Division deleted!');});", true);
                }
                //}
            }
            else
            {
                gvDivision.FooterRow.Visible = false;
                btnAddSave.Text = "Add";
                btnDeleteCancel.Text = "Delete";
                btnAddSave.Attributes.Add("onclick", "");
                btnDeleteCancel.Enabled = false;
            }
        }

        protected void BTNDelete_Click(object sender, EventArgs e)
        {
            string BranchID = DDLBranchID.SelectedValue.ToString();
            if (BranchHelper.CheckBranchIDInDivision(BranchID))
            {
                BranchHelper.DeleteBranch(BranchID);
                DropDownList ddlBranch = (DropDownList)DDLBranchID;
                BindBranchID(ddlBranch);
                btnEdit.Visible = true;
                ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Branch deleted!');});", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.error('Branch in use! Selected branch cannot be deleted.');});", true);
            }
        }

        protected void gvDivision_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            string DivisionID = ((Label)gvDivision.Rows[gvDivision.SelectedIndex].FindControl("lblDivisionID")).Text;
            ViewState["DivisionID"] = DivisionID;
            btnDeleteCancel.Enabled = true;
            btnDeleteCancel.Attributes.Add("onclick","ConfirmDel()");
        }

        protected void BTNUpdate_Click(object sender, EventArgs e)
        {
            string BranchID = DDLBranchID.SelectedValue.ToString();
            string Branchname = (string)this.TxtNewBranchName.Text.ToString();
            BranchHelper.UpdateBranch(BranchID, Branchname);
            DropDownList ddlBranch = (DropDownList)DDLBranchID;
            BindBranchID(ddlBranch);
            btnEdit.Visible = true;
        }
    }
}