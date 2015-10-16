<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Members_Amortization.aspx.cs" Inherits="NPFIS_Draft_.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <br />
        <div>
            <div style="width: 20%; float: left">
                <asp:Label ID="Label1" runat="server" Text="Member: "></asp:Label>
            </div>
            <div style="float: left; width: 49%">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="326px"></asp:DropDownList>
            </div>
            <div style="width: 30%; float: left"></div>
        </div>
        <div>
            <div style="width: 20%; float: left">
                <asp:Label ID="Label2" runat="server" Text="Transaction Code: "></asp:Label>
            </div>
            <div style="float: left; width: 49%">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" Width="326px"></asp:DropDownList>
            </div>
            <div style="width: 30%; float: left"></div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Button1" runat="server" Text="     Preview     " />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Button ID="Button2" runat="server" Text="    Print    " />
        </div>
    </div>
</asp:Content>
