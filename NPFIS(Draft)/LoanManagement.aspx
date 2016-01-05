<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoanManagement.aspx.cs" EnableEventValidation="false" Inherits="NPFIS_Draft_.LoanManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default panel-body">
        <div style="float: right">
            <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" data-id="#MemberSearch2" class="btn btn-info btn-sm">Search</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnNew" runat="server" CssClass="btn btn-info btn-sm" PostBackUrl="~/NewLoanTransaction.aspx" Text="New" />
        </div>
        <br />
        <br />
        <br />
        <div class="panel panel-default panel-collapse collapse" id="MemberSearch2" data-parent="#accordion">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2">Member Search</a>
                    </h4>
                </div>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="col-xs-8">
                                <asp:Label ID="Label2" runat="server" Text="Search: " Font-Size="Large"></asp:Label>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-xs-2" style="margin-top: 25px">
                                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-info btn-sm" OnClick="btnSearchMember_Click" />
                            </div>
                            <br />
                            <br />
                            <br />
                            <center>
                            <br />
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="700px" OnRowCommand="gvSearch_RowCommand" CellPadding="2" OnRowDataBound="gvSearch_RowDataBound" AllowPaging="True" OnPageIndexChanging="gvSearch_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="Employee ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpIDDisp" runat="server" Text='<%# Bind("EMPID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("LASTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("FIRSTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Middle Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("MIDNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Birth">
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("BIRTHDATE","{0:MMM dd, yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show Details">
                                    <ItemTemplate>
                                        <center>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm" OnClientClick="$('#Transact').collapse('show');$('#MemberSearch2').collapse('hide');" data-target="#Transact">Select</asp:LinkButton>
                                        </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <PagerStyle CssClass="gridViewPager"/>
                            <RowStyle Height="25px" />
                        </asp:GridView>
                            </center>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                </div>
            </div>
        <br />
        <div class="Panel-group" id="accordion">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Member</h4>
                        </div>
                        <div id="MemberSearch" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="col-xs-8">
                                    <asp:Label ID="Label4" runat="server" Text="Member: "></asp:Label>
                                    <asp:TextBox ID="txtMemberSearch" runat="server" CssClass="form-control" OnTextChanged="txtMemberSearch_TextChanged" ReadOnly="True"></asp:TextBox>
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
                <div id="Transact" class="collapse in">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div id="Transactions">
                                <div class="col-xs-8">
                                    <asp:Label ID="Label1" runat="server" Text="Transactions" Font-Size="Large"></asp:Label>
                                </div>
                                <br />
                                <center>
                            <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="False" Width="700px" CssClass="panel panel-primary" OnRowCommand="gvTransactions_RowCommand" CellPadding="2" OnRowDataBound="gvTransactions_RowDataBound" OnSelectedIndexChanged="gvTransactions_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Loan Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLoanType" runat="server" Text='<%# Bind("LoanType") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Principal Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrincipalAmountDisp" runat="server" Text='<%# Bind("PrincipalAmount","{0:#,0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Loan Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLoanDateDisp" runat="server" Text='<%# Bind("DateFiled","{0:MMM dd, yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Balance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance","{0:#,0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid">
                                        <ItemTemplate>
                                            <center>
                                            <asp:CheckBox ID="ckPaidTransactionDisp" runat="server" Checked='<%# Bind("Paid") %>' Enabled="False" />
                                            </center>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Show Details">
                                        <ItemTemplate>
                                            <center>
                                            <asp:LinkButton ID="lnkSelectTransact" runat="server" CommandName="View" CssClass="btn btn-info btn-xs" OnClick="lnkSelectTransact_Click" data-target="#Amortizations">...</asp:LinkButton>
                                            </center>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TransactCode" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTransactCode" runat="server" Text='<%# Bind("TransactCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            <PagerStyle HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <RowStyle Height="25px" />
                            </asp:GridView>
                            </center>
                                <div class="col-xs-8">
                                    <asp:Label ID="lblNumTran" runat="server" Text=""></asp:Label>
                                </div>
                                    <br />
                                <br />
                                <br />
                            </div>
                            <div id="Amortizations">
                                <div class="col-xs-8">
                                    <asp:Label ID="lblAmortization" runat="server" Text="Amortization" Font-Size="Large"></asp:Label>
                                </div>
                                <br />
                                <asp:GridView ID="gvAmortizations" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="panel panel-primary" OnRowCancelingEdit="gvAmortizations_RowCancelingEdit" OnRowCommand="gvAmortizations_RowCommand" OnRowDataBound="gvAmortizations_RowDataBound" OnSelectedIndexChanged="gvAmortizations_SelectedIndexChanged" PageSize="12" Width="650px" ViewStateMode="Enabled">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDateDispChange" runat="server" CssClass="form-control"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="txtDateDispChange_CalendarExtender" runat="server" TargetControlID="txtDateDispChange" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblDateDisp" runat="server" Text='<%# Bind("PayDate","{0:MMM dd, yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="GridHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmountDisp" runat="server" Text='<%# Bind("PayAmount","{0:#,0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="GridHeader" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance","{0:#,0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="GridHeader" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Paid">
                                            <ItemTemplate>
                                                <center>
                                            <asp:CheckBox ID="ckPaid" runat="server" AutoPostBack="True" OnCheckedChanged="ckPaid_CheckedChanged1" Enabled="False"/>    
                                            </center>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="GridHeader" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TransactCode" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTransactCode" runat="server" Text='<%# Bind("TransactCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="AmortCode" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmortCode" runat="server" Text='<%# Bind("AmortCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <RowStyle Height="25px" />
                                </asp:GridView>
                                <br />
                                <br />

                                <br />
                                <br />
                                <br />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
        <br />
    </div>
</asp:Content>
