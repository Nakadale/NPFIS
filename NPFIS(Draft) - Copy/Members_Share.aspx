<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Members_Share.aspx.cs" Inherits="NPFIS_Draft_.Members_Share" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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
                    <div style="text-align: left">
                        <asp:Label ID="Label1" runat="server" Text="Member : "></asp:Label>
                        <asp:DropDownList ID="DDLMember" runat="server" Height="16px" Width="278px"></asp:DropDownList>
                    </div>
                    <div>
                        <asp:Table ID="Table1" runat="server" Width="100%">
                            <asp:TableRow runat="server" >
                                <asp:TableCell runat="server" style="text-align:left">Division: <asp:TextBox ID="TxtDivision" runat="server" Width="278px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell runat="server" style="text-align:center" >Branch: <asp:TextBox ID="TxtBranch" runat="server" Width="278px" ></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" style="text-align:left">Monthly Salary: <asp:TextBox ID="TxtMonthlySalary" runat="server" Width="200px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell runat="server" style="text-align:center">Percentage Share: <asp:TextBox ID="TxtPercentageShare" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" style="text-align:left">Computed Share Amount: <asp:TextBox ID="TxtComputedShare" runat="server" Width="200px"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <br />
                    <div style="text-align: left">
                        <asp:Label ID="Label2" runat="server" Text="Contributions: "></asp:Label></div>
                    <div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Date" />
                                <asp:BoundField HeaderText="Monthly Salary Basis" />
                                <asp:BoundField HeaderText="Percentage Share" />
                                <asp:BoundField HeaderText="Amount" />
                                <asp:BoundField HeaderText="Remarks" />
                                <asp:CommandField NewText="+" />
                                <asp:CommandField DeleteText="-" InsertText="+" NewText="+" ShowDeleteButton="True" ShowInsertButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
    </div>
</asp:Content>
