<%@ Page Title="" Language="C#" MasterPageFile="~/BookstoreHomePage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BookStoreWebForm.BookStoreApp.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script  src="../Scripts/WebForms/snack.js" type="text/javascript"></script>
    <link  type="text/css" rel="stylesheet" href="../CSS/Bookstore.css" />
    <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
     <script  src="../Scripts/WebForms/snackbar.js" type="text/javascript" ></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Flex1" >
    <div class="container">
        <div class="row" style="margin-top: 19px">
            <div class="col-md-6 mx-auto">
                <div class="card" style="width: 42rem;display: flex; margin-bottom: 21px;">
                    <div class="card-body">

                        <asp:Label ID="Label1" runat="server" Text="My Cart"></asp:Label>

                         <asp:Repeater ID="RepeatInformation"     runat="server" OnItemCommand="RepeatInformation_ItemCommand">  
           <ItemTemplate> 



                          <div class="card cardFlex1 " style="display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 36px; border: 0px solid rgba(0,0,0,.125);"  >
                    <div class="backgroundColor1">
                     <asp:Image ID="Image1" ImageUrl="~/assets/220px-The_Overstory_(Powers_novel).png" CssClass="BookImage1" style="width: 109px;" runat="server" />
                        </div>
                     <asp:Label ID="BookId" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.BookId")%>' Visible = "false" />
                               <asp:Label ID="CartId" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.CartId")%>' Visible = "false" />
  <div class="card-body ">
    <h5 class="card-title" ><%#DataBinder.Eval(Container,"DataItem.Name")%></h5>
    <p class="card-author" ><%#DataBinder.Eval(Container,"DataItem.AuthorName")%></p>
    <p class="card-price" >Rs. <%#DataBinder.Eval(Container,"DataItem.Price")%></p>
  </div>  
                    
                    </div>
               <div style="display: flex;
    justify-content: center;
    /* position: relative; */
    /* top: 41px; */
    margin-left: 67px;
    margin-top: -23px;">
               <div  style="display: flex;
    justify-content: center;
    position: relative;
    right: 91px;">
    <asp:Button ID="Minus" runat="server" style="border-radius: 50%;
    /* background-color: #4F81BD; */
    color: black;
    /* text-align: center; */
    font-family: arial, helvetica, sans-serif;
    font-weight: bold;
    width: 28px;
    height: -3px;
    /* position: absolute; */
    /* top: 6px; */
    padding-right: -10px;" Text="-" CommandName="minus" />



                        
                        
                                               
                        <asp:TextBox ID="TextBox1" style="width:40px; text-align:center" CommandName="plus_minus"  Text="1" runat="server"></asp:TextBox>
                        <asp:Button ID="Plus" runat="server" style="border-radius: 50%;
    /* background-color: #4F81BD; */
    color: black;
    /* text-align: center; */
    font-family: arial, helvetica, sans-serif;
    font-weight: bold;
    width: 28px;
    height: -3px;
    /* position: absolute; */
    /* top: 6px; */
    padding-right: -10px;" Text="+"   CommandName="plus" />
                   </div>

                   <asp:Button ID="Remove" runat="server" Text="Remove" CommandName="removeBookFromCart" style="position: relative;
    right: 58px;
    font-size: 19px;" CssClass="btn" />
        </div>


                 </ItemTemplate> 
         </asp:Repeater>


                        
                        </div>

                        <div style="    margin-bottom: 19px;">
                             <asp:Button ID="PlaceOrder" runat="server" Text="PLACE ORDER" CommandName="addedToCart"   style="position: relative; left: 487px; width: 154px;"   CssClass="btn btn-primary "  />
                        </div>

                        
                        

                        

                        
                    </div>

                <div class="card" style="width: 42rem;display: flex; margin-bottom: 21px;">
                    <div class="card-body">

                        <asp:Label ID="Label2" runat="server" Text="Customer Details"></asp:Label>


                        <div class="card">
                    <div class="card-body">

                        <%--  *************************--%>
                        <div style="display:flex">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="FirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                    <asp:TextBox ID="PhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            
                        </div>

                        <div style="display:flex">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="PinCode" runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                    <asp:TextBox ID="Locality" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            
                        </div>
                        <%--  *************************************--%>
                        <div style="display:flex">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="Address" runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            
                        </div>
                        <%-- *****************************************--%>
                        <div style="display:flex">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="City" runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                    <asp:TextBox ID="Town" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
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
                            <asp:Button ID="CreateButton" runat="server" Text="Create Account" CssClass="btn btn-outline-danger"  />
                        </div>

                        <div class="col-md-2 mx-auto">
                            <asp:LinkButton ID="Login" CausesValidation="false" runat="server" >Login</asp:LinkButton>
                        </div>
                    </div>
                    <br />
                </div>

                         


                        
                        </div>

                        <div style="    margin-bottom: 19px;">
                             <asp:Button ID="Button1" runat="server" Text="CONTINUE" CommandName="addedToCart"   style="position: relative; left: 487px; width: 154px;"   CssClass="btn btn-primary "  />
                        </div>

                        
                        

                        

                        
                    </div>

                <div class="card" style="width: 42rem;display: flex; margin-bottom: 21px;">
                    <div class="card-body">

                        <asp:Label ID="Label3" runat="server" Text="Order Summary"></asp:Label>

                         


                        
                        </div>

                        <div style="    margin-bottom: 19px;">
                             <asp:Button ID="Button2" runat="server" Text="CHECKOUT" CommandName="addedToCart"   style="position: relative; left: 487px; width: 154px;"   CssClass="btn btn-primary "  />
                        </div>

                        
                        

                        

                        
                    </div>



                    <%--  ****************************************************************--%>

                    
                    
                
            </div>
        </div>
    </div>
        </div>

    

</asp:Content>
