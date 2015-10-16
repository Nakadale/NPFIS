<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListOfBorrowers.aspx.cs" Inherits="NPFIS_Draft_.ListOfBorrowers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Table ID="Table1" runat="server" Width="100%">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">Month: </asp:TableCell>
                <asp:TableCell runat="server">Year: </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="text-align: center">

        <asp:Button ID="Button1" runat="server" Text="Preview" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button ID="Button2" runat="server" Text="Print" />
    </div>
</asp:Content>
