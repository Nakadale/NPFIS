<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="NPFIS_Draft_.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <div>
        <asp:FileUpload ID="fuScannedForm" runat="server" />
        <br />
        <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-info btn-sm" Text="Upload" OnClick="btnUpload_Click" />
            </div>
        <br />
        <div>
            <br />           
            <asp:Label ID="lblStatus" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <br />
        </div>
    </div>

</asp:Content>
