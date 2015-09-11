<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewLoanTransaction.aspx.cs" Inherits="NPFIS_Draft_.NewLoanTransaction" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="float: right">
        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-info btn-sm" Text="Save" />
    </div>
    <asp:ScriptManager ID="SMEndAmort" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
    <div id="MemberSelect">
        <div style="width: 700px" class="row">
            <div style="width: 350px;" class="col-md-4">
                <asp:Label ID="Label1" runat="server" Text="Member: "></asp:Label>
                <asp:DropDownList ID="DDLMember" runat="server" Width="276px" AutoPostBack="True" Enabled="True" CssClass="btn btn-primary dropdown-toggle"></asp:DropDownList>

                <asp:Label ID="Label3" runat="server" Text="Division: "></asp:Label>
                <asp:TextBox ID="TxtDivision" runat="server" Width="266px" Enabled="True" ReadOnly="True" CssClass="form-control"></asp:TextBox>
            </div>
            <div style="width: 350px;" class="col-md-4">
                <asp:Label ID="Label4" runat="server" Text="Branch: "></asp:Label>
                <asp:TextBox ID="TxtBranch" runat="server" Width="220px" Enabled="True" ReadOnly="True" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
    </div>
    <br />
    <br />
    <div style="width: 700px" class="row">
        <div style="width: 250px;" class="col-md-4">
            <div>
                <asp:Label ID="Label5" runat="server" Text="Loan Type: "></asp:Label><br />
                <asp:DropDownList ID="DDLLoanType" runat="server" Width="170px" AutoPostBack="True" CssClass="btn btn-primary dropdown-toggle"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="Label6" runat="server" Text="Loan Application No. : "></asp:Label>
                <asp:TextBox ID="TxtLoanAppNo" runat="server" Width="180px" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label7" runat="server" Text="Loan Date: "></asp:Label>
                <asp:TextBox ID="TxtLoanDate" runat="server" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CELoanDate" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtLoanDate" />
            </div>
            <div>
                <asp:Label ID="Label8" runat="server" Text="Issued Cheque No.: "></asp:Label>
                <asp:TextBox ID="TxtIssuedCheque" runat="server" Width="203px" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label9" runat="server" Text="Issued Cheque Date: "></asp:Label>
                <asp:TextBox ID="TxtIssuedChequeDate" runat="server" Width="180px" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CEIssuedChequeDate" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtIssuedChequeDate" />
            </div>
        </div>
        <div style="width: 250px;" class="col-md-4">
            <div>
                <asp:Label ID="Label10" runat="server" Text="Cheque Released Date: "></asp:Label>
                <asp:TextBox ID="TxtChequeReleasedDate" runat="server" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CEChequeReleasedDate" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtChequeReleasedDate" />
            </div>
            <div>
                <asp:Label ID="Label11" runat="server" Text="Principal Amount: "></asp:Label>
                <asp:TextBox ID="TxtPrincipalAmount" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label12" runat="server" Text="Interest Rate: "></asp:Label>
                <asp:TextBox ID="TxtInterestRate" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label13" runat="server" Text="Service Fee: "></asp:Label>
                <asp:TextBox ID="TxtServiceFee" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div style="width: 200px;" class="col-md-4">
            <div>
                <asp:Label ID="Label14" runat="server" Text="Payment Terms: "></asp:Label>
                <asp:TextBox ID="TxtPaymentTerms" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label15" runat="server" Text="Start Date of Amortization: "></asp:Label>
                <asp:TextBox ID="TxtStartAmort" runat="server" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CEStartAmort" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtStartAmort" />
            </div>
            <div>
                <asp:Label ID="Label16" runat="server" Text="End Date of Amortization: "></asp:Label>
                <asp:TextBox ID="TxtEndAmort" runat="server" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CEEndAmort" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtEndAmort" />
            </div>
            <div>
                <br />
                <asp:Label ID="Label17" runat="server" Text="Paid-up Loan: " CssClass="checkbox-inline"></asp:Label>
                <asp:CheckBox ID="CkPaidUpLoan" runat="server" />
            </div>
        </div>
    </div>
    <br />
    <div>
        <asp:Label ID="Label19" runat="server" Text="File: "></asp:Label><asp:FileUpload ID="fuScannedForm" runat="server" />
    </div>
</asp:Content>
