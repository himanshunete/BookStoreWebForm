<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="BookStoreWebForm.WebForm.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
      <script  src="../Scripts/WebForms/snackbar.js" type="text/javascript" ></script>
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

                                    <h2 class="text-center text-danger">Reset Password</h2>


                                   

                                </div>

                            </div>

                            <hr />

                            



                           <%-- *****************************************--%>

                             <div class="row">

                        <div class="col-md-7  col-sm-7">

                         <div class="from-group">

                             <label>New Password</label>

                             <asp:TextBox ID="NewPassword" runat="server" CssClass="form-control"></asp:TextBox>
                            
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="NewPassword" runat="server" ErrorMessage="Enter Correct Password" ForeColor="Red" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>


                         </div>



                        </div>
                                 <div class="col">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="NewPassword" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                     </div>

                                 </div>


                            <div class="row">

                        <div class="col-md-7  col-sm-7">

                         <div class="from-group">

                             <label>Confirm Password</label>

                             <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control"></asp:TextBox>
                            
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="ConfirmPassword" runat="server" ErrorMessage="Enter Correct Password" ForeColor="Red" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>


                         </div>



                        </div>
                                 <div class="col">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ConfirmPassword" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                     </div>

                                 </div>
   

                    </div>

                          <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword" ErrorMessage="Password mismatch">
    </asp:CompareValidator>
                        

                            <div class="row">

                                <div class="col-md-2 mx-auto">

                                    <asp:Button ID="SubmitButton" runat="server" Text="Reset"  OnClick="SubmitButton_Click" CssClass="btn btn-outline-danger"  />
                                   
         

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
