<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="BookStoreWebForm.WebForm.Forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Forget" ContentPlaceHolderID="ContentPlaceHolder1" Visible="true" runat="server">

     <asp:Label ID="ForgetMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>


    <br />
    <br />
    <div class="container">

            <div class="row">

                <div class="col-md-6 mx-auto">

                    <div class="card">

                        <div class="card-body">

                            <div class="row">

                                <div class="col">

                                    <h2 class="text-center text-danger">Forget Password</h2>

                                     <div style="font-size:20px">Enter the e-mail address associated with your Bookstore account. We will email you instructions to reset your password.</div>


                                   

                                </div>

                            </div>

                            <hr />

                            <div class="row">

                                 <div class="col-md-7 col-sm-7">

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



                           <%-- *****************************************--%>

                             
   

                    </div>

                        

                            <div class="row">

                                <div class="col-md-2 mx-auto">

                                    <asp:Button ID="SubmitButton" runat="server" Text="Login" OnClick="SubmitButton_Click" CssClass="btn btn-outline-danger"  />
                                   
         

                                </div>

                                 

                            </div>

                       


                        <div class="row">
                             <br />

                                <div class="col">

                                    <h2 class="text-center text-danger">OTP Verification</h2>


                                   


                            <div class="row">
                                <div class="col">
                            <div style="font-size:20px">Enter an otp we just send on your email</div>
                                    </div>
                                </div>
       
        <div class="d-flex flex-row mt-5"> <asp:TextBox ID="One"  runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Two" runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Three" runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Four" TextMode="Number"  runat="server" CssClass="form-control"></asp:TextBox></div>

                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="One" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Two" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Three" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Four" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator> 
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="One" ></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Two"></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Three"></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Four" ></asp:RequiredFieldValidator>
                            
                             
                                 </div>

                          <%--  ****************************************************************--%>


                            



                            <div class="row">
                                <br />

                                <div class="col-md-2 mx-auto">
                                  
                                     <asp:Button ID="Button1" runat="server" Text="Resend" CssClass="btn btn-outline-danger"  />

                                </div>

                                 <div class="col-md-2 mx-auto">
                                 <asp:Button ID="Button4" runat="server" Text="Verify OTP" CssClass="btn btn-outline-danger" OnClick="Button3_Click"  />
                                     </div>

                            </div>

                        <br />

                             <div class="row">
                                <br />

                            <div class="col-md-2 ">
                                  
                                     <asp:LinkButton ID="ResetButton"  runat="server" OnClick="ResetButton_Click" >Reset Password</asp:LinkButton>

                                </div>

                                 </div>

                    </div>


                        <br />

                    </div>

                </div>

            </div>

        </div>

     <asp:Label ID="OtpMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>




    

        

                       

                 
          
         

                              
          

              

       
        


</asp:Content>


    



