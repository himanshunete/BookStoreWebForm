<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BookStoreWebForm.Registration.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

              <div class="boxRegister">  

                  <div class="title"> Registration </div>

                      <table class="content-centre" >
                <tr>  
                    <td>FirstName:</td> 
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="FirstName" CssClass="inputbox" runat="server"></asp:TextBox> 
                      
                         <asp:RequiredFieldValidator ID="RequiredFieldFirstName" ControlToValidate="FirstName" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
                    </tr>  
                          <tr>
                    <td>  
<asp:RegularExpressionValidator ID="RegularExpressionFirstName" ControlToValidate="FirstName" runat="server" ErrorMessage="Enter Correct First Name" ValidationExpression="^[A-Z][a-z]{3,}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>  
  
               
                <tr>  
                    <td>LastName:</td>  
                    </tr>
                          <tr>
                     <td> <asp:TextBox ID="LastName" CssClass="inputbox" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldLastName" ControlToValidate="LastName" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                               </td>
                    </tr>  
                          <tr>
                    <td>  
<asp:RegularExpressionValidator ID="RegularExpressionLastName" ControlToValidate="LastName" runat="server" ErrorMessage="Enter Correct Last Name" ValidationExpression="^[A-Z][a-z]{3,}$"></asp:RegularExpressionValidator>
                        </td>
                </tr>  
                <tr>  
                    <td>Email Address:</td>  
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="EmailAddress" CssClass="inputbox" runat="server" ></asp:TextBox> 
                             <asp:RequiredFieldValidator ID="RequiredFieldEmailAddress" ControlToValidate="EmailAddress" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                               </td>
                     
                          
                              <tr>
                    <td>  
<asp:RegularExpressionValidator ID="RegularExpressionEmailAddress" ControlToValidate="EmailAddress" runat="server" ErrorMessage="Enter Correct Email" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"></asp:RegularExpressionValidator>
                    </td>  
                </tr>  
               
               
                <tr>  
                    <td>Password:</td>
                    </tr>
                          <tr>
                    <td>  
                      
                          <asp:TextBox ID="Password" CssClass="inputbox" runat="server" TextMode="Password" ></asp:TextBox> 
                      
                             <asp:RequiredFieldValidator ID="RequiredFieldPassword" ControlToValidate="Password" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                        
                               </td>
                    </tr>  
                              <tr>
                          
                    <td>  

<asp:RegularExpressionValidator ID="RegularExpressionPassword" ControlToValidate="Password" runat="server" ErrorMessage="Enter Correct Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>
                    </td>  
                </tr>  
                       
                            <tr>  
                    <td>Confirm Password:</td> 
                                </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="ConfirmPassword" CssClass="inputbox" runat="server" TextMode="Password"></asp:TextBox> 
                      
                          <asp:RequiredFieldValidator ID="RequiredFieldConfirmPassword" ControlToValidate="ConfirmPassword" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                        
                               </td>
                      
                          <tr>
                    <td>  

<asp:RegularExpressionValidator ID="RegularExpressionConfirmPassword" ControlToValidate="ConfirmPassword" runat="server"  ></asp:RegularExpressionValidator>
                        
                    </td>  
                </tr>  
                          <tr>
                              <td>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Password mismatch">
    </asp:CompareValidator>
                              </td>
                          </tr>
                <tr>  
                    <td class="register-last-row">  
                        <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="Button1_Click" />
                        <asp:LinkButton ID="Login" CssClass="login-button" runat="server">Login</asp:LinkButton>
                    </td>  
                </tr>  
            </table> 

                 
          
        </div>  
        
   






</asp:Content>
