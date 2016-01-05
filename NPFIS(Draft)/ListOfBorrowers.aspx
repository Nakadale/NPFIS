<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListOfBorrowers.aspx.cs" Inherits="NPFIS_Draft_.ListOfBorrowers" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <div>
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
        </div>
            <br />
            <br />
            <br />
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.SignatoriesTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.DTListOfBorrowersTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtReportDate" Name="Reportdate" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="900px" Width="700px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                <LocalReport ReportPath="Reports\List_Of_Borrowers.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DTListOfBorrowers" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DTSignatories" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.DTLoanSummaryTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtReportDate" Name="Month" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="txtReportDate" Name="Year" PropertyName="Text" Type="Decimal" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        </div>
</asp:Content>
