using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Member_Browse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            if (!IsPostBack)
            {

               BindDivision(ddlDivision);

            }
     
        }

        private void BindDivision(DropDownList ddlDivision)
        {

            ddlDivision.DataSource = Helper.LoadDivisionLib2();
            ddlDivision.DataTextField = "divisionname";
            ddlDivision.DataValueField = "divisionid";
            ddlDivision.DataBind();
            ListItem Item = new ListItem("");
            ddlDivision.Items.Insert(0, Item);


        }

        

       
      
       
        protected void btnAddNewMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("Member_Maintenance.aspx");
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Refresh();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            double salary;
            string monthlysalary = txtbxSalary.Text;
            string empid = this.txtbxEmpid.Text;
            string lastname = this.txtbxLastname.Text;
            string firstname = this.txtbxFirstname.Text;
            string midname = this.txtbxMidname.Text;
            string birthdate = this.txtbxBirthdate.Text;
            string contactno = this.txtbxContactno.Text;
            string address = this.txtbxAddress.Text;
            Double.TryParse(monthlysalary, out salary);
            string perofshare = this.txtbxPerofshare.Text;
            string divisionid = this.ddlDivision.Text;

            {
                if (Helper.UpdatingMembers(empid, address, contactno, birthdate, lastname, firstname, midname, salary, perofshare, divisionid)) ;


                ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateSuccess", @"$(document).ready(function(){alertify.success('Update Success!');});", true);
            }

            txtbxEmpid.Text = "";
            txtbxLastname.Text = "";
            txtbxFirstname.Text = "";
            txtbxMidname.Text = "";
            txtbxBirthdate.Text = "";
            txtbxContactno.Text = "";
            txtbxSalary.Text = "";
            txtbxAddress.Text = "";
            txtbxPerofshare.Text = "";
            ddlDivision.SelectedIndex = -1;

            txtbxLastname.Enabled = false;
            txtbxFirstname.Enabled = false;
            txtbxMidname.Enabled = false;
            txtbxBirthdate.Enabled = false;
            txtbxContactno.Enabled = false;
            txtbxAddress.Enabled = false;
            txtbxSalary.Enabled = false;
            txtbxPerofshare.Enabled = false;
            ddlDivision.Enabled = false;

        }


        protected void btnSearchMember_Click(object sender, EventArgs e)
        {
            string txtSearchKeyword = (string)txtSearch.Text;
            BindTransactCode(txtSearchKeyword);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
           
            txtbxLastname.Enabled = true;
            txtbxFirstname.Enabled = true;
            txtbxMidname.Enabled = true;
            txtbxBirthdate.Enabled = true;
            txtbxContactno.Enabled = true;
            txtbxAddress.Enabled = true;
            txtbxSalary.Enabled = true;
            txtbxPerofshare.Enabled = true;
            ddlDivision.Enabled = true;



        }


        private void BindTransactCode(string SearchKey)
        {
            gvSearch.DataSource = helpers.LoadSearchedMembers(SearchKey);
            gvSearch.DataKeyNames = new string[] { "EMPID", "FIRSTNAME", "LASTNAME", "MIDNAME", "BIRTHDATE" };
            gvSearch.DataBind();
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((string)e.CommandName.ToString()) == "Select")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowIndex = gvr.RowIndex;
                
                TextBox empid = (TextBox)this.txtbxEmpid;
                TextBox lastname = (TextBox)this.txtbxLastname;
                TextBox firstname = (TextBox)this.txtbxFirstname;
                TextBox midname = (TextBox)this.txtbxMidname;
                TextBox birthdate = (TextBox)this.txtbxBirthdate;
                TextBox contactno = (TextBox)this.txtbxContactno;
                TextBox address = (TextBox)this.txtbxAddress;
                TextBox salary = (TextBox)this.txtbxSalary;
                TextBox perofshare = (TextBox)this.txtbxPerofshare;
                DropDownList divisionid = (DropDownList)this.ddlDivision;

                string tempempid = ((Label)gvSearch.Rows[RowIndex].FindControl("lblEmpIDDisp")).Text;
                Helper.LoadSearchedMember(tempempid, empid, lastname, firstname, midname, divisionid, birthdate, contactno, address, salary, perofshare);
          
                txtbxLastname.Enabled = false;
                txtbxFirstname.Enabled = false;
                txtbxMidname.Enabled = false;
                txtbxBirthdate.Enabled = false;
                txtbxContactno.Enabled = false;
                txtbxAddress.Enabled = false;
                txtbxSalary.Enabled = false;
                txtbxPerofshare.Enabled = false;
                ddlDivision.Enabled = false;

                if (String.IsNullOrEmpty(txtbxEmpid.Text))
                    btnEdit.Enabled = false;
                else
                    btnEdit.Enabled = true;


            }
        }

        protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void Refresh()
        {
            txtbxAddress.Text = "";
            txtbxBirthdate.Text = "";
            txtbxContactno.Text = "";
            txtbxEmpid.Text = "";
            txtbxFirstname.Text = "";
            txtbxLastname.Text = "";
            txtbxMidname.Text = "";
            txtbxPerofshare.Text = "";
            txtbxSalary.Text = "";
            ddlDivision.SelectedIndex = -1;

            btnEdit.Enabled = false;


        }

        

    }
}