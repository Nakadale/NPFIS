<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="NewLoanTransaction.aspx.cs" Inherits="NPFIS_Draft_.NewLoanTransaction" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-body">
            <div style="float: right">
                <asp:Button ID="btnRefresh" runat="server" CssClass="btn btn-info btn-sm" Text="Refresh" OnClick="btnRefresh_Click"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" class="btn btn-info btn-sm">Search</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-info btn-sm" Text="Save" OnClick="btnSave_Click" ValidationGroup="InputGroup" />
            </div>
            <br />
            <br />
            <div id="Transact">
            <div class="panel panel-default panel-collapse collapse" id="MemberSearch2">
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
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="650px" CellPadding="2" OnRowCommand="gvSearch_RowCommand" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" AllowPaging="True" ShowFooter="True">
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
                                <asp:TemplateField HeaderText="Show Details">
                                    <ItemTemplate>
                                        <center>
                                        <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm" OnClientClick="$('#MemberSearch2').collapse('hide');">Select</asp:LinkButton>
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
                    <br />
                </div>
            </div>
            </div>
            <div id="MemberSelect">
                <div style="width: 700px" class="row">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div style="width: 350px;" class="col-md-4">
                                <asp:Label ID="Label1" runat="server" Text="Member: "></asp:Label>
                                <asp:TextBox ID="TxtMember" runat="server" Width="266px" Enabled="True" ReadOnly="True" CssClass="form-control"></asp:TextBox>

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

                        <div style="width: 250px;" class="col-md-4">
                            <div>
                                <asp:Label ID="Label5" runat="server" Text="Loan Type: "></asp:Label><br />
                                <asp:DropDownList ID="DDLLoanType" runat="server" Width="170px" AutoPostBack="True" CssClass="btn btn-primary dropdown-toggle" OnSelectedIndexChanged="DDLLoanType_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div>
                                <asp:Label ID="Label6" runat="server" Text="Loan Application No. : "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLoanAppNo" ErrorMessage="No Loan Application entered." Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic" ValidationGroup="InputGroup">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="TxtLoanAppNo" runat="server" Width="180px" CssClass="form-control" MaxLength="10"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="Label7" runat="server" Text="Loan Date: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtLoanDate" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic" ValidationGroup="InputGroup">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtLoanDate" ErrorMessage="Invalid Date Format" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="InputGroup" ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:TextBox ID="TxtLoanDate" runat="server" CssClass="form-control"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CELoanDate" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtLoanDate" />
                            </div>
                            <div>
                                <asp:Label ID="Label8" runat="server" Text="Issued Cheque No.: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtIssuedCheque" ErrorMessage="No Issued Cheque Number entered!" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="InputGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="TxtIssuedCheque" runat="server" Width="203px" CssClass="form-control" MaxLength="10"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="Label9" runat="server" Text="Issued Cheque Date: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtIssuedChequeDate" ErrorMessage="No Issed Cheque Date" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="InputGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtIssuedChequeDate" ErrorMessage="Invalid Date Format" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="InputGroup" ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:TextBox ID="TxtIssuedChequeDate" runat="server" Width="180px" CssClass="form-control"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CEIssuedChequeDate" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtIssuedChequeDate" />
                            </div>
                        </div>
                        <div style="width: 250px;" class="col-md-4">
                            <div>
                                <asp:Label ID="Label10" runat="server" Text="Cheque Released Date: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtChequeReleasedDate" ErrorMessage="No Cheque Release Date" Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtChequeReleasedDate" ErrorMessage="Invalid Date Format" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:TextBox ID="TxtChequeReleasedDate" runat="server" CssClass="form-control"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CEChequeReleasedDate" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtChequeReleasedDate" />
                            </div>
                            <div>
                                <asp:Label ID="Label11" runat="server" Text="Computed Principal Amount: "></asp:Label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtPrincipalAmount" ErrorMessage="numbers only are accepted" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationExpression="^(-)?\d+(\.\d\d)?$" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtPrincipalAmount" ErrorMessage="No Principal Amount entered" Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="TxtPrincipalAmount" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="Label12" runat="server" Text="Interest Rate: "></asp:Label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtInterestRate" ErrorMessage="numbers only are accepted" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationExpression="[0-9]+" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtInterestRate" ErrorMessage="no Loan Type Selected" Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic" >*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="TxtInterestRate" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="Label13" runat="server" Text="Service Fee: "></asp:Label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtServiceFee" ErrorMessage="number only are accepted" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationExpression="[0-9]+" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtServiceFee" ErrorMessage="no Service Fee entered" Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="TxtServiceFee" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div style="width: 200px;" class="col-md-4">
                            <div>
                                <asp:Label ID="Label14" runat="server" Text="Payment Terms: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtPaymentTerms" ErrorMessage="no Payment Terms entered" Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtPaymentTerms" ErrorMessage="number only are accepted" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationExpression="[0-9]+" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:TextBox ID="TxtPaymentTerms" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="Label15" runat="server" Text="Start Date of Amortization: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtStartAmort" ErrorMessage="No Start Amortization date" Font-Bold="True" Font-Size="Large" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ValidationGroup="InputGroup" ControlToValidate="TxtStartAmort" ErrorMessage="Invalid Date Format" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" Display="Dynamic">*</asp:RegularExpressionValidator>
                                <asp:TextBox ID="TxtStartAmort" runat="server" CssClass="form-control"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CEStartAmort" runat="server" Format="MM/dd/yyyy" TargetControlID="TxtStartAmort" />
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
                <asp:Label ID="Label19" runat="server" Text="File: "></asp:Label><asp:FileUpload ID="fuScannedForm" runat="server" accept="image/bmp,image/gif,image/png,image/jpeg" />
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
                                            <asp:Label ID="lblDateDisp" runat="server" Text='<%# Bind("PayDate","{0:MMM dd, yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmountDisp" runat="server" Text='<%# Bind("PayAmount","{0:#,0.00}") %>'></asp:Label>
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
                                            <asp:CheckBox ID="ckPaidAmort" runat="server" Text="" Checked='<%# Bind("Paid") %>' />
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
