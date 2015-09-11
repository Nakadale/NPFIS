<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Loan_Maintenance.aspx.cs" Inherits="NPFIS_Draft_.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="text-align: right">
        <asp:Button ID="BTNnew" runat="server" Text="New" OnClick="BTNnew_Click" />&nbsp
        <asp:Button ID="BTNEdit" runat="server" Text="Edit" OnClick="BTNEdit_Click" />&nbsp
        <asp:Button ID="BTNSave" runat="server" Text="Save" OnClick="BTNSave_Click" />&nbsp
        <asp:Button ID="BTNCancel" runat="server" Text="Cancel" OnClick="BTNCancel_Click" />&nbsp
        <asp:Button ID="BTNDelete" runat="server" Text="Delete" OnClick="BTNDelete_Click" />&nbsp
        <asp:Button ID="BTNSearch" runat="server" Text="Search" />&nbsp
        </div>
            <div>
                <asp:Table ID="Table1" runat="server" Width="50%">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" HorizontalAlign="Right">Loan ID: </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Left">
                        <asp:DropDownList ID="ddlLoanID" runat="server" Width="190px" OnSelectedIndexChanged="ddlLoanID_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>    
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" HorizontalAlign="Right">Loan Type: </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Left">
                        <asp:TextBox ID="TxtLoanType" runat="server" Width="180px" Enabled="False"></asp:TextBox>        
                    </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" HorizontalAlign="Right">Description: </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Left">
                            <asp:TextBox ID="TxtDescription" runat="server" Width="180px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" HorizontalAlign="Right">Interest Rate:</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Left">
                        <asp:TextBox ID="TxtInterestRate" runat="server" Width="180px" Enabled="False"></asp:TextBox>
                    </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
</asp:Content>
