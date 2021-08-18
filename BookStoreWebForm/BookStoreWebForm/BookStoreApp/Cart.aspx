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

                        <asp:Label ID="Label1" runat="server" style="margin-left:21px" Text="My Cart"></asp:Label>

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
                             <asp:Button ID="PlaceOrder" runat="server" Text="PLACE ORDER"  Visible="true"  style="position: relative; left: 487px; width: 154px;"   CssClass="btn btn-primary " OnClick="Button3_Click" />
                        </div>

                        
                        

                        

                        
                    </div>

                <div class="card" style="width: 42rem;display: flex; margin-bottom: 21px;">
                    <div class="card-body">

                        <div style="display:flex;    justify-content: space-between;   margin-left: 21px;">
                        <asp:Label ID="Label2" runat="server" Text="Customer Details"></asp:Label>
                         <asp:Button ID="Edit" runat="server" Text="Edit" Visible="false"  CssClass="btn" />
                         </div>


                        <div class="card" id="customer"  style="border:white" visible="false" runat="server">
                    <div class="card-body">

                        <%--  *************************--%>
                        <div style="display:flex">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="FirstName" placeholder="Name" Text="" runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                    <asp:TextBox ID="PhoneNumber" placeholder="Phone number" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            
                        </div>

                        <div style="display:flex ; display: flex;
    margin-top: 10px;">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="PinCode" placeholder="Pincode"  runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                    <asp:TextBox ID="Locality" placeholder="Locality" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            
                        </div>
                        <%--  *************************************--%>
                        <div style="display:flex; display: flex;
    margin-top: 10px;">

                            <div class="col-md-1 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="Address" placeholder="Address" style="height: 83px; width: 515px;" runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            
                        </div>
                        <%-- *****************************************--%>
                        <div style="display:flex; display: flex;
    margin-top: 10px;">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:TextBox ID="City" placeholder="city/town"  runat="server" CssClass="form-control"></asp:TextBox>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                    <asp:TextBox ID="Landmark" placeholder="Landmark" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            
                        </div>

                        <div style="display:flex; display: flex;
    margin-top: 14px;">

                          
                                     <asp:Label ID="Type" runat="server" Text="Type"></asp:Label>
                                 
                                </div>
                           
                         

                            
                        

                        <div style="display:flex; display: flex;
    margin-top: 10px; margin-left :3px">

                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:RadioButton ID="Home" runat="server" />
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:Label ID="Label4" style="    position: relative; right: 215px;" runat ="server" Text="Home"></asp:Label>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                 <asp:RadioButton ID="Work"  style =" position: relative; right: 333px;" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                    <asp:Label ID="Label5" runat="server" Text="Work" style =" position: relative; right: 555px;" ></asp:Label>
                                 
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                <div class="from-group">
                                 <asp:RadioButton ID="Other" style="position: relative; right: 684px" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-7">
                                <div class="from-group">
                                     <asp:Label ID="Label6" runat="server" style="position: relative; right: 908px"  Text="Other"></asp:Label>
                                 
                                </div>
                            </div>

                            
                        </div>

                        
                    </div>

                    <%--  ****************************************************************--%>

                    
                    <br />
                </div>

                         


                        
                        </div>

                        <div style="    margin-bottom: 19px;">
                             <asp:Button ID="Continue" runat="server" Text="CONTINUE" CommandName="addedToCart"  Visible="true" style="position: relative; left: 487px; width: 154px;"   CssClass="btn btn-primary " OnClick="Button1_Click"  />
                        </div>

                        
                        

                        

                        
                    </div>

                
                
                
                <div class="card" style="width: 42rem;display: flex; margin-bottom: 21px;">
                    <div class="card-body">

                        <asp:Label ID="Label3" runat="server" style="margin-left:21px" Text="Order Summary"></asp:Label>

                         <asp:Repeater ID="Repeater1"     runat="server" >  
           <ItemTemplate> 

               

                          <div class="card cardFlex1 " style="display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 36px; border: 0px solid rgba(0,0,0,.125);"  >
                    <div class="backgroundColor1">
                     <asp:Image ID="Image2" ImageUrl="~/assets/220px-The_Overstory_(Powers_novel).png" CssClass="BookImage1" style="width: 109px;" runat="server" />
                        </div>
                     <asp:Label ID="BookId1" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.BookId")%>' Visible = "false" />
                               <asp:Label ID="CartId1" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.CartId")%>' Visible = "false" />
  <div class="card-body ">
    <h5 class="card-title" ><%#DataBinder.Eval(Container,"DataItem.Name")%></h5>
    <p class="card-author" ><%#DataBinder.Eval(Container,"DataItem.AuthorName")%></p>
    <p class="card-price" >Rs. <%#DataBinder.Eval(Container,"DataItem.Price")%></p>
  </div>  
                    
                    </div>
               


                 </ItemTemplate> 
         </asp:Repeater>


                        
                        </div>

                        <div style="    margin-bottom: 19px;">
                             <asp:Button ID="Button2" runat="server" Text="CHECKOUT"    style="position: relative; left: 487px; width: 154px;"   CssClass="btn btn-primary " OnClick="Button2_Click"  />
                        </div>

                        
                        

                        

                        
                    </div>



                    <%--  ****************************************************************--%>

                    
                    
                
            </div>
        </div>
    </div>
        </div>

    

</asp:Content>
