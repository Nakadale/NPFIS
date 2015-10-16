﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Branch_Division_Library.aspx.cs" Inherits="NPFIS_Draft_.Branch_Division_Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label2" runat="server" Text="Branch/Division Maintenance" Font-Bold="True"></asp:Label>
                <div>
                    <div style="text-align: right">
                        <a data-toggle="collapse" data-parent="#accordion" href="#NewBranch" onclick="$('#OldBranch').collapse('toggle');" class="btn btn-info btn-sm">New</a>&nbsp
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-info btn-sm" OnClick="BtnEdit_Click" />&nbsp
                    <asp:Button ID="BTNDelete" runat="server" Text="Delete" CssClass="btn btn-info btn-sm" OnClick="BTNDelete_Click" />&nbsp
                    <asp:Button ID="BTNSearch" runat="server" Text="Search" CssClass="btn btn-info btn-sm" Visible="False" />&nbsp
                    </div>
                </div>
                <div id="accordion">
                    <div id="Search" class="panel-collapse collapse" data-parent="#accordion">
                    </div>
                    <div id="NewBranch" class="panel-collapse collapse" data-parent="#accordion">
                        <asp:Label ID="Label3" runat="server" Text="BranchName:"></asp:Label>
                        <asp:TextBox ID="TxtNewBranchName" runat="server" CssClass="form-control" Width="400px"></asp:TextBox>
                        <br />
                        <asp:Button ID="BTNSave" runat="server" Text="Save" CssClass="btn btn-info btn-sm" OnClick="BTNSave_Click" Visible="True" />&nbsp  
                    <asp:Button ID="BTNUpdate" runat="server" Text="Update" CssClass="btn btn-info btn-sm" Visible="False" OnClick="BTNUpdate_Click" />&nbsp  
                    <asp:Button ID="BTNCancel" runat="server" Text="Cancel" CssClass="btn btn-info btn-sm" OnClick="BTNCancel_Click" />&nbsp
                    </div>
                    <br />
                    <div id="OldBranch" class="panel-collapse collapse in" data-parent="#accordion">
                        <div>
                            <asp:Label ID="Label5" runat="server" Text="Branch Name: "></asp:Label>
                            <asp:DropDownList ID="DDLBranchID" runat="server" OnSelectedIndexChanged="DDLBranchID_SelectedIndexChanged1" CssClass="btn btn-primary dropdown-toggle" AutoPostBack="True"></asp:DropDownList>
                        </div>
                    </div>

                </div>
                <br />
                <div style="text-align: left">
                    <asp:Label ID="Label1" runat="server" Text="Division" Font-Bold="True" Visible="False"></asp:Label>
                    <br />
                    <div class="col-md-8">
                        <asp:GridView ID="gvDivision" runat="server" AutoGenerateColumns="False" Width="425px" OnRowDataBound="gvDivision_RowDataBound" OnRowCommand="gvDivision_RowCommand" OnSelectedIndexChanged="gvDivision_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="Branch ID" Visible="False">
                                    <FooterTemplate>
                                        <asp:Label ID="lblBranchIDFooter" runat="server"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchID" runat="server" Text='<%# Bind("branchID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Division ID">
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtDivisionID" runat="server" CssClass="form-control" Text='<%# Bind("DivisionID") %>'></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDivisionID" runat="server" Text='<%# Bind("DivisionID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="75px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="   Division Name">
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtDivisionName" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtDivisionName_TextChanged"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDivisionName" runat="server" Text='<%# Bind("DivisionName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#3399FF" />
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                            <SelectedRowStyle ForeColor="#CCCCCC" />
                        </asp:GridView>
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="btnAddSave" runat="server" Text="Add" CssClass="btn btn-info btn-sm" OnClick="Button1_Click" />
                        <asp:Button ID="btnDeleteCancel" runat="server" Text="Delete" CssClass="btn btn-info btn-sm" OnClick="btnDeleteCancel_Click" />
                    </div>
                </div>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>