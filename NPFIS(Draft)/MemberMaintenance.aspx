<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="MemberMaintenance.aspx.cs" Inherits="NPFIS_Draft_.MemberMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblMemberMaintenance" runat="server" Text="Member's Maintance" Font-Bold="True"></asp:Label></div>
    <div align="right">
        <asp:Button ID="btnNew" runat="server" Text="New" Height="25px" Width="75px" Visible="False" />
        &nbsp;
        <asp:Button ID="btnEdit" runat="server" Text="Edit" Height="25px" Width="75px" Visible="False" />
        &nbsp;
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="75px" CssClass="btn btn-info btn-md" />
        &nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="75px" CssClass="btn btn-info btn-md" />
        &nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="Search" Width="75px" CssClass="btn btn-info btn-md" />
        &nbsp;
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Height="25px" Width="75px"
            Visible="False" />
        &nbsp; &nbsp; &nbsp;
    </div>
    <div>
    </div>


   <div class="col-md-4">
    <div>
        <asp:Label ID="lblempid" runat="server" Text="Employee ID:"></asp:Label><asp:TextBox
            ID="txtbxempid" runat="server" Width="150px" 
            CssClass="form-control"></asp:TextBox></div>

    <div>
        <asp:Label ID="lblLastname" runat="server" Text="Last name:"></asp:Label>
        <asp:TextBox ID="txtbxLastname" Width="150px" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    
    <div>
        <asp:Label ID="lblFirstname" runat="server" Text="First name:"></asp:Label>
        <asp:TextBox ID="txtbxFirstname" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Label ID="lblMiddlename" runat="server" Text="Middle name:"></asp:Label>
        <asp:TextBox ID="txtbxMidlename" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Label ID="lblDivision" runat="server" Text="Division:"></asp:Label>
        <asp:DropDownList
            ID="ddlDivision" runat="server" CssClass="btn-primary dropdown-toggle">
        </asp:DropDownList>
        <asp:Button ID="addDivision" runat="server" Text="Add" Visible="False"></asp:Button>
    </div>
    <br />
    <div>
        <asp:Label ID="lblDateofBirth" runat="server" Text="Date of Birth:"></asp:Label>
        <asp:TextBox ID="txtbxDateofBirth" Width="150px" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lvlContactno" runat="server" Text="Contact Number:"></asp:Label>
        <asp:TextBox ID="txtbxContactno" Width="150px" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblAddress" runat="server" Text="Permanent Address:"></asp:Label>
        
        <asp:TextBox ID="txtbxAddress" Width="300px" Height="100px" runat="server" CssClass="form-control"></asp:TextBox>
    </div> 

    </div>

    <div class="col-md-4">


      <div>
        <asp:Label ID="lblMonthlySalary" runat="server" Text="Monthly Salary:"></asp:Label>
        <asp:TextBox ID="txtbxMonthlySalary" runat="server" Width="150px" CssClass="form-control"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblPercentageofShare" runat="server" Text="Percentage of Share:"></asp:Label>
       
        <asp:TextBox ID="txtbxPercentageofShare" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    </div>
</asp:Content>
