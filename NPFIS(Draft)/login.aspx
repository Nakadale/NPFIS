<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs"  Inherits="NPFIS_Draft_.login" %>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblUser" runat="server" Text="Username: "></asp:Label>
        <asp:TextBox ID="txtbxUser" runat="server"></asp:TextBox> <br />
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label> 
        <asp:TextBox ID="txtbxPassword" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
            Text="Login" />
        <br />
        <asp:HiddenField ID="hdnMessage" runat="server" 
                ClientIDMode="Static"/>       
    
    </div>
    </form>
