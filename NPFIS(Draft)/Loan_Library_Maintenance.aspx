<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Loan_Library_Maintenance.aspx.cs" Inherits="NPFIS_Draft_.Loan_Library_Maintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="panel panel-default panel-body"> 

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

<div align="right">
    <asp:LinkButton ID="lbtnAdd" CssClass="btn btn-info btn-sm" runat="server">Add</asp:LinkButton>
</div>
    <table style="width: 100%;">
        <tr>
            <td>
          Loan Type:  <asp:DropDownList ID="ddlLoantype" CssClass="btn btn-primary dropdown-toggle" 
        runat="server" 
        onselectedindexchanged="ddlLoantype_SelectedIndexChanged"></asp:DropDownList>
                &nbsp;
           
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
            <td>Interest rate:<asp:TextBox ID="txtbxInterest" Enabled="false" CssClass="form-control" Width="100px" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
            </td>
          

        </tr>
        <tr>
        <td>
        Description: <asp:TextBox ID="txtbxDescription" Enabled="false"  CssClass="form-control" Width="250px" runat="server">
</asp:TextBox>

        &nbsp;
        </td>
        
        </tr>
    </table>







 



</ContentTemplate>
    
</asp:UpdatePanel>
</div>
</asp:Content>
