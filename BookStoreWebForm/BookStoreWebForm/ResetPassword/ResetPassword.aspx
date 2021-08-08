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
                    </td>  
                </tr>  
               
               
                <tr>  
                    <td>Confirm Password:</td>
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="ConfirmPassword" CssClass="inputbox" runat="server"></asp:TextBox>  
                    </td>  
                </tr>  

                          <tr>
                              <td class="reset-row">
                                             <asp:Button ID="SubmitButton" runat="server" Text="Reset" />
                              </td>
                          </tr>

             
            </table> 

                 
          
        </div>  
</asp:Content>
