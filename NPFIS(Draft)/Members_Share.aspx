<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Members_Share.aspx.cs" Inherits="NPFIS_Draft_.Members_Share" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div  class="panel panel-default">
    <div class="panel-body">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
     <div style="float: right">
                <asp:Button ID="btnRefresh" runat="server" CssClass="btn btn-info btn-sm" 
                    Text="Refresh" OnClick="btnRefresh_Click"/>
                &nbsp;<a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" 
                    class="btn btn-info btn-sm">Search</a>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info btn-sm" 
                    Text="Save" OnClick="btnSave_Click" ValidationGroup="VGSave" />
             &nbsp;<asp:Button ID="btnEdit" runat="server" CssClass="btn btn-info btn-sm" Text="Edit" 
                    OnClick="btnEdit_Click" Enabled="False" />
   </div> 
   </ContentTemplate>
        </asp:UpdatePanel>


           <div id="Transact">  
           <div class="panel panel-default panel-collapse collapse" id="MemberSearch2">
           <div class="panel-heading">


                    <h4  class="panel-title">Member Search</h4>
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
                            
                                <asp:Button ID="btnSearchMember" runat="server" Text="Search" 
                                    CssClass="btn btn-info btn-sm" OnClick="btnSearchMember_Click" />
                                <br />
                                <br />
                                <br />
                                <br />
                                <center>
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="650px" CellPadding="2" OnRowCommand="gvSearch_RowCommand" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" AllowPaging="True" ShowFooter="True">
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
                                        <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CssClass="btn btn-info btn-sm" OnClientClick="$('#MemberSearch2').collapse('hide');">Select</asp:LinkButton>
                                        </center>
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
                    <br />
                </div>


            </div>
               <asp:Label ID="lblempid" runat="server" Visible="False"></asp:Label>
            </div>


                    
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                       <ContentTemplate>

                        <asp:Table ID="Table1" runat="server" Width="100%">
                        <asp:TableRow>
                        <asp:TableCell ID="TableCell2" runat="server" style="text-align:left">Employee ID: <asp:TextBox ID="Txtempid" CssClass="form-control" Enabled="false"  runat="server" Width="150px"></asp:TextBox></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                         <asp:TableCell ID="TableCell1" runat="server"  style="text-align:left">Name: <asp:TextBox ID="TxtName" CssClass="form-control" Enabled="false" runat="server" Width="250px"></asp:TextBox></asp:TableCell>
                        </asp:TableRow>
                            <asp:TableRow runat="server" >
                                <asp:TableCell runat="server"  style="text-align:left">Division: <asp:TextBox ID="TxtDivision" CssClass="form-control" Enabled="false" runat="server" Width="350px"></asp:TextBox></asp:TableCell>
                                 </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell runat="server" style="text-align:left" >Branch: <asp:TextBox ID="TxtBranch" CssClass="form-control" Enabled="false" runat="server" Width="350" ></asp:TextBox></asp:TableCell>
                                 </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" style="text-align:left">Monthly Salary: <asp:TextBox ID="TxtMonthlySalary" CssClass="form-control" Enabled="false" runat="server" Width="100px"></asp:TextBox></asp:TableCell>
                               </asp:TableRow>
                               <asp:TableRow>
                                <asp:TableCell runat="server" style="text-align:left">Percentage Share: <asp:TextBox ID="TxtPercentageShare" CssClass="form-control" Enabled="false" Width="50px"  runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" style="text-align:left">Computed Share Amount: <asp:TextBox ID="TxtComputedShare" CssClass="form-control" Enabled="false" runat="server" Width="200px"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    


                    <br />
                    <div style="text-align: left">
                        <asp:Label ID="Label2" runat="server" Text="Contributions: "></asp:Label></div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                       <ContentTemplate>


                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                               CellPadding="4" ForeColor="#333333" HorizontalAlign="Left">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="DATE REMIT">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateremit" runat="server" Text='<%# Bind("dateremit") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TOTAL AMOUNT">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SALARY">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("salarybasis") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="% OF SHARE">
                                    <ItemTemplate>
                                        <asp:Label ID="lblperofshare" runat="server" 
                                            Text='<%# Bind("perofsharebasis") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="REMARKS">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemStyle HorizontalAlign="Center" />
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
                        </ContentTemplate>
                     </asp:UpdatePanel>
                    </div>
    </div></div>
</asp:Content>
