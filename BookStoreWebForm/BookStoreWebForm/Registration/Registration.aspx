<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BookStoreWebForm.Registration.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

              <div class="box">  

                  <div class="title"> Registration </div>

                      <table class="content-centre" >
                <tr>  
                    <td>FirstName:</td> 
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="FirstName" CssClass="inputbox" runat="server"></asp:TextBox>  
                    </td>  
  
               </tr>  
                <tr>  
                    <td>LastName:</td>  
                    </tr>
                          <tr>
                     <td> <asp:TextBox ID="LastName" CssClass="inputbox" runat="server"></asp:TextBox></td>  
                </tr>  
                <tr>  
                    <td>Email Address:</td>  
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="EmailAddress" CssClass="inputbox" runat="server" TextMode="Password"></asp:TextBox>  
                    </td>  
                </tr>  
               
               
                <tr>  
                    <td>Password:</td>
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="Password" CssClass="inputbox" runat="server"></asp:TextBox>  
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
                    <td class="last-row">  
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                        <asp:LinkButton ID="Login" CssClass="login-button" runat="server">Login</asp:LinkButton>
                    </td>  
                </tr>  
            </table> 

                 
          
        </div>  
        
   






</asp:Content>
