<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Members_Summary_Report.aspx.cs" Inherits="NPFIS_Draft_.Members_Summary_Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
           <div>
            <div class="col-md-4">
                <asp:Label ID="lblReportDate" runat="server" Text="Report Date:"></asp:Label>
                <asp:TextBox ID="txtReportDate" runat="server" CssClass="form-control" Width="122px"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Label">dd/mm/yyyy</asp:Label>
                <ajaxToolkit:CalendarExtender ID="txtReportDate_CalendarExtender" runat="server"  TargetControlID="txtReportDate" Format="dd/MM/yyyy"/>
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
           <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="NPFIS_Draft_.Reports.DataSet1TableAdapters.RemittanceOfSharesLoansTableAdapter">
               <SelectParameters>
                   <asp:ControlParameter ControlID="txtReportDate" Name="Reportdate" PropertyName="Text" Type="DateTime" />
               </SelectParameters>
           </asp:ObjectDataSource>
           <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="900px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="700px">
               <LocalReport ReportPath="Reports\MemberSummary.rdlc">
                   <DataSources>
                       <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DSMemberSummary" />
                       <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DSSignatories" />
                   </DataSources>
               </LocalReport>
           </rsweb:ReportViewer>
       </div>
  
 </div>

</asp:Content>

