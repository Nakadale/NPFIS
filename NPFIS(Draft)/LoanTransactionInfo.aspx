<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoanTransactionInfo.aspx.cs" Inherits="NPFIS_Draft_.WebForm8" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default" >
    <div class="panel-body">
    <div id="MemberSelect">
        <div style="width: 700px" class="row">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <div style="width: 350px;" class="col-md-4">
                        <asp:Label ID="Label1" runat="server" Text="Member: "></asp:Label>
                        <asp:Label ID="lblMember" runat="server" CssClass="form-control"></asp:Label>
                        <br />

                        <asp:Label ID="Label3" runat="server" Text="Division: "></asp:Label>
                        <asp:TextBox ID="TxtDivision" runat="server" Width="266px" Enabled="True" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div style="width: 350px;" class="col-md-4">
                        <asp:Label ID="Label4" runat="server" Text="Branch: "></asp:Label>
                        <asp:TextBox ID="TxtBranch" runat="server" Width="220px" Enabled="True" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <br />
    <br />
    <div style="width: 700px" class="row">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div style="width: 250px;" class="col-md-4">
                    <div>
                        <asp:Label ID="Label5" runat="server" Text="Loan Type: "></asp:Label><br />
                        <asp:DropDownList ID="DDLLoanType" runat="server" Width="170px" AutoPostBack="True" CssClass="btn btn-primary dropdown-toggle" OnSelectedIndexChanged="DDLLoanType_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="Loan Application No. : "></asp:Label>
                        <asp:TextBox ID="TxtLoanAppNo" runat="server" Width="180px" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label7" runat="server" Text="Loan Date: "></asp:Label>
                        <asp:TextBox ID="TxtLoanDate" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxtoolkit:calendarextender ID="CELoanDate" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtLoanDate" />
                    </div>
                    <div>
                        <asp:Label ID="Label8" runat="server" Text="Issued Cheque No.: "></asp:Label>
                        <asp:TextBox ID="TxtIssuedCheque" runat="server" Width="203px" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label9" runat="server" Text="Issued Cheque Date: "></asp:Label>
                        <asp:TextBox ID="TxtIssuedChequeDate" runat="server" Width="180px" CssClass="form-control"></asp:TextBox>
                        <ajaxtoolkit:calendarextender ID="CEIssuedChequeDate" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtIssuedChequeDate" />
                    </div>
                </div>
                <div style="width: 250px;" class="col-md-4">
                    <div>
                        <asp:Label ID="Label10" runat="server" Text="Cheque Released Date: "></asp:Label>
                        <asp:TextBox ID="TxtChequeReleasedDate" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxtoolkit:calendarextender ID="CEChequeReleasedDate" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtChequeReleasedDate" />
                    </div>
                    <div>
                        <asp:Label ID="Label11" runat="server" Text="Principal Amount: "></asp:Label>
                        <asp:TextBox ID="TxtPrincipalAmount" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label12" runat="server" Text="Interest Rate: "></asp:Label>
                        <asp:TextBox ID="TxtInterestRate" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label13" runat="server" Text="Service Fee: "></asp:Label>
                        <asp:TextBox ID="TxtServiceFee" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div style="width: 200px;" class="col-md-4">
                    <div>
                        <asp:Label ID="Label14" runat="server" Text="Payment Terms: "></asp:Label>
                        <asp:TextBox ID="TxtPaymentTerms" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label15" runat="server" Text="Start Date of Amortization: "></asp:Label>
                        <asp:TextBox ID="TxtStartAmort" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxtoolkit:calendarextender ID="CEStartAmort" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtStartAmort" />
                    </div>
                    <div>
                        <asp:Label ID="Label16" runat="server" Text="End Date of Amortization: "></asp:Label>
                        <asp:TextBox ID="TxtEndAmort" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="checkbox in-line">
                        <center>
                            <br />
                        <asp:CheckBox ID="CkPaidUpLoan" runat="server" Enabled="False" CssClass="checkbox" Text="Paid-up Loan:" AutoPostBack="True" />
                        </center>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <div>
        <asp:Label ID="Label19" runat="server" Text="File: "></asp:Label><asp:FileUpload ID="fuScannedForm" runat="server" />
    </div>
    <br />
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnGenerate" runat="server" Text="Generate Amortization" CssClass="btn btn-info btn-sm" OnClick="btnGenerate_Click" />
                <br />
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
                                            <asp:CheckBox ID="ckPaidAmort" runat="server" Text="Paid" Checked='<%# Bind("Paid") %>' CssClass="checkbox" />
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
    </div>
        </div>
        </div>
</asp:Content>
