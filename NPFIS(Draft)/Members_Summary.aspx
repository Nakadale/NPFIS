<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Members_Summary.aspx.cs" Inherits="NPFIS_Draft_.Members_Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default panel-body"> 
        <div align="right">
            <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" class="btn btn-info btn-sm">Search</a>
            &nbsp;
            <asp:Button ID="btnPrint" runat="server" Text="Print" 
                CssClass="btn btn-info btn-md" />
            </div><br />

            

            <div class="panel panel-default panel-collapse collapse" id="MemberSearch2">
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
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" Width="650px" 
                                        CellPadding="2" OnRowCommand="gvSearch_RowCommand">
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
                            <HeaderStyle BackColor="#337AB7" BorderColor="#337AB7" ForeColor="White" Height="25px" Wrap="False" />
                            <RowStyle Height="25px" />
                        </asp:GridView>
                            </center>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                </div>
            </div>


            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
           
                <asp:Table ID="Table1" runat="server" Height="80px" Width="450px">
                <asp:TableRow>
                
                <asp:TableCell>
                <asp:Label ID="lblEmpid" runat="server" Text="Employee ID:"></asp:Label> &nbsp;
                </asp:TableCell>

                <asp:TableCell>
                <asp:Label ID="lblEmpidShow" runat="server" CssClass="form-control" Width="150px"></asp:Label>
                </asp:TableCell>

                </asp:TableRow>

                <asp:TableRow>
                <asp:TableCell>
                <asp:Label ID="lblMember" runat="server" Text="Member:"></asp:Label> &nbsp; 
               </asp:TableCell>

                <asp:TableCell>
                <asp:Label ID="lblMemberShow" runat="server" CssClass="form-control" 
                    Width="250px"></asp:Label>
               </asp:TableCell>
               </asp:TableRow>
             
             <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDivision" runat="server" Text="Division:"></asp:Label> &nbsp
                </asp:TableCell>

                <asp:TableCell>
                <asp:Label ID="lblDivisionValue" runat="server" CssClass="form-control" 
                    Width="300px"></asp:Label>
            </asp:TableCell>
          </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <br />
            <br />
           
           
                <asp:Table ID="Table2" runat="server" Height="80px" Width="350px">
               <asp:TableRow> 

               <asp:TableCell>
                <asp:Label ID="lblTotalShare" runat="server" Width="172px" 
                    Text="Total Share Contribution:"></asp:Label> 
               </asp:TableCell>
              
               <asp:TableCell>
                <asp:Label ID="lblTotalShareValue" runat="server" CssClass="form-control" 
                    Width="150px"></asp:Label>
 
            </asp:TableCell>
            </asp:TableRow>
            
            
           <asp:TableRow>
           <asp:TableCell>
                <asp:Label ID="lblTotalLoanBalance" runat="server" Text="Total Loan Balance:"></asp:Label> 

                </asp:TableCell>
                <asp:TableCell>
                <asp:Label ID="lblTotalLoanValue" runat="server" CssClass="form-control" 
                    Width="150px"></asp:Label>

           </asp:TableCell>
           </asp:TableRow>
           </asp:Table>
            </ContentTemplate>
</asp:UpdatePanel>

            <br />
            <br />
            <br />

            <div> 
            
                <asp:Label ID="lblContributions" runat="server" Text="Contributions"></asp:Label>
                <br />
                &nbsp; &nbsp; 
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:GridView ID="gvShareContribution" runat="server" 
                    AutoGenerateColumns="False" CssClass="panel-primary" CellPadding="4" 
                    ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate >
                                <asp:Label ID="lblDate" runat="server" Text="<%# Bind('dateremit', '{0:MMM dd, yyy}') %>"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Monthly Salary">
                            <ItemTemplate>
                                <asp:Label ID="lblMonthlySalary" runat="server" 
                                    Text="<%# Bind('salarybasis', '{0:#,0.00}') %>"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="% of Share">
                            <ItemTemplate>
                                <asp:Label ID="lblPercentageofShare" runat="server" 
                                    Text="<%# Bind('perofsharebasis') %>"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:Label ID="lblAmount" runat="server" Text="<%# Bind('amount', '{0:#,0.00}') %>"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblRemarks" runat="server" Text="<%# Bind('remarks') %>"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField></asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle CssClass="panel-primary" BackColor="#507CD1" Font-Bold="True" 
                        ForeColor="White" />
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

            <br />
            <br />

            <div>
                <asp:Label ID="lblLoans" runat="server" Text="Loans"></asp:Label>
                <br />
                <asp:GridView ID="gridLoans" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Type" />
                        <asp:BoundField HeaderText="Date" />
                        <asp:BoundField HeaderText="Principal Amount" />
                        <asp:BoundField HeaderText="Interest Amount" />
                        <asp:BoundField HeaderText="Service Fee" />
                        <asp:BoundField HeaderText="Payment Terms" />
                        <asp:BoundField HeaderText="Balance" />
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

            </div>
            
            </div>
</asp:Content>
