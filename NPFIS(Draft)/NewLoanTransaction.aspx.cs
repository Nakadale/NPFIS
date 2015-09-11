using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class NewLoanTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList DDLMembers = (DropDownList)DDLMember;
                BindMember(DDLMembers);
                DropDownList DDLLoan = (DropDownList)DDLLoanType;
                BindLoanType(DDLLoan);
            }
        }
        private void BindMember(DropDownList ddl)
        {
            ddl.DataSource = helpers.LoadMemberList();
            ddl.DataTextField = "Member_Name";
            ddl.DataValueField = "EmpId";
            ddl.DataBind();
        }
        private void BindLoanType(DropDownList ddl)
        {
            ddl.DataSource = helpers.LoadLoanType();
            ddl.DataTextField = "Description";
            ddl.DataValueField = "LoanID";
            ddl.DataBind();
        }
    }
}