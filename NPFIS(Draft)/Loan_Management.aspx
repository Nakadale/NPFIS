<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Loan_Management.aspx.cs" Inherits="NPFIS_Draft_.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="text-align: right">
            <asp:Label ID="lblstatus" runat="server" Text="Label"></asp:Label>&nbsp
        <asp:Button ID="BTNnew" runat="server" Text="New" OnClick="BTNnew_Click" Style="height: 26px" />&nbsp
        <asp:Button ID="BTNEdit" runat="server" Text="Edit" OnClick="BTNEdit_Click" />&nbsp
        <asp:Button ID="BTNSave" runat="server" Text="Save" OnClick="BTNSave_Click" />&nbsp
        <asp:Button ID="BTNCancel" runat="server" Text="Cancel" Visible="False" OnClick="BTNCancel_Click" />&nbsp
        <asp:Button ID="BTNDelete" runat="server" Text="Delete" OnClick="BTNDelete_Click" />&nbsp
        <asp:Button ID="BTNSearch" runat="server" Text="Search" />&nbsp
        <asp:Button ID="BTNPrint" runat="server" Text="Print" />
            <div>
                <br />
                <br />
                <br />
            </div>

        </div>
        <div>

            <div>



                <asp:ScriptManager ID="SMEndAmort" runat="server"></asp:ScriptManager>
                <asp:Table ID="Table1" runat="server" Width="100%">
                    <asp:TableRow runat="server">
                        <asp:TableCell ID="Cell1" runat="server" Enabled="True">
                            <asp:Label ID="Label1" runat="server" Text="Member: "></asp:Label>
                            <asp:DropDownList ID="DDLMember" runat="server" Width="276px" OnSelectedIndexChanged="DDLMember_SelectedIndexChanged" AutoPostBack="True" Enabled="True" CssClass="btn btn-primary dropdown-toggle"></asp:DropDownList>
                            <br />
                        </asp:TableCell>
                        <asp:TableCell ID="Cell2" runat="server" Style="text-align: right">
                            <asp:Label ID="Label2" runat="server" Text="Transaction Code: "></asp:Label>
                            <asp:DropDownList ID="ddlTranCode" runat="server" Width="220px" Enabled="True" OnSelectedIndexChanged="ddlTranCode_SelectedIndexChanged" AutoPostBack="True" CssClass="btn btn-primary dropdown-toggle"></asp:DropDownList>
                            <asp:TextBox ID="txtTranCode" runat="server" Width="210px" Enabled="True" ReadOnly="True" Visible="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell ID="Cell3" runat="server">
                            <asp:Label ID="Label3" runat="server" Text="Division: "></asp:Label>
                            <asp:TextBox ID="TxtDivision" runat="server" Width="266px" Enabled="True" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell ID="Cell4" runat="server" Style="text-align: right">
                            <asp:Label ID="Label4" runat="server" Text="Branch: "></asp:Label>
                            <asp:TextBox ID="TxtBranch" runat="server" Width="220px" Enabled="True" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div>
            </div>
            <div>

                <asp:Table ID="Table2" runat="server" Width="100%" Style="text-align: right">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label5" runat="server" Text="Loan Type: "></asp:Label>
                            <asp:DropDownList ID="DDLLoanType" runat="server" Height="19px" Width="170px" OnSelectedIndexChanged="DDLLoanType_SelectedIndexChanged" AutoPostBack="True" Enabled="False" CssClass="btn btn-primary dropdown-toggle"></asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label6" runat="server" Text="Loan Application No. : "></asp:Label>
                            <asp:TextBox ID="TxtLoanAppNo" runat="server" Width="180px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label7" runat="server" Text="Loan Date: "></asp:Label>
                            <asp:TextBox ID="TxtLoanDate" runat="server" Enabled="False"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CELoanDate" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtLoanDate" />

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label8" runat="server" Text="Issued Cheque No.: "></asp:Label>
                            <asp:TextBox ID="TxtIssuedCheque" runat="server" Width="203px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label9" runat="server" Text="Issued Cheque Date: "></asp:Label>
                            <asp:TextBox ID="TxtIssuedChequeDate" runat="server" Width="180px" Enabled="False"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CEIssuedChequeDate" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtIssuedChequeDate" />
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label10" runat="server" Text="Cheque Released Date: "></asp:Label>
                            <asp:TextBox ID="TxtChequeReleasedDate" runat="server" Enabled="False"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CEChequeReleasedDate" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtChequeReleasedDate" />

                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label11" runat="server" Text="Principal Amount: "></asp:Label>
                            <asp:TextBox ID="TxtPrincipalAmount" runat="server" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label12" runat="server" Text="Interest Rate: "></asp:Label>
                            <asp:TextBox ID="TxtInterestRate" runat="server" ReadOnly="True" Enabled="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label13" runat="server" Text="Service Fee: "></asp:Label>
                            <asp:TextBox ID="TxtServiceFee" runat="server" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label14" runat="server" Text="Payment Terms: "></asp:Label>
                            <asp:TextBox ID="TxtPaymentTerms" runat="server" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label15" runat="server" Text="Start Date of Amortization: "></asp:Label>
                            <asp:TextBox ID="TxtStartAmort" runat="server" Enabled="False"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CEStartAmort" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtStartAmort" />
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label16" runat="server" Text="End Date of Amortization: "></asp:Label>

                            <asp:TextBox ID="TxtEndAmort" runat="server" Enabled="False"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CEEndAmort" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtEndAmort" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label17" runat="server" Text="Paid-up Loan: "></asp:Label>
                            <asp:CheckBox ID="CkPaidUpLoan" runat="server" Enabled="False" />
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Label ID="Label19" runat="server" Text="File: "></asp:Label>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <div>
                    <asp:Label ID="Label18" runat="server" Text="Amortizations: "></asp:Label>

                </div>
                <div style="text-align: center">
                    <asp:GridView ID="gvAmortizations" runat="server" Width="80%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDateEdit" runat="server" Text='<%# Bind("PayDate") %>'></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtDateEdit_CalendarExtender" runat="server" TargetControlID="txtDateEdit" />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TxtDateFooter" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="TxtDateFooter_CalendarExtender" runat="server" TargetControlID="TxtDateFooter" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("PayDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditAmount" runat="server" Text='<%# Bind("PayAmount") %>' OnTextChanged="txtEditAmount_TextChanged"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtFooterAmount" runat="server" AutoPostBack="True" OnTextChanged="txtFooterAmount_TextChanged"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("PayAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Interest amount">
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditInterest" runat="server"></asp:Label>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblFooterInterest" runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblInterest" runat="server" Text='<%# Bind("IntAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Balance">
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditbalance" runat="server"></asp:Label>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblFooterbalance" runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <FooterTemplate>
                                    <asp:Button ID="btnAddRec" runat="server" OnClick="btnAddRec_Click" Text=" + " />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="btnDelRec" runat="server" Text=" - " />
                                </ItemTemplate>
                            </asp:TemplateField>
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
            <br />


        </div>

    </div>
</asp:Content>
