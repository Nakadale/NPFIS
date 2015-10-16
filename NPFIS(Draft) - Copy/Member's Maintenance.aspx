<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member's Maintenance.aspx.cs" Inherits="NPFIS_Draft_.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div> <asp:Label ID="lblMemberMaintenance" runat="server" Text="Member's Maintance" 
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

        <div></div>
        <div style="width: 898px">
           &nbsp; &nbsp; &nbsp; &nbsp;  <asp:Label ID="lblempid" runat="server" Text="Employee ID:"></asp:Label>&nbsp;&nbsp;<asp:TextBox 
                ID="txtbxempid" runat="server" Width="150px" ></asp:TextBox></div>
    
    <div align="right">
        <asp:Label ID="lblMonthlySalary" runat="server" Text="Monthly Salary:"></asp:Label> &nbsp;
        <asp:TextBox ID="txtbxMonthlySalary"
            runat="server" Width="150px"></asp:TextBox> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        
        
        </div>
        <div>
           &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; <asp:Label ID="lblLastname" runat="server" Text="Last name:"></asp:Label> &nbsp;
         <asp:TextBox ID="txtbxLastname" runat="server" Width="150px"></asp:TextBox>
            
            </div>

            <div align="right"><asp:Label ID="lblPercentageofShare" runat="server" Text="Percentage of Share:"></asp:Label> &nbsp;
            <asp:TextBox ID="txtbxPercentageofShare" runat="server" Width="120px"></asp:TextBox> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            </div>
    
    <div>
      &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; <asp:Label ID="lblFirstname" runat="server" Text="First name:"></asp:Label>
       
        &nbsp; <asp:TextBox ID="txtbxFirstname" Width="150px" runat="server"></asp:TextBox>
    
    </div> <br />
   
    <div>
       &nbsp; &nbsp; &nbsp; &nbsp;  <asp:Label ID="lblMiddlename" runat="server" Text="Middle name:"></asp:Label>
        &nbsp; <asp:TextBox ID="txtbxMidlename" Width="150px" runat="server"></asp:TextBox>
        
        </div> <br />


    <div> 
       
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <asp:Label ID="lblDivision" runat="server" Text="Division:"></asp:Label> &nbsp; <asp:DropDownList
            ID="DropDownList1" Width="150px" runat="server">
        </asp:DropDownList>
     <asp:Button ID="addDivision" runat="server" Width="50px" Text="Add"></asp:Button>

    </div> <br />

    <div>
       &nbsp; &nbsp; &nbsp; &nbsp; <asp:Label ID="lblDateofBirth" runat="server" Text="Date of Birth:"></asp:Label> 
       &nbsp; <asp:TextBox ID="txtbxDateofBirth" Width="150px" runat="server"></asp:TextBox>
        </div> 

        <div align="right"> 
            <asp:Label ID="lvlContactno" runat="server" Text="Contact Number:"></asp:Label>
            <asp:TextBox ID="txtbxContactno" Width="150px" runat="server"></asp:TextBox> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            </div>


        <div>
            <asp:Label ID="lblAddress" runat="server" Text="Permanent Address:"></asp:Label>
            &nbsp; <asp:TextBox ID="txtbxAddress" Width="300px" Height="100px" runat="server"></asp:TextBox>
       </div>

</asp:Content>
