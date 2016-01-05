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
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#MemberMaintenance').collapse('show');", true);
        }
        protected void gvSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gv = (GridView)sender;
            gv.PageIndex = e.NewPageIndex;
            BindTransactCode("");
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

                double MonthlySalary;
                double PerofShare;
                double.TryParse(TxtMonthlySalary.Text, out MonthlySalary);

                double.TryParse(TxtPercentageShare.Text, out PerofShare);


                TxtComputedShare.Text = (MonthlySalary * (PerofShare / 100)).ToString();

             
                GridView1.DataSource = Helper.LoadShareDetails(((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text);
                GridView1.DataKeyNames = new string[] { "dateremit", "amount", "salarybasis", "perofsharebasis", "remarks" };
                GridView1.DataBind();

                gvSearch.DataSource = null;
                gvSearch.DataBind();

                //if (Txtempid.Text != "")
                //{
                //    lbtnAddNewContribution.Enabled = true;
                //}

            }

           
           
        }

        //private void Txtempid_TextChanged(object sender, EventArgs e)
        //{
        //    this.lbtnAddNewContribution.Enabled = !string.IsNullOrWhiteSpace(this.Txtempid.Text);
        //}

        protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void LoadShare(string empid)
        {
            GridView1.DataSource = Helper.LoadShareDetails(empid);
            GridView1.DataBind(); 

        }

        protected void gvSearch_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSearch.EditIndex = -1;
            GridView1.DataBind();
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridView GridView1 = (GridView)sender;

            if (GridView1.EditIndex == -1)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    LinkButton lbtnDeleteRemit = (LinkButton)row.FindControl("lbtnDeleteRemit");
                    LinkButton lbtnEditRemit = (LinkButton)row.FindControl("lbtnEditRemit");

                    //String key = GridView1.DataKeys[row.RowIndex]["dateremit"].ToString();

                    if (row.RowIndex == GridView1.SelectedIndex)
                    {
                        lbtnDeleteRemit.Visible = true;
                        lbtnEditRemit.Visible = true;
                    }

                    else
                    {
                        lbtnDeleteRemit.Visible = false;
                        lbtnEditRemit.Visible = false;
                    }
                }

            }
     
        }

        protected void lbtnAddNewContribution_Click(object sender, EventArgs e)
        {
            GridView1.FooterRow.Visible = true;
            (((Label)GridView1.FooterRow.FindControl("lblsalary")).Text) = TxtMonthlySalary.Text;
            (((Label)GridView1.FooterRow.FindControl("lblperofshare")).Text) = TxtPercentageShare.Text;
            (((TextBox)GridView1.FooterRow.FindControl("txtremit")).Text) = DateTime.Now.ToString("MMM dd, yyyy");
            (((TextBox)GridView1.FooterRow.FindControl("txtbxAmount")).Text) = TxtComputedShare.Text;

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                GridView Gridview1 = (GridView)sender;
                if (String.IsNullOrWhiteSpace(((TextBox)GridView1.FooterRow.FindControl("txtbxAmount")).Text))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "enteramount", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error('Please enter Amount');});", true);
                }

                else
                {
                    string empid = Txtempid.Text;
                    string dateremit = ((Label)GridView1.FooterRow.FindControl("lbldateremit")).Text;
                    string amount = ((TextBox)GridView1.FooterRow.FindControl("txtbxAmount")).Text;
                    string salary = ((Label)GridView1.FooterRow.FindControl("lblsalary")).Text;
                    string perofshare = ((Label)GridView1.FooterRow.FindControl("lblperofshare")).Text;
                    string userid = Session["User"].ToString();
                    Helper.InsertShare(empid, dateremit, amount, salary, perofshare, userid);
                  
                   
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success('Success');});", true);

                   ((Label)GridView1.FooterRow.FindControl("lbldateremit")).Text = "";
                   ((TextBox)GridView1.FooterRow.FindControl("txtbxAmount")).Text = "";
                    ((Label)GridView1.FooterRow.FindControl("lblsalary")).Text = "";
                    ((Label)GridView1.FooterRow.FindControl("lblperofshare")).Text = "";
                    Gridview1.FooterRow.Visible = false;


                    GridView1.DataSource = Helper.LoadShareDetails(Txtempid.Text);
                    GridView1.DataKeyNames = new string[] { "dateremit", "amount", "salarybasis", "perofsharebasis", "remarks" };
                    GridView1.DataBind();
                    return;
                }
            
            
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridView1.PageIndex = e.NewPageIndex;
           
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;


            GridView1.DataSource = Helper.LoadShareDetails(Txtempid.Text);
            GridView1.DataKeyNames = new string[] { "dateremit", "amount", "salarybasis", "perofsharebasis", "remarks" };
            GridView1.DataBind();
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string dateremit = GridView1.DataKeys[e.RowIndex]["dateremit"].ToString();
            string empid = Txtempid.Text;

            if (Helper.DeleteShare(empid, dateremit))
            {
                GridView1.EditIndex = -1;
               

                 ScriptManager.RegisterStartupScript(this, typeof(Page), "deletedateremitsuccess", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success('Delete Date Remit Success');});", true);

                GridView1.DataSource = Helper.LoadShareDetails(Txtempid.Text);
                GridView1.DataKeyNames = new string[] { "dateremit", "amount", "salarybasis", "perofsharebasis", "remarks" };
                GridView1.DataBind();
                return;

            }

            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "deleteremitfailed", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error('Delete Date Remit Failed');});", true);
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = Helper.LoadShareDetails(Txtempid.Text);
            GridView1.DataKeyNames = new string[] { "dateremit", "amount", "salarybasis", "perofsharebasis", "remarks" };
            GridView1.DataBind();
            return;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView gv = (GridView)sender;
            string empid = Txtempid.Text;
            string dateremit = gv.DataKeys[e.RowIndex]["dateremit"].ToString();
            decimal amount; Decimal.TryParse((((TextBox)gv.Rows[e.RowIndex].FindControl("txtbxeditAmount")).Text).ToString(), out amount);
            string salarybasis = gv.DataKeys[e.RowIndex]["salarybasis"].ToString();
            string perofshare = gv.DataKeys[e.RowIndex]["perofsharebasis"].ToString();
            string userid = Session["User"].ToString();
            
            if (Helper.UpdateShare(empid, dateremit, amount,salarybasis,perofshare, userid))
            {
                GridView1.EditIndex = -1;


                ScriptManager.RegisterStartupScript(this, typeof(Page), "editloan", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success('Edit Loan Success');});", true);
                GridView1.DataSource = Helper.LoadShareDetails(empid);
                GridView1.DataKeyNames = new string[] { "dateremit", "amount", "salarybasis", "perofsharebasis", "remarks" };
                GridView1.DataBind();
            }

        }



    }
}