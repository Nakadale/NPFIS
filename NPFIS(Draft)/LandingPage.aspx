<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="NPFIS_Draft_.LandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div class="Panel-group" id="accordion">
            <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Welcome!
                </h4>
            </div>
            <div id="Transact" class="panel-collapse collapse in">
            <br />
            <br />
            <asp:LinkButton ID="lnkMemMain" runat="server" CssClass="btn btn-info btn-sm" Width="300px" href="#MemberMaintenance" data-toggle="collapse" OnClientClick="$('#LoanMaintenance').collapse('hide');$('#LibraryMaintenance').collapse('hide');">Member Maintenance</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="lnkLoanMain" runat="server" CssClass="btn btn-info btn-sm" Width="300px" href="#LoanMaintenance" data-toggle="collapse" OnClientClick="$('#MemberMaintenance').collapse('hide');$('#LibraryMaintenance').collapse('hide');">Loan Maintenance</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="lnkLibMain" runat="server" CssClass="btn btn-info btn-sm" Width="300px" href="#LibraryMaintenance" data-toggle="collapse" OnClientClick="$('#MemberMaintenance').collapse('hide');$('#LoanMaintenance').collapse('hide');">Library Maintenance</asp:LinkButton>
            <br />
            <br />
            </div>
    </div>
    </div>
</center>
</asp:Content>
