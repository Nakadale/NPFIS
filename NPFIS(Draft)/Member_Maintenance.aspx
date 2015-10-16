<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member_Maintenance.aspx.cs" Inherits="NPFIS_Draft_.Member_Maintenance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="panel panel-default panel-body">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div> </div>
    <div align="right">
        <asp:Button ID="btnNew" runat="server" Text="New" Height="25px" Width="75px" 
            onclick="btnNew_Click" Visible="False" />  &nbsp;
        <asp:Button ID="btnEdit" runat="server" Text="Edit" Height="25px" 
            Width="75px" onclick="btnEdit_Click" Visible="False" />  &nbsp;
        <asp:Button ID="btnSave" runat="server" Text="Save" 
            Width="75px" onclick="btnSave_Click" 
            OnClientClick='return confirm("Are you sure you want to Save?");' 
            CssClass="btn btn-info btn-sm" ValidationGroup="MMSave" />  &nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="25px" 
            Width="75px" onclick="btnCancel_Click" Visible="False" />  &nbsp;
        <asp:Button ID="btnBrowse" runat="server" Text="Browse" 
            Width="75px" onclick="btnBrowse_Click" CssClass="btn btn-info btn-sm" />  &nbsp;
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Height="25px" 
            Width="75px" Visible="False" onclick="btnDelete_Click" />  &nbsp;  &nbsp;  &nbsp; 
        </div>

        <div> <asp:HiddenField ID="hdnMessage" runat="server" ClientIDMode="Static"/>       </div>
       
       <div class="row" style="width: 700px">
        <div style="width: 898px">
           
           <div class="col-lg-4">
            <asp:Label ID="lblempid" runat="server" Text="Employee ID:"></asp:Label>&nbsp;
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                   ControlToValidate="txtbxempid" ErrorMessage="Please enter Employee ID" 
                   Font-Size="Large" ForeColor="Red" ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
               &nbsp; &nbsp;<asp:TextBox 
                ID="txtbxempid" runat="server" Width="150px" CssClass="form-control" ></asp:TextBox>
    
    <div>
        &nbsp;
                
        </div>
        <div>
          <asp:Label ID="lblLastname" runat="server" Text="Last name:"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtbxLastname" ErrorMessage="Please enter Lastname" 
                Font-Size="Large" ForeColor="Red" ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
         <asp:TextBox ID="txtbxLastname" runat="server" Width="250px" 
                CssClass="form-control"></asp:TextBox>
            
            </div>
            
    <div>
      <asp:Label ID="lblFirstname" runat="server" Text="First name:"></asp:Label>
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtbxFirstname" ErrorMessage="RequiredFieldValidator" 
            Font-Size="Large" ForeColor="Red" ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
       
       <asp:TextBox ID="txtbxFirstname" Width="250px" runat="server" 
            CssClass="form-control"></asp:TextBox>
    
    </div> <br />

    <div >
       <asp:Label ID="lblMiddlename" runat="server" Text="Middle name:"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txtbxMidlename" ErrorMessage="Please enter Middlename" 
            Font-Size="Large" ForeColor="Red" ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txtbxMidlename" Width="250px" runat="server" 
            CssClass="form-control"></asp:TextBox>
        
        </div> <br />


    <div>  
       
    <asp:Label ID="lvlContactno" runat="server" Text="Contact Number:"></asp:Label> &nbsp;<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtbxContactno" 
            ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red" 
            ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtbxContactno" Width="150px" runat="server" 
            CssClass="form-control"></asp:TextBox>

    </div> <br />

    <div>
       <asp:Label ID="lblDateofBirth" runat="server" Text="Date of Birth:"></asp:Label> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="txtbxDateofBirth" ErrorMessage="Please enter Date of birth" 
            Font-Size="Large" ForeColor="Red" ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
       <asp:TextBox ID="txtbxDateofBirth" Width="150px" runat="server" 
            CssClass="form-control" Height="22px"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="txtbxDateofBirth_CalendarExtender" 
            runat="server" TargetControlID="txtbxDateofBirth" />
        <asp:Label ID="Label1" runat="server" Text="mm/dd/yyyy"></asp:Label>
        </div> <br />

        <div > 
            
            
   <asp:Label ID="lblDivision" runat="server" Text="Division:"></asp:Label> &nbsp; 
        <asp:DropDownList
            ID="ddlDivision" runat="server" EnableViewState="true" 
                CssClass="btn btn-primary dropdown-toggle">
        </asp:DropDownList>
            </div> <br />
            </div>

        <div>
            <asp:Label ID="lblAddress" runat="server" Text="Permanent Address:"></asp:Label>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtbxAddress" ErrorMessage="RequiredFieldValidator" 
                Font-Size="Large" ForeColor="Red" ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtbxAddress" Width="300px" Height="100px" 
                runat="server" CssClass="form-control"></asp:TextBox>
           
           
           <div class="col-lg-4">
   
            <div align="right">
                <asp:Label ID="lblMonthlySalary" runat="server" Text="Monthly Salary:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtbxMonthlySalary" 
                    ErrorMessage="Please enter Monthly Salary" Font-Size="Large" 
                    ForeColor="Red" ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtbxMonthlySalary" runat="server" CssClass="form-control" 
                    Width="150px"></asp:TextBox>
                <asp:Label ID="lblPercentageofShare" runat="server" Text="Percentage of Share:"></asp:Label>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtbxPercentageofShare" 
                    ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red" 
                    ValidationGroup="MMSave">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtbxPercentageofShare" runat="server" 
                    CssClass="form-control" Width="120px"></asp:TextBox>
            </div>
            </div>

 
            <br />
       </div>
       </div>
   
    </ContentTemplate>
         </asp:UpdatePanel>

</div>

</asp:Content>
