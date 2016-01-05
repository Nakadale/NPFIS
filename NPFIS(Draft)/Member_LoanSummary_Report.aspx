<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member_LoanSummary_Report.aspx.cs" Inherits="NPFIS_Draft_.Member_Loan_Summary_Report" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="panel panel-default panel-body">
        <div class="panel panel-default col-md-10">
            <br />
            <div class="col-md-4">
                <asp:Label ID="lblReportDate" runat="server" Text="Report Date:"></asp:Label>
                <asp:TextBox ID="txtReportDate" runat="server" CssClass="form-control" Width="122px"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Label">dd/mm/yyyy</asp:Label>
                <ajaxToolkit:CalendarExtender ID="txtReportDate_CalendarExtender" runat="server"  TargetControlID="txtReportDate" Format="dd/MM/yyyy" />
            </div>
            <div class="col-md-4">
                <br />
                <asp:Button ID="btnPreview" runat="server" CssClass="btn btn-info btn-sm" Text="Preview" OnClick="btnPreview_Click" />
            </div>
            <br />
            <br />
            <br />
            <br />
        </div>
            <br />
            <br />
            <br />
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.SignatoriesTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.DTLoanSummaryTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtReportDate" DefaultValue="" Name="ReportDate" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="900px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="700px">
                <LocalReport ReportPath="Reports\Loan_Summary.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DSLoanSummary" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DSSignatories" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
        </div>
        </div>
</asp:Content>
