<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoanManagement.aspx.cs" Inherits="NPFIS_Draft_.LoanManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="float: right">
        <asp:Button ID="btnNew" runat="server" CssClass="btn btn-info btn-sm" PostBackUrl="~/Loan_Management.aspx" Text="New" />
    </div>
    <br />
    <br />
    <br />
    <div class="Panel-group" id="accordion">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch">Member</a>
                        </h4>
                    </div>
                    <div id="MemberSearch" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="col-xs-8">
                                <asp:Label ID="Label4" runat="server" Text="Member: "></asp:Label>
                                <asp:TextBox ID="txtMemberSearch" runat="server" CssClass="form-control" OnTextChanged="txtMemberSearch_TextChanged" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div>
                                <br />
                                <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" class="btn btn-info btn-sm">...</a>
                            </div>
                            <br />
                            <div class="col-xs-8">
                                <asp:Label ID="Label5" runat="server" Text="Division: "></asp:Label>
                                <asp:TextBox ID="txtDivision" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                            <br />
                            <div class="col-xs-8">
                                <asp:Label ID="Label6" runat="server" Text="Branch: "></asp:Label>
                                <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>



        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#Transact">Transaction History</a>
                </h4>
            </div>

            <div id="Transact" class="panel-collapse collapse">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div id="Transactions">
                            <div class="col-xs-8">
                            <asp:Label ID="Label1" runat="server" Text="Transactions" Font-Size="Large"></asp:Label>
                            </div>
                                <br />
                            <center>
                            <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="False" Width="700px" CssClass="panel panel-primary" OnRowCommand="gvTransactions_RowCommand" CellPadding="2">
                                <Columns>
                                    <asp:TemplateField HeaderText="Loan Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLoanType" runat="server" Text='<%# Bind("LoanType") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Principal Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrincipalAmountDisp" runat="server" Text='<%# Bind("PrincipalAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Loan Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLoanDateDisp" runat="server" Text='<%# Bind("DateFiled") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Balance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid">
                                        <ItemTemplate>
                                            <center>
                                            <asp:CheckBox ID="ckPaidTransactionDisp" runat="server" Checked='<%# Bind("Paid") %>' Enabled="False" />
                                            </center>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Show Details">
                                        <ItemTemplate>
                                            <center>
                                            <asp:LinkButton ID="lnkSelectTransact" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm">...</asp:LinkButton>
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
                            <br />
                            <br />
                            <br />
                        </div>
                        <div id="Amortizations">
                            <div class="col-xs-8">
                            <asp:Label ID="lblAmortization" runat="server" Text="Amortization" Font-Size="Large"></asp:Label>
                            </div>
                                <br />
                            <center>
                            <asp:GridView ID="gvAmortizations" runat="server" CssClass="panel panel-primary" AutoGenerateColumns="False" Width="650px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDateDisp" runat="server" Text='<%# Bind("PayDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmountDisp" runat="server" Text='<%# Bind("PayAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Balance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid">
                                        <ItemTemplate>
                                            <center>
                                            <asp:CheckBox ID="ckPaidAmort" runat="server" Text="Paid" Checked='<%# Bind("Paid") %>' />
                                            </center>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                            </asp:GridView>
                            </center>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button1" runat="server" Text="Rescheduling" CssClass="btn btn-info btn-sm"/>
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Recompute" CssClass="btn btn-info btn-sm"/>
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2">Member Search</a>
                </h4>
            </div>
            <div id="MemberSearch2" data-parent="#accordion" class="panel-collapse collapse">

                <div class="col-xs-8">
                    <asp:Label ID="Label3" runat="server" Text="Search: " Font-Size="Large"></asp:Label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnSearchMember" runat="server" Text="Search" CssClass="btn btn-info btn-sm" OnClick="btnSearchMember_Click" />
                        <br />
                        <br />
                        <br />
                        <center>
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="700px" OnRowCommand="gvSearch_RowCommand" CellPadding="2">
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
                                        <asp:Label ID="lblDateOfBirthDisp" runat="server" Text='<%# Bind("BIRTHDATE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show Details">
                                    <ItemTemplate>
                                        <center>
                                        <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm" OnClientClick="href=#Transact">Select</asp:LinkButton>
                                        </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                        </asp:GridView>
                            </center>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </div>
        </div>
    </div>
    <br />

</asp:Content>
