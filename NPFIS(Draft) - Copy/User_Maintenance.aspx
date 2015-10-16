<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_Maintenance.aspx.cs" Inherits="NPFIS_Draft_.User_Maintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div align="right">
         <div> <asp:Label ID="lblUserMaintenance" runat="server" Text="User's Maintance" 
                 Font-Bold="True"></asp:Label></div>
<div align="right">
        <asp:Button ID="btnNew" runat="server" Text="New" Height="25px" Width="75px" />  &nbsp;
        <asp:Button ID="btnEdit" runat="server" Text="Edit" Height="25px" 
            Width="75px" />  &nbsp;
        <asp:Button ID="btnSave" runat="server" Text="Save" Height="25px" 
            Width="75px" />  &nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="25px" 
            Width="75px" />  &nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="Search" Height="25px" 
            Width="75px" />  &nbsp;
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Height="25px" 
            Width="75px" />  &nbsp;  &nbsp;  &nbsp; 
        </div>
        <br />
        <br />

        <div>
            <asp:Table ID="Table1" runat="server" Width="248px" Height="66px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                    </asp:TableCell>

                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtbxName" Width="150px" Height="20px" runat="server"></asp:TextBox>
                        
                        </asp:TableCell>


                </asp:TableRow>




                <asp:TableRow runat="server">
                <asp:TableCell ID="TableCell1" runat="server">
                    <asp:Label ID="lblUsername1" runat="server" Text="Username:"></asp:Label></asp:TableCell>
                    <asp:TableCell ID="TableCell2" runat="server">
                        <asp:TextBox ID="txtbxUsername1" Width="150px" Height="20px" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>


                <asp:TableRow runat="server">
                <asp:TableCell ID="TableCell3" runat="server">
                    <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label></asp:TableCell>
                    <asp:TableCell ID="TableCell4" runat="server">
                        <asp:TextBox ID="txtbxPassword" Width="150px" Height="20px" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>


                <asp:TableRow runat="server">
                <asp:TableCell ID="TableCell5" runat="server">
                    <asp:Label ID="lblVerifyPassword" runat="server" Text="Verify Password:"></asp:Label></asp:TableCell>
                    <asp:TableCell ID="TableCell6" runat="server">
                        <asp:TextBox ID="txtbxVerifyPassword" Width="150px" Height="20px" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow runat="server">
                <asp:TableCell ID="TableCell7" runat="server">
                    <asp:Label ID="lblAllowUser" runat="server" Text="Allow User: "></asp:Label></asp:TableCell>
                    <asp:TableCell ID="TableCell8" runat="server">
                        <asp:CheckBox ID="chkbxAllowUSer" Width="20px" Height="20px" runat="server" /></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow runat="server">
                <asp:TableCell ID="TableCell9" runat="server">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></asp:TableCell>
                    <asp:TableCell ID="TableCell10" runat="server">
                        <asp:CheckBox ID="chkbxActiveUser" Width="20px" Height="20px" runat="server"></asp:CheckBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                <asp:TableCell ID="TableCell11" runat="server">
                    <asp:Label ID="lblLastLogin" runat="server" Text="Last Login: "></asp:Label></asp:TableCell>
                    <asp:TableCell ID="TableCell12" runat="server">
                        <asp:TextBox ID="txtbxLastLogin" Width="150px" Height="20px" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
               
            </asp:Table>
        
        </div>
</asp:Content>
