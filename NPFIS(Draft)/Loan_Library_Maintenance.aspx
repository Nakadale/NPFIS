<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Loan_Library_Maintenance.aspx.cs" Inherits="NPFIS_Draft_.Loan_Library_Maintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" class="panel panel-default panel-body">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
   <div align="left">
    <asp:LinkButton ID="lbtnAddNewLoan" runat="server" 
        CssClass="btn btn-info btn-sm" onclick="lbtnAddNewLoan_Click">Add New Loan</asp:LinkButton>
        
    <asp:HiddenField ID="hdnMessage" runat="server" ClientIDMode="Static" />
   </div>
   <br>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowcommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
        onrowupdating="GridView1_RowUpdating" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Width="700px" 
        onpageindexchanging="GridView1_PageIndexChanging" 
        onselectedindexchanging="GridView1_SelectedIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Loan ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtbxEditLoanID" Text='<%# Bind("LoanId") %>' runat="server" 
                        Width="50px" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EditValidLoanId" runat="server" 
                        ControlToValidate="txtbxEditLoanID" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="EditUpdate"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtbxNewLoanID" runat="server" Width="50px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewValidLoanId" runat="server" 
                        ControlToValidate="txtbxNewLoanID" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblLoanID" runat="server" Text='<%# Bind("LoanId") %>'></asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loan Type">
                <EditItemTemplate>
                    <asp:TextBox ID="txtbxEditLoanType" Text='<%# Bind("LoanType") %>' runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EditValidLoanType" runat="server" 
                        ControlToValidate="txtbxEditLoanType" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="EditUpdate"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtbxNewLoanType" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewValidLoanType" runat="server" 
                        ControlToValidate="txtbxNewLoanType" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblLoanType" runat="server" Text='<%# Bind("LoanType") %>'></asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Interest Rate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtbxEditInterestRate" Text='<%# Bind("InterestRate") %>' runat="server" Width="50px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EditValidLoanInterestRate" runat="server" 
                        ControlToValidate="txtbxEditInterestRate" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="EditUpdate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ValidationGroup="EditUpdate" ControlToValidate="txtbxEditInterestRate" ErrorMessage="numbers only are accepted" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationExpression="^(-)?\d+(\.\d\d)?$" Display="Dynamic">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtbxNewInterestRate" runat="server" Width="50px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewValidInterestRate" runat="server" 
                        ControlToValidate="txtbxNewInterestRate" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblInterestRate" runat="server" 
                        Text='<%# Bind("InterestRate") %>'></asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="txtbxEditDescription" Text='<%# Bind("Description") %>' Width="150px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EditValidDescription" runat="server" 
                        ControlToValidate="txtbxEditDescription" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="EditUpdate"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtbxNewDescription" Width="150px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewValidDescrption" runat="server" 
                        ControlToValidate="txtbxNewDescription" ErrorMessage="*" Font-Size="Large" 
                        ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtnUpdate" OnClientClick='return confirm("Are you sure you want to Update?");' CommandName="Update" runat="server" ForeColor="White" 
                        ValidationGroup="EditUpdate" CssClass="btn btn-info btn-sm" OnClick="lbtnUpdate_Click">Update</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lbtnCancel" CommandName="Cancel" runat="server" 
                        ForeColor="White" CssClass="btn btn-info btn-sm">Cancel</asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbtnInsert" OnClientClick='return confirm("Are you sure you want to Insert ?");' runat="server" CommandName="Insert" 
                        ValidationGroup="Insert" CssClass="btn btn-info btn-sm">Insert</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lbtnCancel2" runat="server" CommandName="Cancel" 
                        CssClass="btn btn-info btn-sm">Cancel</asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" CommandName="Edit" Visible="false" runat="server" 
                        CssClass="btn btn-info btn-sm">Edit</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lbtnDelete" CommandName="Delete" 
                        OnClientClick='return confirm("Are you sure you want to Delete?");' 
                        Visible="false" runat="server" CssClass="btn btn-info btn-sm">Delete</asp:LinkButton>
                </ItemTemplate>
                <FooterStyle Width="200px" />
                <ItemStyle Width="200px" />
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
    <p align="left">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Label">Loan ID is based on acctg Code</asp:Label>
    </p>
        <br />
</ContentTemplate>
 </asp:UpdatePanel>
</div>
    <%-- <div class="panel panel-default panel-body"> 

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>




<div align="right">
    <asp:LinkButton ID="lnkNew" runat="server" CssClass="btn btn-info btn-sm" 
        href="#newloan" data-toggle="collapse" 
        OnClientClick="$('#editloantype').collapse('hide'); $('#deleteloantype').collapse('hide');" 
        Visible="False">New Loan Menu</asp:LinkButton>
    &nbsp;&nbsp;
    
    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-info btn-sm" 
        href="#editloantype" data-toggle="collapse" 
        OnClientClick="$('#newloan').collapse('hide');$('#deleteloantype').collapse('hide');" 
        Visible="False">Edit Loan Menu</asp:LinkButton>    
    &nbsp;&nbsp;
   
    <asp:LinkButton ID="lbtnDelete" CssClass="btn btn-info btn-sm" 
        href="#deleteloantype" data-toggle="collapse" 
        OnClientClick="$('#editloantype').collapse('hide'); $('#newloan').collapse('hide');" 
        runat="server" Visible="False">Delete Loan Menu</asp:LinkButton>&nbsp;
    
    <asp:HiddenField ID="hdnMessage" runat="server" ClientIDMode="Static" />
