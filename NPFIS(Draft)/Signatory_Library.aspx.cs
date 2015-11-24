using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class Signatory_Library : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("WebLogin.aspx");
            }
            if (!IsPostBack)
            {
                //DropDownList ddlSignatureNum = (DropDownList)ddlSigNum;
                //BindSigNum(ddlSignatureNum);
                LoadSignatoryInfo();
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "OpenMenu", @"$('#LibraryMaintenance').collapse('show');", true);
        }

        private void LoadSignatoryInfo()
        {
            string ddlSignatureNum = ddlSigNum.SelectedValue.ToString();
            TextBox TxtAdministrator = (TextBox)this.TxtAdministrator;
            TextBox TxtPosition = (TextBox)this.TxtPosition;
            TextBox TxtNotedBy = (TextBox)this.TxtNotedBy;
            TextBox TxtNotedByPosition = (TextBox)this.TxtNotedByPosition;
            TextBox TxtPreparedBy = (TextBox)this.TxtPreparedBy;
            TextBox TxtPrepareByPosition = (TextBox)this.TxtPrepareByPosition;
            TextBox TxtEncodedBy = (TextBox)this.TxtEncodedBy;
            TextBox TxtEncodedByPosition = (TextBox)this.TxtEncodedByPosition;
            SignatoryHelper.LoadSignatory("1", TxtAdministrator, TxtPosition, TxtNotedBy, TxtNotedByPosition, TxtPreparedBy, TxtPrepareByPosition, TxtEncodedBy, TxtEncodedByPosition);
        }

        private void BindSigNum(DropDownList ddl)
        {
            ddl.DataSource = SignatoryHelper.LoadSignatoryNumber();
            ddl.DataTextField = "SigNum";
            ddl.DataValueField = "SigNum";
            ddl.DataBind();
        }

        protected void BTNnew_Click(object sender, EventArgs e)
        {
            TxtEncodedByPosition.Enabled = true;
            TxtEncodedBy.Enabled = true;
            TxtPrepareByPosition.Enabled = true;
            TxtPreparedBy.Enabled = true;
            TxtNotedByPosition.Enabled = true;
            TxtNotedBy.Enabled = true;
            TxtPosition.Enabled = true;
            TxtAdministrator.Enabled = true;
            TxtEncodedByPosition.Text = "";
            TxtEncodedBy.Text = "";
            TxtPrepareByPosition.Text = "";
            TxtPreparedBy.Text = "";
            TxtNotedByPosition.Text = "";
            TxtNotedBy.Text = "";
            TxtPosition.Text = "";
            TxtAdministrator.Text = "";
        }

        protected void BTNEdit_Click(object sender, EventArgs e)
        {
            TxtEncodedByPosition.Enabled = true;
            TxtEncodedBy.Enabled = true;
            TxtPrepareByPosition.Enabled = true;
            TxtPreparedBy.Enabled = true;
            TxtNotedByPosition.Enabled = true;
            TxtNotedBy.Enabled = true;
            TxtPosition.Enabled = true;
            TxtAdministrator.Enabled = true;
        }

        protected void BTNCancel_Click(object sender, EventArgs e)
        {
            TxtEncodedByPosition.Enabled = false;
            TxtEncodedBy.Enabled = false;
            TxtPrepareByPosition.Enabled = false;
            TxtPreparedBy.Enabled = false;
            TxtNotedByPosition.Enabled = false;
            TxtNotedBy.Enabled = false;
            TxtPosition.Enabled = false;
            TxtAdministrator.Enabled = false;
            LoadSignatoryInfo();
        }

        protected void ddlSigNum_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ddlSignatureNum = ddlSigNum.SelectedValue.ToString();
            TextBox TxtAdministrator = (TextBox)this.TxtAdministrator;
            TextBox TxtPosition = (TextBox)this.TxtPosition;
            TextBox TxtNotedBy = (TextBox)this.TxtNotedBy;
            TextBox TxtNotedByPosition = (TextBox)this.TxtNotedByPosition;
            TextBox TxtPreparedBy = (TextBox)this.TxtPreparedBy;
            TextBox TxtPrepareByPosition = (TextBox)this.TxtPrepareByPosition;
            TextBox TxtEncodedBy = (TextBox)this.TxtEncodedBy;
            TextBox TxtEncodedByPosition = (TextBox)this.TxtEncodedByPosition;
            SignatoryHelper.LoadSignatory(ddlSignatureNum, TxtAdministrator, TxtPosition, TxtNotedBy, TxtNotedByPosition, TxtPreparedBy, TxtPrepareByPosition, TxtEncodedBy, TxtEncodedByPosition);
        }

        protected void BTNDelete_Click(object sender, EventArgs e)
        {
            if (SignatoryHelper.DeleteRecord(ddlSigNum.SelectedValue.ToString()))
            {

            }
            else
            {

            }
        }

        protected void BTNSave_Click(object sender, EventArgs e)
        {
            string ddlSignatoryNum = "1";
            string TxtAdministrator = this.TxtAdministrator.Text;
            string TxtPosition = this.TxtPosition.Text;
            string TxtNotedBy = this.TxtNotedBy.Text;
            string TxtNotedByPosition = this.TxtNotedByPosition.Text;
            string TxtPreparedBy = this.TxtPreparedBy.Text;
            string TxtPrepareByPosition = this.TxtPrepareByPosition.Text;
            string TxtEncodedBy = this.TxtEncodedBy.Text;
            string TxtEncodedByPosition = this.TxtEncodedByPosition.Text;

            if (SignatoryHelper.CheckIfExist(ddlSignatoryNum))
            { // for updating of old transactions
                if (SignatoryHelper.UpdateSignatory(ddlSignatoryNum, TxtAdministrator, TxtPosition, TxtNotedBy, TxtNotedByPosition, TxtPreparedBy, TxtPrepareByPosition, TxtEncodedBy, TxtEncodedByPosition))
                {
                    //will put up something with more flair here
                    LoadSignatoryInfo();
                    this.TxtEncodedByPosition.Enabled = false;
                    this.TxtEncodedBy.Enabled = false;
                    this.TxtPrepareByPosition.Enabled = false;
                    this.TxtPreparedBy.Enabled = false;
                    this.TxtNotedByPosition.Enabled = false;
                    this.TxtNotedBy.Enabled = false;
                    this.TxtPosition.Enabled = false;
                    this.TxtAdministrator.Enabled = false;
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Signatures saved!');});", true);
                }
                else
                {
                    //will put up something with more flair here
                }
            }
            else
            { // for insertion of new transactions
                if (SignatoryHelper.InsertSignatory(ddlSignatoryNum, TxtAdministrator, TxtPosition, TxtNotedBy, TxtNotedByPosition, TxtPreparedBy, TxtPrepareByPosition, TxtEncodedBy, TxtEncodedByPosition))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "TransactionSuccess", @"$(document).ready(function(){alertify.success('Signatures saved!');});", true);
                    //will put up something with more flair here
                }
                else
                {
                    //will put up something with more flair here
                }

            }
        }
    }
}