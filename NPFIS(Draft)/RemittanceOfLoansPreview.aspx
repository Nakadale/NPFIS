<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RemittanceOfLoansPreview.aspx.cs" Inherits="NPFIS_Draft_.RemittanceOfLoansPreview" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.SignatoriesTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.RemittanceOfLoansTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="EmpID" SessionField="EmpID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="900px" Width="700px" Font-Names="Verdana" Font-Size="8pt" ShowPrintButton="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Reports\RemittanceOfLoans.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DSSignatories" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DSRemittanceOfLoans" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    </div>
</asp:Content>
