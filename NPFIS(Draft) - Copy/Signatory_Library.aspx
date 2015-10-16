<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signatory_Library.aspx.cs" Inherits="NPFIS_Draft_.Signatory_Library" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>                
        <div style="text-align: right">
        <asp:Button ID="BTNnew" runat="server" Text="New" OnClick="BTNnew_Click" />&nbsp
        <asp:Button ID="BTNEdit" runat="server" Text="Edit" OnClick="BTNEdit_Click" />&nbsp
        <asp:Button ID="BTNSave" runat="server" Text="Save" OnClick="BTNSave_Click" />&nbsp
        <asp:Button ID="BTNCancel" runat="server" Text="Cancel" OnClick="BTNCancel_Click" />&nbsp
        <asp:Button ID="BTNDelete" runat="server" Text="Delete" OnClick="BTNDelete_Click" />&nbsp
        <asp:Button ID="BTNSearch" runat="server" Text="Search" />&nbsp
        <div>
    </div>
            <div>
                                            

                <asp:Table ID="Table1" runat="server" Width="100%">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Signatory Number:</asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                        <asp:DropDownList ID="ddlSigNum" runat="server" Width="100px" AutoPostBack="True" OnSelectedIndexChanged="ddlSigNum_SelectedIndexChanged"></asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Administrator: </asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                            <asp:TextBox ID="TxtAdministrator" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Position: </asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                            <asp:TextBox ID="TxtPosition" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Noted By: </asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                            <asp:TextBox ID="TxtNotedBy" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Position: </asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">                            
                            <asp:TextBox ID="TxtNotedByPosition" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Prepared By:</asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                            <asp:TextBox ID="TxtPreparedBy" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Position: </asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                            <asp:TextBox ID="TxtPrepareByPosition" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Encoded By:</asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                            <asp:TextBox ID="TxtEncodedBy" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">Position: </asp:TableCell>
                        <asp:TableCell runat="server" Style="text-align:left">
                            <asp:TextBox ID="TxtEncodedByPosition" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
</asp:Content>