</div>

<div id="NewLoanType">

<div id="newloan" class="panel-collapse collapse" data-parent="#NewLoanType">
<table style="width: 100%;">
<tr>
<td>
 <asp:LinkButton ID="lbtnSave"  CssClass="btn btn-info btn-sm" runat="server" 
        onclick="lbtnSave_Click" 
        onclientclick="return confirm(&quot;Are you sure you want to Save?&quot;);" 
        ValidationGroup="SaveLoan">Save Loan</asp:LinkButton>&nbsp;
</td>
</tr>
   <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
<tr>
<td>
New Loan ID:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="*" ControlToValidate="txtbxnewloanid" Font-Size="Large" 
        ForeColor="Red" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
    &nbsp;<asp:TextBox ID="txtbxnewloanid" Width="100px" CssClass="form-control" runat="server"></asp:TextBox>
</td>
</tr>
   <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
<tr>
<td>
New Loan Type Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
        runat="server" ControlToValidate="txtbxnewloadtype" ErrorMessage="*" 
        Font-Size="Large" ForeColor="Red" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtbxnewloadtype" Width="250px" CssClass="form-control" runat="server"></asp:TextBox>
</td>
</tr>
   <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
<tr>
<td>
New Interest Rate:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
        runat="server" ControlToValidate="txtbxnewinterest" ErrorMessage="*" 
        Font-Size="Large" ForeColor="Red" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtbxnewinterest"  Width="100px" CssClass="form-control" runat="server"></asp:TextBox>
</td>
</tr>
   <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
<tr>
<td>
New Description:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
        runat="server" ControlToValidate="txtbxnewdescription" ErrorMessage="*" 
        Font-Size="Large" ForeColor="Red" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtbxnewdescription" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
</td>
</tr>
</table>
</div>

<br />
<br />

<div id="editloantype" class="panel-collapse collapse" data-parent="#NewLoanType">
    <table style="width: 100%;">
    <tr>
    <td>
    <asp:Button ID="btnEditLoan" CssClass="btn btn-info btn-sm" runat="server" 
            Text="Save Edit" onclick="btnEditLoan_Click1" 
            
            onclientclick="return confirm(&quot;Are you sure you want to Save Edit?&quot;);" 
            ValidationGroup="SaveEdit" />
    </td>
    
    </tr>

           <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
        <td>
        Loan ID: 
            <asp:TextBox ID="txtbxloanid" CssClass="form-control" Enabled="false" Width="100px" runat="server"></asp:TextBox>
        </td>
        </tr>
       
           <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>

          Loan Type:  <asp:DropDownList ID="ddlLoantype" EnableViewState="true" 
                    AutoPostBack="true" CssClass="btn btn-primary dropdown-toggle" 
        runat="server" 
        onselectedindexchanged="ddlLoantype_SelectedIndexChanged"></asp:DropDownList>
                &nbsp;
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="ddlLoantype" ErrorMessage="*" Font-Size="Large" 
                    ForeColor="Red" ValidationGroup="SaveEdit"></asp:RequiredFieldValidator>
           
        </tr>
    
           <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>Interest rate:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                    runat="server" ControlToValidate="txtbxInterest" ErrorMessage="*" 
                    Font-Size="Large" ForeColor="Red" ValidationGroup="SaveEdit"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtbxInterest" CssClass="form-control" Width="100px" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
            </td>
          

        </tr>
        <tr>
        <td>
        Description:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtbxDescription" ErrorMessage="*" Font-Size="Large" 
                ForeColor="Red" ValidationGroup="SaveEdit"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtbxDescription" CssClass="form-control" Width="250px" runat="server">
</asp:TextBox>

        &nbsp;
        </td>
        
        </tr>
    </table>
    </div>
 
    
                &nbsp;
    <div id="deleteloantype" class="panel-collapse collapse" data-parent="#NewLoanType">
    <table>    
    <tr>
    <td>
     <asp:Button ID="btnDeleteLoan" Text="Delete Loan" CssClass="btn btn-info btn-sm" 
            runat="server" onclick="btnDeleteLoan_Click" 
            onclientclick="return confirm(&quot;Are you sure you want to Delete?&quot;);" />
    </td>
    </tr>
       <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    <tr>
    <td>
   Loan Type:  <asp:DropDownList ID="ddl" EnableViewState="true" 
                    AutoPostBack="true" CssClass="btn btn-primary dropdown-toggle" 
        runat="server" 
        onselectedindexchanged="ddl_SelectedIndexChanged"></asp:DropDownList>
    </td>
    </tr>
       <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    <tr>
    <td>
    Loan ID: <asp:TextBox ID="txtbxloaniddelete" Enabled="false" CssClass="form-control" Width="100px" runat="server"></asp:TextBox>
    </td>
    </tr>
       <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    <tr>
    <td>
    Interest Rate:  <asp:TextBox ID="txtxbxinterestdelete" Enabled="false" CssClass="form-control" Width="100px" runat="server"></asp:TextBox>
    </td>
    </tr>
       <tr>
            <td>

                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    <tr>
    <td>
    Description: <asp:TextBox ID="txtbxdescriptiondelete" Enabled="false" CssClass="form-control" Width="250px" runat="server"></asp:TextBox>
    </td>
    </tr>
    </table>
    
    
    </div>




   </div>






 



</ContentTemplate>
    
</asp:UpdatePanel>
</div>--%>
</asp:Content>
