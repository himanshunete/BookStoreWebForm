<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="BookStoreWebForm.Forget.Forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="boxForget">  

                  <div class="forget-title"> Forget Password </div>

         <div>Enter the e-mail address associated with your Bookstore account. We will email you instructions to reset your password.</div>

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
                              <td>
                                             <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
                              </td>
                          </tr>

               
            </table> 

                 
          
        </div>  

</asp:Content>
