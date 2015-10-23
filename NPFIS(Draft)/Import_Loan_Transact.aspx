<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Import_Loan_Transact.aspx.cs" Inherits="NPFIS_Draft_.Import_Loan_Transact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default panel-body">
        <div>
        <asp:FileUpload ID="fuScannedForm" runat="server" />
        <br />
        <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-info btn-sm" Text="Upload" OnClick="btnUpload_Click" />
            </div>
        <br />
        <div>
            <br />
            
            <asp:Label ID="lblStatus" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <br />
            <asp:GridView ID="gvError" runat="server" AutoGenerateColumns="False" Width="650px">
                <Columns>
                    <asp:TemplateField HeaderText="Employee ID">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("Emp_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loan Code">
                        <ItemTemplate>
                            <asp:Label ID="lblLoanCode" runat="server" Text='<%# Bind("ded_c") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Monthly Amortization">
                        <ItemTemplate>
                            <asp:Label ID="lblLoanAmort" runat="server" Text='<%# Bind("ded_a") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transaction Month">
                        <ItemTemplate>
                            <asp:Label ID="lblTMonth" runat="server" Text='<%# Bind("covmonth") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transaction Year">
                        <ItemTemplate>
                            <asp:Label ID="lblTYear" runat="server" Text='<%# Bind("covYear") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transaction Date">
                        <ItemTemplate>
                            <asp:Label ID="lblTdate" runat="server" Text='<%# Bind("t_date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>

</asp:Content>
