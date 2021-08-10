<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookStoreWebForm.Login.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="boxLogin">  

                <asp:Label ID="LoginMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>


                  <div class="title"> Login </div>

                      <table class="content-centre" >
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
                        <asp:TextBox ID="Password" CssClass="inputbox" runat="server" TextMode="Password"></asp:TextBox>  

                        
                             <asp:RequiredFieldValidator ID="RequiredFieldPassword" ControlToValidate="Password" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                        
                               </td>
                    </tr>  
                              <tr>
                          
                    <td>  

<asp:RegularExpressionValidator ID="RegularExpressionPassword" ControlToValidate="Password" runat="server" ErrorMessage="Enter Correct Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>
                    </td>  
                </tr>  

                          <tr>
                              <td>
                                  <asp:LinkButton ID="ForgetPassword" CssClass="forget-button" runat="server">ForgetPassword</asp:LinkButton>
                              </td>
                          </tr>

                <tr>  
                    <td class="last-row">  
                        <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
                        <asp:LinkButton ID="CreateButton" CssClass="register-button" runat="server" OnClick="CreateButton_Click">Create Account</asp:LinkButton>
                    </td>  
                </tr>  
            </table> 

                 
          
        </div>  
        
</asp:Content>
