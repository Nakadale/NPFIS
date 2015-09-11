<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Members_Amortization_Report.aspx.cs" Inherits="NPFIS_Draft_.Members_Amortization_Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:Table ID="Table1" runat="server">
            <asp:TableRow runat="server">

               <asp:TableCell ID="TableCell1" runat="server">
                   
                   <asp:Label ID="lblMember" runat="server" Text="Member:"></asp:Label>
                   
                  

                </asp:TableCell>
                
               <asp:TableCell ID="TableCell2" runat="server">
                  <asp:DropDownList ID="ddlMember" Width="200px" Height="20px" runat="server">
                   </asp:DropDownList>
                   
                   </asp:TableCell>
            
            </asp:TableRow>
            <asp:TableRow runat="server">
          
                <asp:TableCell runat="server"> <asp:Label ID="lblTransactionCode" runat="server" Text="Transaction Code:"></asp:Label></asp:TableCell>
              
                <asp:TableCell ID="TableCell3" runat="server">
                    <asp:DropDownList ID="ddlTransactionCode" Width="200px" Height="20px" runat="server">
                    </asp:DropDownList>
                </asp:TableCell>
          
            </asp:TableRow>
        </asp:Table>

        <br />
        <br />

    
        <asp:Table ID="Table2" runat="server" Width="100%" >
            <asp:TableRow runat="server" style="text-align:right">
                
                <asp:TableCell runat="server" style="text-align:right">
                    <asp:Button ID="lblPreview" Width="75px" Height="25px" runat="server" Text="Preview" /></asp:TableCell>
                
                <asp:TableCell runat="server" Width="50px">
                    <asp:Label ID="Label1" runat="server" Text="      "> </asp:Label></asp:TableCell>

                <asp:TableCell runat="server" style="text-align:left">
                    <asp:Button ID="lblPrint" Width="75px" Height="25px" runat="server" Text="Print" /></asp:TableCell>
         
            </asp:TableRow>

        </asp:Table>
</asp:Content>
