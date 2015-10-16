using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Member_Maintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDivisionLib();
                //          btnSave.Attributes.Add("onClick", @"alertify.defaults.glossary.title='NPFIS';alertify.confirm('Are you sure you want to save this record?',
                //                                                function(){
                //                                                    __doPostBack($('.btnSave').attr('name'),'OnClick');
                //                                                });  return false;");
            }
        }

        public void LoadDivisionLib()
        {

            ddlDivision.DataSource = Helper.LoadDivisionLib();
            ddlDivision.DataTextField = "divisionname";
            ddlDivision.DataValueField = "divisionid";
            ddlDivision.DataBind();
            ListItem Item = new ListItem("");
            ddlDivision.Items.Insert(0, Item);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtbxempid.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Employee ID.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "empid", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtbxAddress.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Address.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Address", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtbxContactno.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Contact Number.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Contactno", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;

            }

            if (string.IsNullOrWhiteSpace(txtbxDateofBirth.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Date of Birth.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "DateofBirth", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;

            }

            if (string.IsNullOrWhiteSpace(txtbxFirstname.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a First name.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Firstname", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtbxLastname.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Last name.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Lastname", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtbxMidlename.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Middle name.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Middlename", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtbxMonthlySalary.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Monthly Salary.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "MonthlySalary", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtbxPercentageofShare.Text))
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Percentage of Share.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "PercentageofShare", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            if (ddlDivision.SelectedValue.ToString() == "")
            {
                txtbxempid.Enabled = true;
                txtbxAddress.Enabled = true;
                txtbxContactno.Enabled = true;
                txtbxDateofBirth.Enabled = true;
                txtbxFirstname.Enabled = true;
                txtbxLastname.Enabled = true;
                txtbxMidlename.Enabled = true;
                txtbxMonthlySalary.Enabled = true;
                txtbxPercentageofShare.Enabled = true;
                ddlDivision.Enabled = true;
                hdnMessage.Value = "Please enter a Division.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Division", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.error($('#hdnMessage').val());});", true);
                return;
            }

            else
            {

                string monthlysalary = txtbxMonthlySalary.Text;

                string empid = txtbxempid.Text;
                string address = txtbxAddress.Text;
                string contactno = txtbxContactno.Text;
                string birthdate = txtbxDateofBirth.Text;
                string firstname = txtbxFirstname.Text;
                string lastname = txtbxLastname.Text;
                string midname = txtbxMidlename.Text;
                double salary;
                string perofshare = txtbxPercentageofShare.Text;
                string divisionid = ddlDivision.SelectedValue;
                double.TryParse(monthlysalary, out salary);
                string userid = Session["User"].ToString();




                txtbxAddress.Text = string.Empty;
                txtbxContactno.Text = string.Empty;
                txtbxDateofBirth.Text = string.Empty;
                txtbxempid.Text = string.Empty;
                txtbxFirstname.Text = string.Empty;
                txtbxLastname.Text = string.Empty;
                txtbxMidlename.Text = string.Empty;
                txtbxMonthlySalary.Text = string.Empty;
                txtbxPercentageofShare.Text = string.Empty;
                ddlDivision.SelectedValue = string.Empty;
                Helper.InsertMemberMaintenance(empid, address, contactno, birthdate, firstname, lastname, midname, salary, perofshare, divisionid, userid);
                hdnMessage.Value = "Success.";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);

                return;
            }

        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtbxempid.Enabled = true;
            txtbxAddress.Enabled = true;
            txtbxContactno.Enabled = true;
            txtbxDateofBirth.Enabled = true;
            txtbxFirstname.Enabled = true;
            txtbxLastname.Enabled = true;
            txtbxMidlename.Enabled = true;
            txtbxMonthlySalary.Enabled = true;
            txtbxPercentageofShare.Enabled = true;
            ddlDivision.Enabled = true;
            hdnMessage.Value = "Edit Member.";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Edit", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);
            return;
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            txtbxAddress.Text = string.Empty;
            txtbxContactno.Text = string.Empty;
            txtbxDateofBirth.Text = string.Empty;
            txtbxempid.Text = string.Empty;
            txtbxFirstname.Text = string.Empty;
            txtbxLastname.Text = string.Empty;
            txtbxMidlename.Text = string.Empty;
            txtbxMonthlySalary.Text = string.Empty;
            txtbxPercentageofShare.Text = string.Empty;


            txtbxempid.Enabled = true;
            txtbxAddress.Enabled = true;
            txtbxContactno.Enabled = true;
            txtbxDateofBirth.Enabled = true;
            txtbxFirstname.Enabled = true;
            txtbxLastname.Enabled = true;
            txtbxMidlename.Enabled = true;
            txtbxMonthlySalary.Enabled = true;
            txtbxPercentageofShare.Enabled = true;
            ddlDivision.Enabled = true;
            hdnMessage.Value = "New Member.";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "NewMember", @"var x='<%=intCount %>'; $(document).ready(function(){alertify.success($('#hdnMessage').val());});", true);

        }
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtbxAddress.Text = string.Empty;
            txtbxContactno.Text = string.Empty;
            txtbxDateofBirth.Text = string.Empty;
            txtbxempid.Text = string.Empty;
            txtbxFirstname.Text = string.Empty;
            txtbxLastname.Text = string.Empty;
            txtbxMidlename.Text = string.Empty;
            txtbxMonthlySalary.Text = string.Empty;
            txtbxPercentageofShare.Text = string.Empty;


            txtbxempid.Enabled = true;
            txtbxAddress.Enabled = true;
            txtbxContactno.Enabled = true;
            txtbxDateofBirth.Enabled = true;
            txtbxFirstname.Enabled = true;
            txtbxLastname.Enabled = true;
            txtbxMidlename.Enabled = true;
            txtbxMonthlySalary.Enabled = true;
            txtbxPercentageofShare.Enabled = true;
            ddlDivision.Enabled = true;
        }

        protected void addDivision_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnBrowse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Member_Browse.aspx");
        }






    }

}