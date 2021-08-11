<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="BookStoreWebForm.Forget.Forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
</asp:Content>
<asp:Content ID="Forget" ContentPlaceHolderID="ContentPlaceHolder1" Visible="true" runat="server">

     <asp:Label ID="ForgetMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>

     <div class="boxForget">  

                  <div class="forget-title"> Forget Password </div>

         <div>Enter the e-mail address associated with your Bookstore account. We will email you instructions to reset your password.</div>

                      <table class="content-centre" >
                <tr>  
                    <td>Email Address:</td>  
                    </tr>
                          <tr>
                    <td>  
                        <asp:TextBox ID="EmailAddress" CssClass="inputbox" Text="email address" runat="server" ></asp:TextBox>  
                               <asp:RequiredFieldValidator ID="RequiredFieldEmailAddress" ControlToValidate="EmailAddress" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    
                               </td>
                     
                          
                              <tr>
                    <td>  
<asp:RegularExpressionValidator ID="RegularExpressionEmailAddress" ControlToValidate="EmailAddress" runat="server" ErrorMessage="Enter Correct Email" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"></asp:RegularExpressionValidator>

                    </td>  
                </tr>  
               
               
                

                          <tr>
                              <td>
                                             <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                              </td>
                          </tr>

               
            </table> 

                 
          
         

                              <div class="row">

                                <div class="col">

                                    <h2 class="text-center text-danger">OTP Verification</h2>


                                   


                            <div class="row">
                            <div style="font-size:20px">Enter an otp we just send on your email</div>
                                </div>
       
        <div class="d-flex flex-row mt-5"> <asp:TextBox ID="One"  runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Two" runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Three" runat="server" TextMode="Number"  CssClass="form-control"></asp:TextBox> <asp:TextBox ID="Four" TextMode="Number"  runat="server" CssClass="form-control"></asp:TextBox></div>

                             <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="One" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="Two" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="Three" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="Four" ValidationExpression = "^[0-9]{1}$" ></asp:RegularExpressionValidator> 
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="One" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Two" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Three" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Four" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            
                             
                                 </div>

                          <%--  ****************************************************************--%>



                            <div class="row">

                                <div class="col-md-2 mx-auto">
                                  
                                     <asp:Button ID="Button2" runat="server" Text="Resend" CssClass="btn btn-outline-danger"  />

                                </div>

                                 <div class="col-md-2 mx-auto">
                                 <asp:Button ID="Button3" runat="server" Text="Verify OTP" CssClass="btn btn-outline-danger" OnClick="Button3_Click"  />
                                     </div>

                            </div>

                        <br />

                    </div>
          </div>

              

        <asp:Label ID="OtpMessage" CssClass="alert" runat="server" Text="Hello" Visible="false"></asp:Label>
        


</asp:Content>


    



