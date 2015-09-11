<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="NPFIS_Draft_.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Import:  "></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" />
    </div>
</asp:Content>
