<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Loan_Application_Form.aspx.cs" Inherits="NPFIS_Draft_.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="text-align: right">
        <asp:Button ID="BTNnew" runat="server" Text="New" />&nbsp
        <asp:Button ID="BTNEdit" runat="server" Text="Edit" />&nbsp
        <asp:Button ID="BTNSave" runat="server" Text="Save" />&nbsp
        <asp:Button ID="BTNCancel" runat="server" Text="Cancel" />&nbsp
        <asp:Button ID="BTNDelete" runat="server" Text="Delete" />&nbsp
        <asp:Button ID="BTNSearch" runat="server" Text="Search" />&nbsp
        <asp:Button ID="BTNPrint" runat="server" Text="Print" />
        <div>

        </div>

    </div>
    <div>
        <asp:Table ID="Table1" runat="server" Width="100%">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label1" runat="server" Text="Member: "></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Label ID="Label2" runat="server" Text="Transaction Code: "></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="200px"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label3" runat="server" Text="Division: "></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Label ID="Label4" runat="server" Text="Branch: "></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label5" runat="server" Text="File: "></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
