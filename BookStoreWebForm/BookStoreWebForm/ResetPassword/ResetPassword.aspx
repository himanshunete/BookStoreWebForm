<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="BookStoreWebForm.ResetPassword.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="boxLogin">  

                  <div class="reset-title"> Reset Password </div>

                      <table class="content-centre" >
                <tr>  
                    <td>New Password:</td>  
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="NewPassword" CssClass="inputbox" runat="server" TextMode="Password"></asp:TextBox>  

                        
                             <asp:RequiredFieldValidator ID="RequiredFieldPassword" ControlToValidate="NewPassword" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                        
                               </td>
                    </tr>  
                              <tr>
                          
                    <td>  

<asp:RegularExpressionValidator ID="RegularExpressionPassword" ControlToValidate="NewPassword" runat="server" ErrorMessage="Enter Correct Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>
                    </td>  
                </tr>  
               
               
                <tr>  
                    <td>Confirm Password:</td>
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="ConfirmPassword" CssClass="inputbox" runat="server" TextMode="Password"></asp:TextBox>  

                        
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ConfirmPassword" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                        
                               </td>
                    </tr>  
                              <tr>
                          
                    <td>  

<asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="ConfirmPassword" runat="server" ></asp:RegularExpressionValidator>
                    </td>  
                </tr>  

                          
                          <tr>
                              <td>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword" ErrorMessage="Password mismatch">
    </asp:CompareValidator>
                              </td>
                          </tr>

                          <tr>
                              <td class="reset-row">
                                             <asp:Button ID="SubmitButton" runat="server" Text="Reset" OnClick="SubmitButton_Click" />
                              </td>
                          </tr>

             
            </table> 

                 
          
        </div>  


          <asp:Label ID="ResetMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>
        
</asp:Content>
