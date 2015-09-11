<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Landing_Page.aspx.cs" Inherits="NPFIS_Draft_.Landing_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Button ID="btnMembersMaintenance" runat="server" Text="Member's Maintenance" />
        <br />
        <br />
        <asp:Button ID="btnLoanMaintenance" runat="server" Text="Loan Management" />
        <br />
        <br />
        <asp:Button ID="btnLibraryMaintenance" runat="server" Text="Library Maintenance" />
    </div>
</asp:Content>
