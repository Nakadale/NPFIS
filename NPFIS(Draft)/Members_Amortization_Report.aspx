<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="Members_Amortization_Report.aspx.cs" Inherits="NPFIS_Draft_.Members_Amortization_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <div class="panel panel-default panel-collapse collapse in" id="MemberSearch2">
            <div class="panel-heading">
                <h4 class="panel-title">Member Search
                </h4>
            </div>
            <div class="panel panel-collapse collapse in">
                <div class="col-xs-8">
                    <asp:Label ID="Label2" runat="server" Text="Search: " Font-Size="Large"></asp:Label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <p>
                            <asp:Button ID="btnSearchMember" runat="server" Text="Search" CssClass="btn btn-info btn-sm" OnClick="btnSearchMember_Click" />
                            <br />
                            <br />
                            <br />
                            <center>
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="650px" CellPadding="2" OnRowCommand="gvSearch_RowCommand" AllowPaging="True" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="Employee ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpIDDisp" runat="server" Text='<%# Bind("EMPID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Surname">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurnameDisp" runat="server" Text='<%# Bind("LASTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFirstNameDisp" runat="server" Text='<%# Bind("FIRSTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Middle Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMiddleNameDisp" runat="server" Text='<%# Bind("MIDNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Birth">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateOfBirthDisp" runat="server" Text='<%# Bind("BIRTHDATE","{0:MMM dd, yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show Transactions">
                                    <ItemTemplate>
                                        <center>
                                        <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm">Select</asp:LinkButton>
                                        </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="gridViewPager"/>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                        </asp:GridView>
                            </center>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div id="Transact" class="collapse in">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div id="Transactions">
                        <div class="col-xs-8">
                            <asp:Label ID="Label1" runat="server" Text="Transactions" Font-Size="Large"></asp:Label>
                        </div>
                        <br />
                        <center>
                            <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="False" Width="700px" CssClass="panel panel-primary" OnRowCommand="gvTransactions_RowCommand" CellPadding="2" OnRowDataBound="gvTransactions_RowDataBound" OnSelectedIndexChanged="gvTransactions_SelectedIndexChanged" EnableModelValidation="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Loan Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLoanType" runat="server" Text='<%# Bind("LoanType") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Principal Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrincipalAmountDisp" runat="server" Text='<%# Bind("PrincipalAmount","{0:#,0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Loan Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLoanDateDisp" runat="server" Text='<%# Bind("DateFiled","{0:MMM dd, yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Balance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance","{0:#,0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid">
                                        <ItemTemplate>
                                            <center>
                                            <asp:CheckBox ID="ckPaidTransactionDisp" runat="server" Checked='<%# Bind("Paid") %>' Enabled="False" />
                                            </center>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <center>
                                                <asp:LinkButton ID="lnkBtnPreview" runat="server" CssClass="btn btn-info btn-xs" CommandName="Preview" OnClick="lnkBtnPreview_Click" Visible="False">Preview</asp:LinkButton>
                                                &nbsp;
                                                <asp:LinkButton ID="lnkBtnPrint" runat="server" CssClass="btn btn-info btn-xs" CommandName="Print" Visible="False">Print</asp:LinkButton>
                                            </center>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TransactCode" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTransactCode" runat="server" Text='<%# Bind("TransactCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                            </asp:GridView>
                            </center>
                        </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>
</asp:Content>
