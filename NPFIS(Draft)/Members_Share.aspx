<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false"
    CodeBehind="Members_Share.aspx.cs" Inherits="NPFIS_Draft_.Members_Share" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-body">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div style="float: right">
                        <asp:Button ID="btnRefresh" runat="server" CssClass="btn btn-info btn-sm" Text="Refresh"
                            OnClick="btnRefresh_Click" />
                        &nbsp;<a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" class="btn btn-info btn-sm">Search</a>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-info btn-sm" Text="Save"
                            OnClick="btnSave_Click" ValidationGroup="VGSave" Visible="False" />
                        &nbsp;<asp:Button ID="btnEdit" runat="server" CssClass="btn btn-info btn-sm" Text="Edit"
                            OnClick="btnEdit_Click" Enabled="False" Visible="False" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:HiddenField ID="hdnMessage" runat="server" ClientIDMode="Static" />
            <br />
            <br />
            <div id="Transact">
                <div class="panel panel-default panel-collapse collapse" id="MemberSearch2">
                    <div class="panel-heading">
                        <h4 class="panel-title">Member Search</h4>
                    </div>
                    <div class="panel panel-collapse collapse in">
                        <div class="col-xs-8">
                            <asp:Label ID="Label1" runat="server" Text="Search: " Font-Size="Large"></asp:Label>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <p>
                                    <asp:Button ID="btnSearchMember" runat="server" Text="Search" CssClass="btn btn-info btn-sm"
                                        OnClick="btnSearchMember_Click" />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="650px" CellPadding="2" OnRowCommand="gvSearch_RowCommand" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" AllowPaging="True" ShowFooter="False" OnPageIndexChanging="gvSearch_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="Employee ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpIDDisp" runat="server" Text='<%# Bind("EMPID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Surname">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurnameDisp" runat="server" Text='<%# Bind("LASTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFirstNameDisp" runat="server" Text='<%# Bind("FIRSTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Middle Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMiddleNameDisp" runat="server" Text='<%# Bind("MIDNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Birth">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateOfBirthDisp" runat="server" Text='<%# Bind("BIRTHDATE","{0:MMM dd, yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show Details">
                                    <ItemTemplate>
                                        <center>
                                        
                                            <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm" OnClientClick="$('#MemberSearch2').collapse('hide'); $('#contribution').collapse('show')">Select</asp:LinkButton>
                                        
                                        </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="gridViewPager"/>
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                        </asp:GridView>
                                   
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                    </div>

                </div>
                <asp:Label ID="lblempid" runat="server" Visible="False"></asp:Label>
            </div>

            <br />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Table ID="Table1" runat="server" Width="100%">
                        <asp:TableRow>
                            <asp:TableCell ID="TableCell2" runat="server" Style="text-align: left">
                                Employee ID:
                                <asp:TextBox ID="Txtempid" CssClass="form-control" Enabled="false" runat="server"
                                    Width="150px"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ID="TableCell1" runat="server" Style="text-align: left">
                                Name:
                                <asp:TextBox ID="TxtName" CssClass="form-control" Enabled="false" runat="server"
                                    Width="250px"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server" Style="text-align: left">
                                Division:
                                <asp:TextBox ID="TxtDivision" CssClass="form-control" Enabled="false" runat="server"
                                    Width="350px"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell runat="server" Style="text-align: left">
                                Branch:
                                <asp:TextBox ID="TxtBranch" CssClass="form-control" Enabled="false" runat="server"
                                    Width="350"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server" Style="text-align: left">
                                Monthly Salary:
                                <asp:TextBox ID="TxtMonthlySalary" CssClass="form-control" Enabled="false" runat="server"
                                    Width="100px"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell runat="server" Style="text-align: left">
                                Percent Share:
                                <asp:TextBox ID="TxtPercentageShare" CssClass="form-control" Enabled="false" Width="50px"
                                    runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server" Style="text-align: left">
                                Computed Share Amount:
                                <asp:TextBox ID="TxtComputedShare" CssClass="form-control" Enabled="false" runat="server"
                                    Width="200px"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            
            <div id="contribution" class="panel panel-collapse collapse in">

                <asp:Label ID="Label2" runat="server" Text="Contributions: "></asp:Label>
                <br />
                    
                    <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                 <div>
                <asp:LinkButton ID="lbtnAddNewContribution" runat="server" 
                    CssClass="btn btn-info btn-sm" onclick="lbtnAddNewContribution_Click" 
                        Enabled="True">Add New Contribution</asp:LinkButton>
                    </div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                            Width="700px" 
                            onpageindexchanging="GridView1_PageIndexChanging" 
                            onrowcancelingedit="GridView1_RowCancelingEdit" 
                            onrowcommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound" 
                            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                            onrowupdating="GridView1_RowUpdating">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                           
                                <asp:TemplateField HeaderText="DATE REMIT">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtbxeditremit" Enabled="true" style="text-align:center" Text='<%# Bind("dateremit","{0:MMM dd, yyyy}") %>' runat="server" CssClass="form-control" 
                                            Width="148px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtremit" style="text-align:center" runat="server" CssClass="form-control" Text='<%# Bind("dateremit","{0:MMM dd, yyyy}") %>' Width="148px">
                                        </asp:TextBox>
                                        <%--<asp:Label ID="lbldateremit" runat="server" CssClass="form-control" 
                                            Text='<%# Bind("dateremit","{0:MMM dd, yyyy}") %>' Width="148px"></asp:Label>--%>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateremit" runat="server" Text='<%# Bind("dateremit","{0:MMM dd, yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                    <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AMOUNT">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtbxeditAmount" style="text-align:center" Text='<%# Bind("amount","{0:#,0.00}") %>' runat="server" CssClass="form-control" 
                                            Width="150px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtbxAmount" style="text-align:center" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("amount","{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                   <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SALARY">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtbxEditSalary" style="text-align:center" Enabled="false" Text='<%# Bind("salarybasis","{0:#,0.00}") %>' runat="server" CssClass="form-control" 
                                            Width="150px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblsalary" runat="server" CssClass="form-control" Width="150px"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("salarybasis","{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="% OF SHARE">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="perofshare" Enabled="false" style="text-align:center" runat="server" Text='<%# Bind("perofsharebasis") %>' CssClass="form-control" 
                                            Width="50px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblperofshare" runat="server" CssClass="form-control" 
                                            Width="50px"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblperofshare" runat="server" Text='<%# Bind("perofsharebasis") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="REMARKS" Visible="False">
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <HeaderStyle HorizontalAlign="Right" CssClass="GridHeader" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lbtnUpdateRemit" runat="server" 
                                            CssClass="btn btn-info btn-sm" CommandName="Update">Update</asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnCancel2Remit" runat="server" 
                                            CssClass="btn btn-info btn-sm" CommandName="Cancel">Cancel</asp:LinkButton>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton ID="lbtnAddRemit" OnClientClick='return confirm("Are you sure you want to Add?");' runat="server" CssClass="btn btn-info btn-sm" 
                                            CommandName="Insert">Save</asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnCancelRemit" runat="server" 
                                            CssClass="btn btn-info btn-sm" CommandName="Cancel">Cancel</asp:LinkButton>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnEditRemit" runat="server" 
                                            CssClass="btn btn-info btn-sm" CommandName="Edit" Visible="False">Edit</asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnDeleteRemit" 
                                            OnClientClick='return confirm("Are you sure you want to Delete?");' runat="server" 
                                            CssClass="btn btn-info btn-sm" CommandName="Delete" Visible="False">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                       </ContentTemplate> </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
