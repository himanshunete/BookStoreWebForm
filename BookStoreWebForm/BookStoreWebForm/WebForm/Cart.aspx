<%@ Page Title="" Language="C#" MasterPageFile="~/BookstoreHomePage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BookStoreWebForm.WebForm.Cart" %>

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

    <div class="Flex1">
        <div class="container">
            <div class="row" style="margin-top: 19px">
                <div class="col-md-6 mx-auto">

                    <div class="card firstCard">
                        <div class="card-body">
                            <asp:Label ID="Label1" runat="server" Style="margin-left: 21px" Text="My Cart"></asp:Label>
                            <asp:Repeater ID="RepeatInformation" runat="server" OnItemCommand="RepeatInformation_ItemCommand">

                                <ItemTemplate>
                                    <div class="card cardFlex1 repeatControlFirstCard">
                                        <div class="backgroundColor1">
                                            <asp:Image ID="Image1" ImageUrl="~/assets/220px-The_Overstory_(Powers_novel).png" CssClass="BookImage1" Style="width: 109px;" runat="server" />
                                        </div>
                                        <asp:Label ID="BookId" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.BookId")%>' Visible="false" />
                                        <asp:Label ID="CartId" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.CartId")%>' Visible="false" />
                                        <div class="card-body ">
                                            <h5 class="card-title"><%#DataBinder.Eval(Container,"DataItem.Name")%></h5>
                                            <p class="card-author"><%#DataBinder.Eval(Container,"DataItem.AuthorName")%></p>
                                            <p class="card-price">Rs. <%#DataBinder.Eval(Container,"DataItem.Price")%></p>
                                        </div>
                                    </div>

                                    <div class="plus_minus">
                                        <div class="plus_minus1">
                                            <asp:Button ID="Minus" runat="server" class="minus" Text="-" CommandName="minus" />
                                            <asp:TextBox ID="Count" Style="width: 40px; text-align: center" CommandName="plus_minus" Text='<%#DataBinder.Eval(Container,"DataItem.Count")%>' Enabled='true' runat="server"></asp:TextBox>
                                            <asp:Button ID="Plus" runat="server" class="plus" Text="+" CommandName="plus" />
                                        </div>
                                        <asp:Button ID="Remove" runat="server" Text="Remove" CommandName="removeBookFromCart" CssClass="btn remove" />
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div style="margin-bottom: 19px;">
                            <asp:Button ID="PlaceOrder" runat="server" Text="PLACE ORDER" Visible="true" CssClass="btn btn-primary placeOrder" OnClick="Button3_Click" />
                        </div>
                    </div>


                    <div class="card secondCard">
                        <div class="card-body">
                            <div class="customer_edit">
                                <asp:Label ID="Label2" runat="server" Text="Customer Details"></asp:Label>
                                <asp:Button ID="Edit" runat="server" Text="Edit" Visible="false" CssClass="btn" />
                            </div>

                            <div class="card" id="customer" style="border: white" visible="false" runat="server">
                                <div class="card-body">
                                    <div style="display: flex">
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

                                    <div class="pincode_locality">
                                        <div class="col-md-5 col-sm-7">
                                            <div class="from-group">
                                                <asp:TextBox ID="PinCode" placeholder="Pincode" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                            <div class="from-group">
                                                <asp:TextBox ID="Locality" placeholder="Locality" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="address">
                                        <div class="col-md-1 col-sm-7">
                                            <div class="from-group">
                                                <asp:TextBox ID="Address" placeholder="Address" runat="server" CssClass="form-control Address"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="city_landmark">
                                        <div class="col-md-5 col-sm-7">
                                            <div class="from-group">
                                                <asp:TextBox ID="City" placeholder="city/town" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                            <div class="from-group">
                                                <asp:TextBox ID="Landmark" placeholder="Landmark" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="type">
                                        <asp:Label ID="Type" runat="server" Text="Type"></asp:Label>
                                    </div>

                                    <div class="radio">
                                        <div class="col-md-5 col-sm-7">
                                            <div class="from-group">
                                                <asp:RadioButton ID="Home" runat="server" />

                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-7">
                                            <div class="from-group">
                                                <asp:Label ID="Label4" class="radioLabel1" runat="server" Text="Home"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                            <div class="from-group">
                                                <asp:RadioButton ID="Work" class="radio1" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-7">
                                            <div class="from-group">
                                                <asp:Label ID="Label5" runat="server" Text="Work" class="radioLabel2"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-7" style="margin-left: 10px;">
                                            <div class="from-group">
                                                <asp:RadioButton ID="Other" class="radio2" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-7">
                                            <div class="from-group">
                                                <asp:Label ID="Label6" runat="server" class="radioLabel3" Text="Other"></asp:Label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                            </div>

                        </div>
                        <div style="margin-bottom: 19px;">
                            <asp:Button ID="Continue" runat="server" Text="CONTINUE" CommandName="addedToCart" Visible="true" Style="position: relative; left: 487px; width: 154px;" CssClass="btn btn-primary " OnClick="Button1_Click" />
                        </div>
                    </div>


                    <div class="card thirdCard">
                        <div class="card-body">
                            <asp:Label ID="Label3" runat="server" Style="margin-left: 21px" Text="Order Summary"></asp:Label>
                            <asp:Repeater ID="Repeater1" Visible="false" runat="server">
                                <ItemTemplate>

                                    <div class="card cardFlex1 repeatControlOrder" visible="false">
                                        <div class="backgroundColor1">
                                            <asp:Image ID="Image2" ImageUrl="~/assets/220px-The_Overstory_(Powers_novel).png" CssClass="BookImage1" Style="width: 109px;" runat="server" />
                                        </div>
                                        <asp:Label ID="BookId1" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.BookId")%>' Visible="false" />
                                        <asp:Label ID="CartId1" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.CartId")%>' Visible="false" />
                                        <asp:Label ID="Count" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Count")%>' Visible="false" />
                                        <div class="card-body ">
                                            <h5 class="card-title"><%#DataBinder.Eval(Container,"DataItem.Name")%></h5>
                                            <p class="card-author"><%#DataBinder.Eval(Container,"DataItem.AuthorName")%></p>
                                            <p class="card-price">Rs. <%#DataBinder.Eval(Container,"DataItem.Price")%></p>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div style="margin-bottom: 19px;">
                            <asp:Button ID="Button2" runat="server" Text="CHECKOUT" class="checkout" CssClass="btn btn-primary " OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
