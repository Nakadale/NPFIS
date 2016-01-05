<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebLogin.aspx.cs" Inherits="NPFIS_Draft_.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="alertify/alertify.css" rel="stylesheet" type="text/css" />
    <link href="alertify/default.css" rel="stylesheet" type="text/css" />
    <script src="alertify/alertify.min.js" type="text/javascript"></script>
<body>
    <form id="form1" runat="server">
                <!-- Banner Area -->
        <div style="background-color: #5e9ac0; color: #FFFFFF; font-weight: bold">
            <div style="background-color: #5e9ac0; color: #FFFFFF; font-weight: bold">
                <div style="width: 100%; height: 40px; background-color: #000000;">
                    <div style=" margin: auto; padding-top: 10px; width: 1024px;">
                    </div>
                </div>
                <div style="font-size: xx-large; font-family: Arial, Helvetica, sans-serif; text-align: center; width: 100%;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/textNamria2.jpg" />
                </div>
                <div style="font-size: xx-large; font-family: Arial, Helvetica, sans-serif; text-align: center; background-color: #cccccc; width: 100%; height: 50px;">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/NPFIS.jpg" />
                </div>
            </div>
        </div>
        <!-- Banner Area -->

<div style="background-image: url('/Image/bgPage.png'); background-repeat: no-repeat; background-position: center;height:500px;">
    <br />
    <center>
    <div class="panel panel-default" style="width: 300px; height: 300px; top: 100px;">
        <br />
        <asp:Label ID="lblUser" runat="server" Text="Username: "></asp:Label>
        <center>
        <asp:TextBox ID="txtbxUser" runat="server" CssClass="form-control" Width="250px"></asp:TextBox> <br />
        </center>
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
        <center>
        <asp:TextBox ID="txtbxPassword" runat="server" CssClass="form-control" Width="250px" TextMode="Password"></asp:TextBox>
        </center>
        <br />
        <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" CssClass="btn btn-info btn-sm"
            Text="Login" />
        <br />
        <asp:HiddenField ID="hdnMessage" runat="server" 
                ClientIDMode="Static"/>       
    
    </div>
</center>
</div>
    </form>
</body>
</html>
