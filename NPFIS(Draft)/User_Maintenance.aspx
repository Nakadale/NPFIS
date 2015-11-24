<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_Maintenance.aspx.cs" Inherits="NPFIS_Draft_.User_Maintenance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div align="right" class="panel panel-default">
                    <br />
                    <asp:Button ID="btnNew" runat="server" Text="New" Width="75px" CssClass="btn btn-info btn-md" OnClick="btnNew_Click" />
                    &nbsp;
        <asp:Button ID="btnEdit" runat="server" Text="Edit"
            Width="75px" CssClass="btn btn-info btn-md" OnClick="btnEdit_Click" Enabled="False" />
                    &nbsp;
        <asp:Button ID="btnSave" runat="server" Text="Save"
            Width="75px" CssClass="btn btn-info btn-md" OnClick="btnSave_Click" ValidationGroup="VGSaveuser" Enabled="False" />
                    <ajaxToolkit:ConfirmButtonExtender ID="btnSave_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to save this User Information?" TargetControlID="btnSave" />
                    &nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel"
            Width="75px" CssClass="btn btn-info btn-md" OnClick="btnCancel_Click" Enabled="False" />
                    &nbsp;                
        <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" class="btn btn-info btn-md">Search</a>
                    &nbsp;
        <asp:Button ID="btnDelete" runat="server" Text="Delete"
            Width="75px" CssClass="btn btn-info btn-md" OnClick="btnDelete_Click" />
                    <ajaxToolkit:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Delete this User?" TargetControlID="btnDelete" />
                    &nbsp;  &nbsp;  &nbsp;
        <br />
                    <br />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <div class="panel panel-default panel-collapse collapse" id="MemberSearch2" data-parent="#accordion">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2">User Search</a>
                </h4>
            </div>
            <div>

                <div class="col-xs-8">
                    <asp:Label ID="Label3" runat="server" Text="Search: " Font-Size="Large"></asp:Label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <p>
                            <asp:Button ID="btnSearchMember" runat="server" Text="Search" CssClass="btn btn-info btn-sm" OnClick="btnSearchMember_Click" />
                            <br />
                            <br />
                            <br />
                            <center>
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="700px" CellPadding="2" OnRowDataBound="gvSearch_RowDataBound" OnRowCommand="gvSearch_RowCommand" AllowPaging="True" ShowFooter="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                    <HeaderStyle />
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Username">
                                    <HeaderStyle />
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("USERID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Login Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLASTDATE" runat="server" Text='<%# Bind("LASTDATE", "{0:MMM dd, yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show Details">
                                    <ItemTemplate>
                                        <center>
                                        <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm" OnClientClick="$('#MemberSearch2').collapse('hide');">Select</asp:LinkButton>
                                        </center>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                        </asp:GridView>
                            </center>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </div>
        </div>
        <br />

        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="panel panel-default col-md-10">
                    <div class="col-md-4">
                        <br />
                        <br />
                        <div>
                            <asp:Label ID="lblName1" runat="server" Text="Name:"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div>
                            <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div>
                            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div>
                            <asp:Label ID="lblVerifyPassword" runat="server" Text="Verify Password:"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div>
                            <asp:CheckBox
                                ID="chckbxAllowUser" runat="server" CssClass="checkbox-inline" Enabled="False" Text="Allow User" />
                        </div>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter user's name" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="VGSaveuser" ControlToValidate="txtbxName">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtbxName"
                                runat="server" CssClass="form-control" Enabled="False" MaxLength="200"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter User's ID" Font-Bold="True" Font-Size="Large" ForeColor="Red" ControlToValidate="txtbxUsername" ValidationGroup="VGSaveuser">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtbxUsername" runat="server" CssClass="form-control" Enabled="False" MaxLength="10"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtbxPassword" ErrorMessage="Please enter Password" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="VGSaveuser">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtbxPassword" runat="server" CssClass="form-control" Enabled="False" TextMode="Password" MaxLength="50"></asp:TextBox>
                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtbxVerifyPassword" ErrorMessage="Please enter Password" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="VGSaveuser">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtbxVerifyPassword" runat="server" CssClass="form-control" Enabled="False" TextMode="Password" MaxLength="50"></asp:TextBox>
                        </div>
                        <br />
                        <br />
                        <div>
                            <asp:CheckBox
                                ID="chckbxActiveUser" runat="server" CssClass="checkbox-inline" Enabled="False" Text="Active User" />
                        </div>
                        <br />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
