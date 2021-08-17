<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BookStoreWebForm.WebForm.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
      <script  src="../Scripts/WebForms/snackbar.js" type="text/javascript" ></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
  <asp:Label ID="RegistrationMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>

    <div class="container">

            <div class="row">

                <div class="col-md-6 mx-auto">

                    <div class="card">

                        <div class="card-body">

                            <div class="row">

                                <div class="col">

                                    <h2 class="text-center text-danger">Registration</h2>


                                   

                                </div>

                            </div>

                            <hr />

                           <%--  *************************--%>

                            <div class="row">

                                <div class="col-md-10 col-sm-7">

                                <div class="from-group">

                                    <label>First Name</label>

                                    <asp:TextBox ID="FirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="FirstName" runat="server" ErrorMessage="Enter Correct First Name" ForeColor="Red" ValidationExpression="^[A-Z][a-z]{3,}$"></asp:RegularExpressionValidator>

                                </div>

                            </div>

                                 <div class="col">
                                    
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="FirstName" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                         </div>
                                </div>

                                <div class="row">
                                <div class="col-md-10 col-sm-7">

                                <div class="from-group">

                                    <label>Last Name</label>

                                    <asp:TextBox ID="LastName" runat="server" CssClass="form-control"></asp:TextBox>
                                     
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="LastName" runat="server" ErrorMessage="Enter Correct Last Name" ForeColor="Red" ValidationExpression="^[A-Z][a-z]{3,}$"></asp:RegularExpressionValidator>


                                </div>

                            </div>
                                        <div class="col">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="LastName" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                               </div>

                            </div>

                          <%--  *************************************--%>

                            <div class="row">

                                 <div class="col-md-10 col-sm-7">

                               <div class="form-group">

                                   <label>Email Address</label>

                                   <asp:TextBox ID="EmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="EmailAddress" runat="server" ErrorMessage="Enter Correct Email" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"></asp:RegularExpressionValidator>

                               </div>

                     </div>
                                <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="EmailAddress" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>

                            </div>



                           <%-- *****************************************--%>

                             <div class="row">

                        <div class="col-md-10  col-sm-7">

                         <div class="from-group">

                             <label>Password</label>

                             <asp:TextBox ID="Password" runat="server" type="password" CssClass="form-control"></asp:TextBox>
                            
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="Password" runat="server" ErrorMessage="Enter Correct Password" ForeColor="Red" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>


                         </div>



                        </div>
                                 <div class="col">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Password" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                     </div>

                                 </div>

                                 <div class="row">
                        <div class="col-md-10  col-sm-7">



                            <div class="from-group">

                                <label>Confirm Password</label>

                                 &nbsp;<asp:TextBox ID="ConfirmPassword" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                                



                            </div>

                        </div>
                                     
                                        <div class="col">



                            
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ConfirmPassword" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                    
                                         </div>
                                            </div>
                             <div class="row">
                             <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Password mismatch"> </asp:CompareValidator>

                                 </div>

                    </div>

                           



                          <%--  ****************************************************************--%>

                            <div class="row">

                                <div class="col-md-7 mx-auto">

                                    <asp:Button ID="CreateButton" runat="server" Text="Create Account" CssClass="btn btn-outline-danger" OnClick="Button1_Click1"  />

                                </div>

                                 <div class="col-md-2 mx-auto">
                                 <asp:LinkButton ID="Login"  CausesValidation ="false" runat="server" OnClick="Login_Click">Login</asp:LinkButton>
                                     </div>

                            </div>

                        <br />

                    </div>

                </div>

            </div>

        </div>

       <div class="messagealert" id="alert_container">
            </div>


</asp:Content>
