﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="BookStoreWebForm.WebForm.Forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
       <script  src="../Scripts/WebForms/Timer.js" type="text/javascript" ></script>
    <script  src="../Scripts/WebForms/snackbar.js" type="text/javascript" ></script>
</asp:Content>
<asp:Content ID="Forget" ContentPlaceHolderID="ContentPlaceHolder1" Visible="true" runat="server">

    


    <br />
    <br />
    <div class="container">

            <div class="row" style="margin-top:60px">

                <div class="col-md-4 mx-auto">

                    <div class="card" id="card1" visible="true" runat="server">

                        <div class="card-body" >

                            <div class="row">

                                <div class="col">

                                    <h2 class="text-center text-danger">Forget Password</h2>
                                </div>

                            </div>

                            <hr />

                            <div style="font-size:20px">Enter the e-mail address associated with your Bookstore account. We will email you instructions to reset your password.</div>

                            <br />

                            <div class="row" >

                                 <div class="col-md-9 col-sm-7">

                               <div class="form-group">

                                   <label>Email Address</label>

                                   <asp:TextBox ID="EmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionEmailAddress" ControlToValidate="EmailAddress" runat="server" ErrorMessage="Enter Correct Email" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"></asp:RegularExpressionValidator>

                               </div>

                     </div>
                                <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmailAddress" ControlToValidate="EmailAddress" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>

                            </div>


                            <div class="row" >

                                <div class="col" style="display:flex; justify-content:space-evenly;     margin-top: 13px;">

                                    <asp:Button ID="SubmitButton" runat="server" Text="Send" OnClick="SubmitButton_Click" CssClass="btn btn-outline-danger"  />
                                      <asp:LinkButton ID="Login"  runat="server" style="position: relative;top: 4px;" CausesValidation ="false"  OnClick="Login_Click" >Login</asp:LinkButton>
                                   
         

                                </div>

                                 

                            </div>

                           

                                    
                                    
                                   
         

                              


                           <%-- *****************************************--%>

                             
   

                    </div>

                        

                            

                        

                        

                    </div>

                                    <div class="card" style="height:111%" id="card2" visible="false" runat="server">

                        <div class="card-body" id="Div1"  runat="server">

                            <div class="row" >
                             <br />

                                <div class="col">

                                    <h2 class="text-center text-danger">OTP Verification</h2>

                                    <hr />
                                   


                            <div class="row" >
                                <div class="col">
                            <div style="font-size:20px" id="title"  runat="server">Enter an otp we just send on your email:</div>
                                    </div>
                                </div>
       
        <div class="d-flex flex-row mt-5" id="otpbox" runat="server"> <asp:TextBox ID="One"  Enabled="true" runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Two" Enabled="true" runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Three" Enabled="true" runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Four" Enabled="true" TextMode="Number"  runat="server" CssClass="form-control"></asp:TextBox></div>

                             <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="One" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="Two" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="Three" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="Four" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator> 
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="One" ></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Two"></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Three"></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Four" ></asp:RequiredFieldValidator>
                            
                             
                                 </div>

                          <%--  ****************************************************************--%>


                             
                               


                            <div class="row row-margin-05 " id="buttons" runat="server">
                                

                                <div class="col-md-2 mx-auto">
                                  
                                     <asp:Button ID="Button2" runat="server"  Enabled="true" Text="Resend" CssClass="btn btn-outline-danger" OnClick="Button1_Click"  />

                                </div>

                                 <div class="col-md-2 mx-auto">
                                 <asp:Button ID="VerifyButton" runat="server"  Enabled="true" Text="Verify OTP" CssClass="btn btn-outline-danger" OnClick="Button3_Click"  />
                                     </div>

                            </div>

                        <br />

                             

                    </div>

                            


                            

                            


                           <%-- *****************************************--%>

                             
   

                    </div>

                </div>

            </div>

        </div>
     </div>

    <div class="messagealert" id="alert_container">
            </div>


  


    



</asp:Content>


    



