<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Members_Summary.aspx.cs" Inherits="NPFIS_Draft_.Members_Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div> 
        <asp:Label ID="lblMemberSummary" runat="server" Text="Member's Summary" 
            Font-Bold="True" Font-Size="Medium"></asp:Label></div>

        <div align="right">
            <asp:Button ID="btnSearch" runat="server" Width="75px" Height="25px" Text="Search" /> &nbsp;
            <asp:Button ID="btnPrint" runat="server" Width="75px" Height="25px" Text="Print" />
            </div><br />

            <div>
                <asp:Label ID="lblMember" runat="server" Text="Member:"></asp:Label> &nbsp:
                <asp:DropDownList ID="ddlMember" Width="200px" Height="25px" runat="server">
                </asp:DropDownList>
            
            </div> <br />

            <div>
                <asp:Label ID="lblDivision" runat="server" Text="Division:"></asp:Label> &nbsp;
                <asp:TextBox ID="txtbxDivision" Width="200px" Height="20px" runat="server"></asp:TextBox>
            </div> <br />

            <div>
                <asp:Label ID="lblTotalShare" runat="server" Width="172px" 
                    Text="Total Share Contribution:"></asp:Label> &nbsp;
                <asp:TextBox ID="txtbxTotalShare" Width="150px" Height="20px" runat="server"></asp:TextBox>
            </div>
            <br />
            <div> 
                <asp:Label ID="lblTotalLoanBalance" runat="server" Text="Total Loan Balance:"></asp:Label> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:TextBox ID="txtbxTotalLoanBalance" Width="155px" Height="20px" runat="server"></asp:TextBox>
            </div>
            <br />
            <br />
            <br />

            <div> 
            
                <asp:Label ID="lblContributions" runat="server" Text="Contributions"></asp:Label>
                <br />
                &nbsp; &nbsp; 
                <asp:GridView ID="gridContributions" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Date" />
                        <asp:BoundField HeaderText="Monthly Salary Basis" />
                        <asp:BoundField HeaderText="Percentage Share" />
                        <asp:BoundField HeaderText="Amount" />
                        <asp:BoundField HeaderText="Remarks" />
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
            <br />
            <br />

            <div>
                <asp:Label ID="lblLoans" runat="server" Text="Loans"></asp:Label>
                <br />
                <asp:GridView ID="gridLoans" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Type" />
                        <asp:BoundField HeaderText="Date" />
                        <asp:BoundField HeaderText="Principal Amount" />
                        <asp:BoundField HeaderText="Interest Amount" />
                        <asp:BoundField HeaderText="Service Fee" />
                        <asp:BoundField HeaderText="Payment Terms" />
                        <asp:BoundField HeaderText="Balance" />
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
</asp:Content>
