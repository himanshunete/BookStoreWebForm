<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BookStoreWebForm.Registration.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
  <asp:Label ID="RegistrationMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>






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
                      
                          <asp:TextBox ID="ConfirmPassword" CssClass="inputbox" runat="server" TextMode="Password" ></asp:TextBox> 
                      
                             <asp:RequiredFieldValidator ID="RequiredFieldConfirmPassword" ControlToValidate="ConfirmPassword" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                        
                               </td>
                    </tr>  
                              <tr>
                          
                    <td>  

<asp:RegularExpressionValidator ID="RegularExpressionConfirmPassword" ControlToValidate="ConfirmPassword" runat="server" ErrorMessage="Enter Correct Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>
                    </td>  
                </tr>  
                       


                        
                      


                         <%-- <tr>
                              <td>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Password mismatch">
    </asp:CompareValidator>
                              </td>
                          </tr>--%>
                <tr>  
                    <td class="register-last-row">  
                        <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="Button1_Click1"  />
                        <asp:LinkButton ID="Login" CssClass="login-button"  runat="server">Login</asp:LinkButton>
                    </td>  
                </tr>  
            </table> 

                 
          
        </div>  

    <div class="container">

            <div class="row">

                <div class="col-md-6 mx-auto">

                    <div class="card">

                        <div class="card-body">

                            <div class="row">

                                <div class="col">

                                    <h2 class="text-center text-danger">Bookstore</h2>

                                   

                                </div>

                            </div>

                            <hr />

                           <%--  *************************--%>

                            <div class="row">

                                <div class="col-md-5 col-sm-5">

                                <div class="from-group">

                                    <label>First Name</label>

                                    <asp:TextBox ID="FirstNameInput" runat="server" CssClass="form-control"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FirstName" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>

                            </div>

                                 <div class="col">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="FirstNameInput" runat="server" ErrorMessage="Enter Correct First Name" ValidationExpression="^[A-Z][a-z]{3,}$"></asp:RegularExpressionValidator>
                                         </div>
                                </div>

                                <div class="row">
                                <div class="col-md-5 col-sm-5">

                                <div class="from-group">

                                    <label>Last Name</label>

                                    <asp:TextBox ID="LastNameInput" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="LastNameInput" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>


                                </div>

                            </div>
                                        <div class="col">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="LastNameInput" runat="server" ErrorMessage="Enter Correct Last Name" ValidationExpression="^[A-Z][a-z]{3,}$"></asp:RegularExpressionValidator>
                               </div>

                            </div>

                          <%--  *************************************--%>

                            <div class="row">

                                 <div class="col-md-5 col-sm-5">

                               <div class="form-group">

                                   <label>Email Address</label>

                                   <asp:TextBox ID="EmailAddressInput" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="EmailAddressInput" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                               </div>

                     </div>
                                <div class="col">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="EmailAddressInput" runat="server" ErrorMessage="Enter Correct Email" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"></asp:RegularExpressionValidator>
                                    </div>

                            </div>



                           <%-- *****************************************--%>

                             <div class="row">

                        <div class="col-md-5  col-sm-5">

                         <div class="from-group">

                             <label>Password</label>

                             <asp:TextBox ID="PasswordInput" runat="server" CssClass="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="PasswordInput" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>



                         </div>



                        </div>
                                 <div class="col">
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="PasswordInput" runat="server" ErrorMessage="Enter Correct Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>
                                     </div>

                                 </div>

                                 <div class="row">
                        <div class="col-md-5  col-sm-5">



                            <div class="from-group">

                                <label>Confirm Password</label>

                               <asp:TextBox ID="ConfirmPasswordInput" runat="server" CssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ConfirmPasswordInput" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>



                            </div>

                        </div>
                                     
                                     <div class="col">
                                         <label></label>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="ConfirmPasswordInput" runat="server" ErrorMessage="Enter Correct Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>
                                         </div>

                    </div>

                           



                          <%--  ****************************************************************--%>

                                 
                            <br/>
                            <div class="row">

                                <div class="col-md-2 mx-auto">

                                    <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-outline-danger"  />

                                </div>

                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                            </div>

                    </div>

                </div>

            </div>

        </div>

    

</div>
        
   






    </div>
</asp:Content>
