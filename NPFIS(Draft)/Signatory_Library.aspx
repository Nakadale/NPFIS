<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signatory_Library.aspx.cs" Inherits="NPFIS_Draft_.Signatory_Library" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <div class="panel panel-default">
            <div style="text-align: right">
                <br />
                <asp:Button ID="BTNnew" runat="server" Text="New" OnClick="BTNnew_Click" CssClass="btn btn-info btn-sm" Visible="False" />&nbsp
                <asp:Button ID="BTNEdit" runat="server" Text="Edit" OnClick="BTNEdit_Click" CssClass="btn btn-info btn-sm" />&nbsp
                <asp:Button ID="BTNSave" runat="server" Text="Save" OnClick="BTNSave_Click" CssClass="btn btn-info btn-sm" />
                <ajaxToolkit:ConfirmButtonExtender ID="BTNSave_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to save this information?" TargetControlID="BTNSave" />
                &nbsp
                <asp:Button ID="BTNCancel" runat="server" Text="Cancel" OnClick="BTNCancel_Click" CssClass="btn btn-info btn-sm" />&nbsp
                <asp:Button ID="BTNDelete" runat="server" Text="Delete" OnClick="BTNDelete_Click" CssClass="btn btn-info btn-sm" Visible="False" />&nbsp
                <asp:Button ID="BTNSearch" runat="server" Text="Search" CssClass="btn btn-info btn-sm" Visible="False" />&nbsp
                <br />
                <br />
            </div>
        </div>
        <div class="panel panel-default col-md-10">
            <br />
            <br />
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow runat="server" Visible="False">
                    <asp:TableCell runat="server">Signatory Number:</asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:DropDownList ID="ddlSigNum" runat="server" Width="100px" AutoPostBack="True" OnSelectedIndexChanged="ddlSigNum_SelectedIndexChanged" CssClass="btn btn-primary dropdown-toggle"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Administrator: </asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtAdministrator" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Position: </asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtPosition" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Noted By: </asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtNotedBy" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Position: </asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtNotedByPosition" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Prepared By:</asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtPreparedBy" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Position: </asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtPrepareByPosition" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Encoded By:</asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtEncodedBy" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Position: </asp:TableCell>
                    <asp:TableCell runat="server" Style="text-align: left">
                        <asp:TextBox ID="TxtEncodedByPosition" runat="server" Width="300px" Enabled="False" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
