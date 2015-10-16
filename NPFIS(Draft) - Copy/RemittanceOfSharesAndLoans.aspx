<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RemittanceOfSharesAndLoans.aspx.cs" Inherits="NPFIS_Draft_.RemittanceOfSharesAndLoans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label2" runat="server" Text="Member: "></asp:Label>
        <asp:DropDownList ID="DDLMember" runat="server" Height="16px" Width="303px"></asp:DropDownList>
    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Shares: "></asp:Label><asp:CheckBox ID="CKShares" runat="server" />
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Label ID="Label3" runat="server" Text="Loans: "></asp:Label><asp:CheckBox ID="CKLoans" runat="server" />
    </div>
    <div>
        <asp:Label ID="Label4" runat="server" Text="From: "></asp:Label>
    </div>
    <div>
        <asp:Label ID="Label5" runat="server" Text="Month: "></asp:Label>
        <asp:DropDownList ID="DDLMonthFrom" runat="server"></asp:DropDownList>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Label ID="Label6" runat="server" Text="Year: "></asp:Label>
        <asp:TextBox ID="TxtYearFrom" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="Label7" runat="server" Text="To: "></asp:Label>
    </div>
    <div>
        <asp:Label ID="Label8" runat="server" Text="Month: "></asp:Label>
        <asp:DropDownList ID="DDLMonthTo" runat="server"></asp:DropDownList>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Label ID="Label9" runat="server" Text="Year: "></asp:Label>
        <asp:TextBox ID="TxtYearTo" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="Label10" runat="server" Text="All:"></asp:Label>
        <asp:CheckBox ID="CheckBox1" runat="server" />
    </div>
    <br />
    <br />
    <br />
    <div style="text-align: center">
        <asp:Button ID="Button1" runat="server" Text="    Preview    " />
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="Button2" runat="server" Text="      Print    " />
    </div>
</asp:Content>
