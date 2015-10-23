<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Member_Browse.aspx.cs" Inherits="NPFIS_Draft_.Member_Browse" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default panel-body">
    
    <div class="panel panel-default">
    <div class="panel-body">
    

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
     <div style="float: right">
                <asp:Button ID="btnRefresh" runat="server" CssClass="btn btn-info btn-sm" Text="Refresh" OnClick="btnRefresh_Click"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a data-toggle="collapse" data-parent="#accordion" href="#MemberSearch2" class="btn btn-info btn-sm">Search</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-info btn-sm" Text="Save" OnClientClick='return confirm("Are you sure you want to Save?");' OnClick="btnSave_Click" ValidationGroup="VGSave" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-info btn-sm" Text="Edit" 
                    OnClick="btnEdit_Click" Enabled="False" />
          
          
            </div>
    </ContentTemplate>
        </asp:UpdatePanel>


            <div id="Transact">
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
            </div>
    
    
    </div>
    </div>


    <div>
        <br />
        <br />
       
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        
       

        <div>
                <asp:Label ID="lblempid" runat="server" Text="Employee ID:"></asp:Label> &nbsp 
                <asp:TextBox ID="txtbxEmpid" runat="server" CssClass="form-control" 
                    Width="150px" Enabled="False"></asp:TextBox>
               
                <br />
                
            
            </div> <br />
            <div>
                <asp:Label ID="lblLastname" runat="server" Text="Lastname:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtbxLastname" ErrorMessage="Please Enter Lastname" 
                    ForeColor="Red" ValidationGroup="VGSave" Font-Bold="True" 
                    Font-Size="Large">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtbxLastname" runat="server" CssClass="form-control" 
                    Width="250px" Enabled="False"></asp:TextBox>
                <br />
                
            </div> <br />
        
        <div>
                <asp:Label ID="lblFirstname" runat="server" Text="Firstname:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtbxFirstname" ErrorMessage="Please enter Firstname" 
                    ForeColor="Red" ValidationGroup="VGSave" Font-Bold="True" 
                    Font-Size="Large">*</asp:RequiredFieldValidator>
              <br />
                <asp:TextBox ID="txtbxFirstname" runat="server" CssClass="form-control" 
                    Width="250px" Enabled="False"></asp:TextBox>
              
            
            </div> <br />
        

        <div>
                <asp:Label ID="lblMiddlename" runat="server" Text="Middlename:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtbxMidname" ErrorMessage="Please enter Middlename" 
                    Font-Size="Large" ForeColor="Red" ValidationGroup="VGSave">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtbxMidname" runat="server" CssClass="form-control" 
                    Width="250px" Enabled="False"></asp:TextBox>
              
            
            </div> <br />


        <div>
                <asp:Label ID="lblBirthday" runat="server" Text="Birth Date:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtbxBirthdate" ErrorMessage="Please enter Birthdate" 
                    Font-Size="Large" ForeColor="Red" ValidationGroup="VGSave">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtbxBirthdate" runat="server" CssClass="form-control" 
                    Width="400px" Enabled="False"></asp:TextBox>
            
                <ajaxToolkit:CalendarExtender ID="txtbxBirthdate_CalendarExtender" 
                    runat="server" TargetControlID="txtbxBirthdate" />
            
            </div> <br />

            <div>
                <asp:Label ID="lblContactno" runat="server" Text="Contact Number:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtbxContactno" ErrorMessage="Please enter Contact Number" 
                    Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="VGSave">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtbxContactno" runat="server" CssClass="form-control" 
                    Width="400px" Enabled="False"></asp:TextBox>
            
            </div> <br />

            <div>
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtbxAddress" ErrorMessage="Please enter Address" 
                    Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="VGSave">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtbxAddress" runat="server" CssClass="form-control" 
                    Width="400px" Enabled="False"></asp:TextBox>
            
            </div> <br />

            <div>
                <asp:Label ID="lblSalary" runat="server" Text="Monthly Salary:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtbxSalary" ErrorMessage="Please enter Monthly Salary" 
                    Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="VGSave">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtbxSalary" runat="server" CssClass="form-control" 
                    Width="400px" Enabled="False"></asp:TextBox>
            
            </div> <br />

            <div>
                <asp:Label ID="lblPercentageofshare" runat="server" Text="Percentage of Share:"></asp:Label> &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtbxPerofshare" 
                    ErrorMessage="Please enter Percentage of Share" Font-Bold="True" 
                    Font-Size="Large" ForeColor="Red" ValidationGroup="VGSave">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtbxPerofshare" runat="server" CssClass="form-control" 
                    Width="400px" Enabled="False"></asp:TextBox>
            
            </div> <br />
                <div>
                <asp:Label ID="lblDivision" runat="server" Text="Division:"></asp:Label> &nbsp
                    <asp:DropDownList ID="ddlDivision" runat="server" 
                        CssClass="btn btn-primary dropdown-toggle" Enabled="False">
                    </asp:DropDownList>
               <br />
                
            
            </div> <br />
        </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <br />
        <br />
        <br />
    
        <br />
    
    </div>
    </div>
    </asp:Content>

