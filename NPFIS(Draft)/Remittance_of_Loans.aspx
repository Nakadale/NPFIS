<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Remittance_of_Loans.aspx.cs" Inherits="NPFIS_Draft_.Remittance_of_Loans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body">
        <div class="panel panel-default panel-collapse collapse in" id="MemberSearch2">
            <div class="panel-heading">
                <h4 class="panel-title">Member Search
                </h4>
            </div>
            <div class="panel panel-collapse collapse in">
                <div class="col-xs-8">
                    <asp:Label ID="Label2" runat="server" Text="Search: " Font-Size="Large"></asp:Label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <p>
                            <asp:Button ID="btnSearchMember" runat="server" Text="Search" CssClass="btn btn-info btn-sm" OnClick="btnSearchMember_Click" />
                            <br />
                            <br />
                            <br />
                            <center>
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="650px" CellPadding="2" OnRowCommand="gvSearch_RowCommand" AllowPaging="True" EnableModelValidation="False" OnRowDataBound="gvSearch_RowDataBound" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" OnPageIndexChanging="gvSearch_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="Employee ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpIDDisp" runat="server" Text='<%# Bind("EMPID") %>'></asp:Label>
                                    </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Surname">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurnameDisp" runat="server" Text='<%# Bind("LASTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFirstNameDisp" runat="server" Text='<%# Bind("FIRSTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Middle Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMiddleNameDisp" runat="server" Text='<%# Bind("MIDNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Birth">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateOfBirthDisp" runat="server" Text='<%# Bind("BIRTHDATE","{0:MMM dd, yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show Transactions">
                                    <ItemTemplate>
                                        <center>
                                        <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Preview" CssClass="btn btn-info btn-sm" Visible="False">Preview</asp:LinkButton>
                                        </center>
                                    </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Branch" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Branch") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="gridViewPager"/>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                        </asp:GridView>
                            </center>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>
