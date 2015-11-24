<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member_Loan_Summary.aspx.cs" Inherits="NPFIS_Draft_.Member_Loan_Summary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <div> 
        <asp:Label ID="lblMemberLoanAmortization" runat="server" Text="Member's Loan Amortization Schedule Report" 
            Font-Bold="True" Font-Size="Medium"></asp:Label>
            <br />
        </div>
        <div>

        </div>
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="900px" Width="700px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportEmbeddedResource="NPFIS_Draft_.Reports.Amortization_Schedule.rdlc" ReportPath="Reports\Amortization_Schedule.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ODSLoanAmortization" Name="DTAmortization" />
                    <rsweb:ReportDataSource DataSourceId="ODSLoanTransaction" Name="DTTransaction" />
                    <rsweb:ReportDataSource DataSourceId="ODSSignatories" Name="DTSignatories" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ODSLoanAmortization" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.LoanAmortizationTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="TransactCode" SessionField="TransactCode" Type="String" />
                <asp:SessionParameter Name="EmpID" SessionField="EmpID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ODSSignatories" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.SignatoriesTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSLoanTransaction" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.LoanTransactionTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="EMPID" SessionField="EmpID" Type="String" />
                    <asp:SessionParameter Name="TransactCode" SessionField="TransactCode" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
    </div>
        </div>
</asp:Content>
