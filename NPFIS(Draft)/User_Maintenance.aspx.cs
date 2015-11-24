using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class User_Maintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LibraryMaintenance').collapse('show');", true);

        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            txtbxName.Enabled = true;
            txtbxPassword.Enabled = true;
            txtbxUsername.Enabled = true;
            txtbxVerifyPassword.Enabled = true;
            //chckbxActiveUser.Enabled = true;
            chckbxAllowUser.Enabled = true;
            txtbxName.Text = "";
            txtbxPassword.Text = "";
            txtbxUsername.Text = "";
            txtbxVerifyPassword.Text = "";
            //chckbxActiveUser.Checked = false;
            //chckbxAllowUser.Checked = false;
            btnSave.Enabled = true;
            btnEdit.Enabled = false;
            btnCancel.Enabled = true;
            btnDelete.Enabled = false;
        }

        protected void btnSearchMember_Click(object sender, EventArgs e)
        {
            string txtSearchKeyword = (string)txtSearch.Text;
            BindTransactCode(txtSearchKeyword);
        }

        private void BindTransactCode(string SearchKey)
        {

            gvSearch.DataSource = UserMHelper.LoadSearchedMembers(SearchKey);
            gvSearch.DataKeyNames = new string[] { "NAME", "USERID","LASTDATE" };
            gvSearch.DataBind();
        }

        protected void gvSearch_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //UserMHelper.LoadUserInformation();
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;
                TextBox Member = (TextBox)this.txtbxName;
                TextBox Username = (TextBox)this.txtbxUsername;
                TextBox Password = (TextBox)this.txtbxPassword;
                TextBox VPassword = (TextBox)this.txtbxVerifyPassword;
                CheckBox ChkAllow = (CheckBox)this.chckbxAllowUser;
                CheckBox ChkActive = (CheckBox)this.chckbxActiveUser;
                string Origusername = ((Label)gvSearch.Rows[RowIndex].FindControl("lblUserName")).Text;
                UserMHelper.LoadUserInformation(Origusername, Username, Member, Password, VPassword, ChkAllow, ChkActive);
                gvSearch.DataSource = null;
                gvSearch.DataBind();
                Session["UserID"] = Username.Text;
                btnEdit.Enabled = true;
                btnDelete.Enabled = true;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtbxName.Enabled = true;
            txtbxPassword.Enabled = true;
            txtbxUsername.Enabled = true;
            txtbxVerifyPassword.Enabled = true;
            chckbxAllowUser.Enabled = true;
            chckbxActiveUser.Enabled = true;
            btnNew.Enabled = false;
            btnEdit.Enabled = false;
            btnSave.Enabled = true;
            btnCancel.Enabled = true;
            btnDelete.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string UserID = this.txtbxUsername.Text;
            string Name = this.txtbxName.Text;
            string Password = this.txtbxPassword.Text;
            string VPassword = this.txtbxVerifyPassword.Text;
            bool ChAllow = this.chckbxAllowUser.Checked;
            bool ChActive = this.chckbxActiveUser.Checked;

            if (Password != VPassword)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.error('Password does not match!');});", true);
                return;
            }
            //!String.IsNullOrEmpty(ViewState["UserID"].ToString())) || 

            if ((UserMHelper.CheckIfExist(txtbxUsername.Text)) && btnNew.Enabled == true)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Duplicate", @"$(document).ready(function(){alertify.error('Duplicate User. Please use a different User ID.');});", true);
                return;
            }

            if ((UserMHelper.CheckIfExist(txtbxUsername.Text)) || btnNew.Enabled == false)
            {
                    if (UserMHelper.UpdateUser(Session["UserID"].ToString(), UserID, Name, Password, ChAllow, ChActive))
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('User saved!');});", true);
                        ViewState["UserID"] = null;
                        txtbxName.Text = "";
                        txtbxPassword.Text = "";
                        txtbxUsername.Text = "";
                        txtbxVerifyPassword.Text = "";
                        chckbxActiveUser.Checked = false;
                        chckbxAllowUser.Checked = false;
                        btnNew.Enabled = true;
                        //btnEdit.Enabled = false;
                        //btnDelete.Enabled = false;
                        btnSave.Enabled = false;
                        btnCancel.Enabled = false;
                        return;
                    }
                return;
            }
            // for insertion of new transactions
            else if (UserMHelper.InsertUser(UserID,Name, Password, ChAllow,ChActive))
            {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('User saved!');});", true);
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#MemberMaintenance').collapse('show');", true);
                    txtbxName.Text = "";
                    txtbxPassword.Text = "";
                    txtbxUsername.Text = "";
                    txtbxVerifyPassword.Text = "";
                    chckbxActiveUser.Checked = false;
                    chckbxAllowUser.Checked = false;
                    btnNew.Enabled = true;
                    //btnEdit.Enabled = false;
                    //btnDelete.Enabled = false;
                    btnSave.Enabled = false;
                    btnCancel.Enabled = false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtbxName.Enabled = false;
            txtbxPassword.Enabled = false;
            txtbxUsername.Enabled = false;
            txtbxVerifyPassword.Enabled = false;
            chckbxAllowUser.Enabled = false;
            chckbxActiveUser.Enabled = false;
            txtbxName.Text = "";
            txtbxPassword.Text = "";
            txtbxUsername.Text = "";
            txtbxVerifyPassword.Text = "";
            chckbxActiveUser.Checked = false;
            chckbxAllowUser.Checked = false;
            btnNew.Enabled = true;
            btnEdit.Enabled = false;
            btnDelete.Enabled = false;
            btnSave.Enabled = false;
            btnCancel.Enabled = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string UserID = this.txtbxUsername.Text;
            UserMHelper.DeleteUser(UserID);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('User Deleted!');});", true);
            txtbxName.Text = "";
            txtbxPassword.Text = "";
            txtbxUsername.Text = "";
            txtbxVerifyPassword.Text = "";
            chckbxActiveUser.Checked = false;
            chckbxAllowUser.Checked = false;
            btnNew.Enabled = true;
            btnEdit.Enabled = false;
            btnDelete.Enabled = false;
            btnSave.Enabled = false;
            btnCancel.Enabled = false;
        }
    }
}