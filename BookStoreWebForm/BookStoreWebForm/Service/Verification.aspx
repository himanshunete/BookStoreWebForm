<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Verification.aspx.cs" Inherits="BookStoreWebForm.Service.Verification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <br />
    <br />
     <div class="container">

            <div class="row">

                <div class="col-md-6 mx-auto">

                    <div class="card">

                        <div class="card-body">
                              <div class="row">

                                <div class="col">

                                    <h2 class="text-center text-danger">OTP Verification</h2>


                                   

                                </div>

                            </div>

                            <hr />

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
                                 <asp:Button ID="Button3" runat="server" Text="Verify OTP" CssClass="btn btn-outline-danger"  />
                                     </div>

                            </div>

                        <br />

                    </div>

                </div>

            </div>

        </div>

 
</asp:Content>
