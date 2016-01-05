using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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

                //LoanLib();
                //LoanLibDelete();
               BindGrid();
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LibraryMaintenance').collapse('show');", true);
        }

        //protected void LoanLib()
        //{
        //    ddlLoantype.DataSource = Helper.LoadLoanLib();
        //    ddlLoantype.DataTextField = "LoanType";
        //    ddlLoantype.DataValueField = "LoanId";
        //    ddlLoantype.DataBind();
        //    ListItem Item = new ListItem("");
        //    ddlLoantype.Items.Insert(0, Item);

        //}

        //protected void LoanLibDelete()
        //{
        //    ddl.DataSource = Helper.LoadLoanLib();
        //    ddl.DataTextField = "LoanType";
        //    ddl.DataValueField = "LoanId";
        //    ddl.DataBind();
        //    ListItem Item = new ListItem("");
        //    ddl.Items.Insert(0, Item);
        //}

        //protected void ddlLoantype_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    DropDownList ddlLoantype = (DropDownList)sender;
        //    using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        //    {
        //        conn.Open();
        //        string sql = @"SELECT * FROM LoanLib WHERE LoanId=@LoanId";

        //        SqlCommand cmd = new SqlCommand(sql, conn);
        //        cmd.Parameters.AddWithValue("@LoanId", ddlLoantype.SelectedValue.ToString());

        //        try
        //        {
        //            SqlDataReader dr = cmd.ExecuteReader();
        //            while (dr.Read())
        //            {
        //                txtbxDescription.Text = dr["Description"].ToString();
        //                txtbxInterest.Text = dr["InterestRate"].ToString();
        //                txtbxloanid.Text = dr["LoanId"].ToString();

        //                ScriptManager.RegisterStartupScript(this, typeof(Page), "description", @"$('#editloantype').collapse('show'); $('#newloan').collapse('hide'); $('#deleteloantype').collapse('hide');", true);

        //            }
        //        }
        //        catch
        //        {

        //        }

        //    }
        //}




        //protected void lbtnSave_Click(object sender, EventArgs e)
        //{



        //    if (string.IsNullOrWhiteSpace(txtbxnewloadtype.Text))
        //    {
        //        hdnMessage.Value = "Please enter a New Load Type.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "loantype", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    }

        //    if (string.IsNullOrWhiteSpace(txtbxnewinterest.Text))
        //    {
        //        hdnMessage.Value = "Please enter a Interest Rate.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "interestrate", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    }

        //    if (string.IsNullOrWhiteSpace(txtbxnewdescription.Text))
        //    {
        //        hdnMessage.Value = "Please enter a Description.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "description", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    }
        //    if (string.IsNullOrWhiteSpace(txtbxnewloanid.Text))
        //    {
        //        hdnMessage.Value = "Please enter a Loan ID.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "loanid", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    }

        //    else
        //    {
        //        string loantype = txtbxnewloadtype.Text;
        //        string interestrate = txtbxnewinterest.Text;
        //        string description = txtbxnewdescription.Text;
        //        string loanid = txtbxnewloanid.Text;

        //        Helper.InsertLoanLib(loantype, interestrate, description, loanid);
        //        hdnMessage.Value = "Success.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);

        //        txtbxnewdescription.Text = string.Empty;
        //        txtbxnewinterest.Text = string.Empty;
        //        txtbxnewloadtype.Text = string.Empty;
        //        txtbxnewloanid.Text = string.Empty;
        //    }

        //    LoanLibDelete();
        //    LoanLib();

        //}




        //protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    DropDownList ddlLoan = (DropDownList)sender;
        //    using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        //    {
        //        conn.Open();
        //        string sql = @"SELECT * FROM LoanLib WHERE LoanId=@LoanId";

        //        SqlCommand cmd = new SqlCommand(sql, conn);
        //        cmd.Parameters.AddWithValue("@LoanId", ddlLoan.SelectedValue.ToString());

        //        try
        //        {
        //            SqlDataReader dr = cmd.ExecuteReader();
        //            while (dr.Read())
        //            {
        //                txtbxdescriptiondelete.Text = dr["Description"].ToString();
        //                txtxbxinterestdelete.Text = dr["InterestRate"].ToString();
        //                txtbxloaniddelete.Text = dr["LoanId"].ToString();

        //                ScriptManager.RegisterStartupScript(this, typeof(Page), "description", @"$('#editloantype').collapse('hide'); $('#newloan').collapse('hide'); $('#deleteloantype').collapse('show');", true);

        //            }
        //        }
        //        catch
        //        {

        //        }

        //    }
        //}

        //protected void btnEditLoan_Click1(object sender, EventArgs e)
        //{


        //    if (string.IsNullOrWhiteSpace(ddlLoantype.SelectedValue))
        //    {
        //        hdnMessage.Value = "Please enter a New Load Type.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "loantype", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    }

        //    if (string.IsNullOrWhiteSpace(txtbxInterest.Text))
        //    {
        //        hdnMessage.Value = "Please enter a Interest Rate.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "interestrate", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    }

        //    if (string.IsNullOrWhiteSpace(txtbxDescription.Text))
        //    {
        //        hdnMessage.Value = "Please enter a Description.";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "description", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    }
        //    //if (string.IsNullOrWhiteSpace(txtbxloanid.Text))
        //    //{
        //    //    hdnMessage.Value = "Please enter a Loan ID.";
        //    //    ScriptManager.RegisterStartupScript(this, typeof(Page), "loanid", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

        //    //}

        //    else
        //    {
        //        string loantype = ddlLoantype.SelectedItem.ToString();
        //        string interestrate = txtbxInterest.Text;
        //        string description = txtbxDescription.Text;
        //        string loanid = txtbxloanid.Text;

        //        Helper.UpdateLoanLib(loantype, interestrate, description, loanid);

        //        txtbxDescription.Text = string.Empty;
        //        txtbxInterest.Text = string.Empty;
        //        ddl.SelectedValue = string.Empty;
        //        txtbxloanid.Text = string.Empty;
        //    }

        //    hdnMessage.Value = "Loan Edit Success.";
        //    ScriptManager.RegisterStartupScript(this, typeof(Page), "Edit", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);

        //    LoanLibDelete();
        //    LoanLib();
        //}

        //protected void btnDeleteLoan_Click(object sender, EventArgs e)
        //{

        //    string LoanId = txtbxloaniddelete.Text;
        //    Helper.LoanDelete(LoanId);


        //    LoanLibDelete();
        //    LoanLib();


        //    txtbxdescriptiondelete.Text = string.Empty;
        //    txtbxloaniddelete.Text = string.Empty;
        //    txtxbxinterestdelete.Text = string.Empty;

        //}



        protected void BindGrid()
        {
            GridView1.DataSource = Helper.LoadLoanLib();
            GridView1.DataKeyNames = new string [] {"LoanId"};
            GridView1.DataBind();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                int IntRate;
                bool isNum = int.TryParse(((TextBox)GridView1.FooterRow.FindControl("txtbxNewInterestRate")).Text, out IntRate);

                GridView Gridview1 = (GridView)sender;
                if (String.IsNullOrWhiteSpace(((TextBox)GridView1.FooterRow.FindControl("txtbxNewLoanID")).Text))
                {
                    hdnMessage.Value = "Please enter new Loan ID.";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "loanid", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

                }

                if (String.IsNullOrWhiteSpace(((TextBox)GridView1.FooterRow.FindControl("txtbxNewLoanType")).Text))
                {
                    hdnMessage.Value = "Please enter new Loan Type.";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "loantype", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

                }

                if (String.IsNullOrWhiteSpace(((TextBox)GridView1.FooterRow.FindControl("txtbxNewInterestRate")).Text) || isNum == false)
                {
                    hdnMessage.Value = "Please enter new Interest Rate.";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "interestrate", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

                }

                if (String.IsNullOrWhiteSpace(((TextBox)GridView1.FooterRow.FindControl("txtbxNewDescription")).Text))
                {
                    hdnMessage.Value = "Please enter new Description.";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "description", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

                }  
                
                else
                {
                string loanid = ((TextBox)GridView1.FooterRow.FindControl("txtbxNewLoanID")).Text;
                string loantype = ((TextBox)GridView1.FooterRow.FindControl("txtbxNewLoanType")).Text;
                string interestrate = ((TextBox)GridView1.FooterRow.FindControl("txtbxNewInterestRate")).Text;
                string description = ((TextBox)GridView1.FooterRow.FindControl("txtbxNewDescription")).Text;
                
                ((TextBox)GridView1.FooterRow.FindControl("txtbxNewLoanID")).Text = "";
                ((TextBox)GridView1.FooterRow.FindControl("txtbxNewLoanType")).Text = "";
                ((TextBox)GridView1.FooterRow.FindControl("txtbxNewInterestRate")).Text = "";
                ((TextBox)GridView1.FooterRow.FindControl("txtbxNewDescription")).Text = "";
                    
                BindGrid();





                if (Helper.CompareLib(loanid) == false)
                {
                    if (Helper.InsertLoanLib(loantype, interestrate, description, loanid))
                    {
                        hdnMessage.Value = "New Loan Success";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "newloan", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);
                        BindGrid();
                    }

                    else
                    {
                        hdnMessage.Value = "New Loan Failed to Save";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "newloanfail", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                       BindGrid();
                    }
                }
            }


            }

          
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == -1)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor= 'hand' ;this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);

            
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView GridView1 = (GridView)sender;

            if (GridView1.EditIndex == -1)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    LinkButton lbtnDelete = (LinkButton)row.FindControl("lbtnDelete");
                    LinkButton lbtnEdit = (LinkButton)row.FindControl("lbtnEdit");

                    String key = GridView1.DataKeys[row.RowIndex]["LoanId"].ToString();

                    if (row.RowIndex == GridView1.SelectedIndex)
                    {
                        lbtnDelete.Visible = true;
                        lbtnEdit.Visible = true;
                    }

                    else
                    {
                        lbtnDelete.Visible = false;
                        lbtnEdit.Visible = false;
                    }
                }

            }
            
            
            
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string loanid = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtbxEditLoanID")).Text.Trim();
            string loantype = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtbxEditLoanType")).Text;
            string interestrate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtbxEditInterestRate")).Text;
            string description = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtbxEditDescription")).Text;


            if (Helper.UpdateLoanLib(loantype, interestrate, description, loanid))
            {
                GridView1.EditIndex = -1;
                BindGrid();

                hdnMessage.Value = "Edit Loan Success";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "editloan", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);

            }
                
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string LoanId = GridView1.DataKeys[e.RowIndex]["LoanId"].ToString();

            if (Helper.CompareLoan(LoanId))
            {

                if (Helper.LoanLibDelete(LoanId))
                {
                    GridView1.EditIndex = -1;
                    BindGrid();

                    hdnMessage.Value = "Delete Loan Success";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "deleteloan", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);
                }

                else
                {
                    hdnMessage.Value = "Delete Loan Failed";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "deletefail", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

                }

            }
            else
            {

                hdnMessage.Value = "Delete Loan Failed. Loan Type has been used.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "deletefailed", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);

            }
        }

        protected void lbtnAddNewLoan_Click(object sender, EventArgs e)
        {
            GridView1.FooterRow.Visible = true;
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void lbtnUpdate_Click(object sender, EventArgs e)
        {

        }

        





    }
}