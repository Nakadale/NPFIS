<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanTransactionInfo2.aspx.cs" Inherits="NPFIS_Draft_.WebForm1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
    <div> Loan Transaction Information
    </div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
    <div class="panel panel-default" >
    <div class="panel-body">
    <div id="MemberSelect">
        <div style="width: 350px" class="row">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <div style="width: 350px;" class="col-md-4">
                        <asp:Label ID="Label1" runat="server" Text="Member: "></asp:Label>
                        <asp:TextBox ID="txtMember" runat="server" CssClass="form-control" Enabled="False" Width="400px"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" Text="Division: "></asp:Label>
                        <asp:TextBox ID="TxtDivision" runat="server" Width="400px" Enabled="True" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div style="width: 350px;" class="col-md-4">
                        <asp:Label ID="Label4" runat="server" Text="Branch: "></asp:Label>
                        <asp:TextBox ID="TxtBranch" runat="server" Width="400px" Enabled="True" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <br />
    <br />
    <div style="width: 800px" class="row">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div style="width: 250px;" class="col-md-4">
                    <div>
                        <asp:Label ID="Label5" runat="server" Text="Loan Type: "></asp:Label>
                        <asp:TextBox ID="txtLoanType" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="Loan Application No. : "></asp:Label>
                        <asp:TextBox ID="TxtLoanAppNo" runat="server" Width="180px" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label7" runat="server" Text="Loan Date: "></asp:Label>
                        <asp:TextBox ID="TxtLoanDate" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label8" runat="server" Text="Issued Cheque No.: "></asp:Label>
                        <asp:TextBox ID="TxtIssuedCheque" runat="server" Width="203px" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label9" runat="server" Text="Issued Cheque Date: "></asp:Label>
                        <asp:TextBox ID="TxtIssuedChequeDate" runat="server" Width="180px" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                </div>
                <div style="width: 250px;" class="col-md-4">
                    <div>
                        <asp:Label ID="Label10" runat="server" Text="Cheque Released Date: "></asp:Label>
                        <asp:TextBox ID="TxtChequeReleasedDate" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label11" runat="server" Text="Principal Amount: "></asp:Label>
                        <asp:TextBox ID="TxtPrincipalAmount" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label12" runat="server" Text="Interest Rate: "></asp:Label>
                        <asp:TextBox ID="TxtInterestRate" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label13" runat="server" Text="Service Fee: "></asp:Label>
                        <asp:TextBox ID="TxtServiceFee" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                </div>
                <div style="width: 200px;" class="col-md-4">
                    <div>
                        <asp:Label ID="Label14" runat="server" Text="Payment Terms: "></asp:Label>
                        <asp:TextBox ID="TxtPaymentTerms" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label15" runat="server" Text="Start Date of Amortization: "></asp:Label>
                        <asp:TextBox ID="TxtStartAmort" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
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
                <div class="col-md-4">
                    <asp:HyperLink ID="HlScannedApp" runat="server" NavigateUrl="\uploads\images.jpg" Target="_blank">View Scanned Application</asp:HyperLink>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <br />
        </div>
        </div>
    </form>
</body>
</html>
