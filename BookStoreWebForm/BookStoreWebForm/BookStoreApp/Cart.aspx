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
    <div class="Flex1" style="position: relative; bottom: 265px;">
    <div class="container">
        <div class="row" style="margin-top: 19px">
            <div class="col-md-6 mx-auto">
                <div class="card" style="width:41rem">
                    <div class="card-body">

                        <asp:Label ID="Label1" runat="server" Text="My Cart"></asp:Label>

                         <asp:Repeater ID="RepeatInformation"     runat="server" OnItemCommand="RepeatInformation_ItemCommand">  
           <ItemTemplate> 



                          <div class="card cardFlex " style="display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 36px; border: 0px solid rgba(0,0,0,.125);"  >
                    <div class="backgroundColor">
                     <asp:Image ID="Image1" ImageUrl="~/assets/220px-The_Overstory_(Powers_novel).png" CssClass="BookImage" style="width: 109px;" runat="server" />
                        </div>
                     <asp:Label ID="BookId" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.BookId")%>' Visible = "false" />
  <div class="card-body ">
    <h5 class="card-title" ><%#DataBinder.Eval(Container,"DataItem.Name")%></h5>
    <p class="card-author" ><%#DataBinder.Eval(Container,"DataItem.AuthorName")%></p>
    <p class="card-price" >Rs. <%#DataBinder.Eval(Container,"DataItem.Price")%></p>
  </div>  
                    
                    </div>

               <div>
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


                 </ItemTemplate> 
         </asp:Repeater>


                        
                        </div>

                        <div>
                             <asp:Button ID="PlaceOrder" runat="server" Text="PLACE ORDER" CommandName="addedToCart"   style="position: relative; left: 487px;"   CssClass="btn btn-primary "  />
                        </div>

                        
                        

                        

                        
                    </div>

                    <%--  ****************************************************************--%>

                    
                    
                
            </div>
        </div>
    </div>
        </div>

    

</asp:Content>
