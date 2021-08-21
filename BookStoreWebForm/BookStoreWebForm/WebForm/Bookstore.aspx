<%@ Page Title="" Language="C#" MasterPageFile="~/BookstoreHomePage.Master" AutoEventWireup="true" CodeBehind="Bookstore.aspx.cs" Inherits="BookStoreWebForm.WebForm.Bookstore" %>

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

    <div class="bookcount">
        <asp:Label ID="Book" runat="server" Style="font-size: 30px" Text="Books"></asp:Label>
        <asp:Label ID="BookCount" runat="server" CssClass="BookCount" Text="items"></asp:Label>
    </div>

    <div class="Flex">
        <asp:Repeater ID="RepeatInformation" runat="server" OnItemCommand="RepeatInformation_ItemCommand">
            <ItemTemplate>
                <div class="card cardFlex cards" <%--data-toggle="tooltip" data-placement="right" data-container="body"--%> data-mdb-toggle="tooltip hover" title="<%#DataBinder.Eval(Container,"DataItem.Description")%>">
                    <div class="backgroundColor">
                        <asp:Image ID="Image1" ImageUrl="~/assets/220px-The_Overstory_(Powers_novel).png" CssClass="BookImage" runat="server" />
                        <asp:Label ID="Label1" runat="server" Text="OUT OF STOCK" CssClass="stock other" Visible='<%# Convert.ToInt32(DataBinder.Eval(Container,"DataItem.Count")) <= 0 ? true : false %>'></asp:Label>
                    </div>

                    <asp:Label ID="BookId" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.BookId")%>' Visible="false" />
                    <div class="card-body ">
                        <h5 class="card-title"><%#DataBinder.Eval(Container,"DataItem.Name")%></h5>
                        <p class="card-author"><%#DataBinder.Eval(Container,"DataItem.AuthorName")%></p>
                        <p class="card-price">Rs. <%#DataBinder.Eval(Container,"DataItem.Price")%></p>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <asp:Button ID="AddToCart" runat="server" Text="ADD TO BAG" CommandName="addToCart" Visible='<%# Convert.ToInt32(DataBinder.Eval(Container,"DataItem.Count")) > 0 ? true : false %>' Enabled="true" CssClass="btn btn-danger BagButton" />
                        </div>

                        <div class="col-md-2">
                            <asp:Button ID="WishList" runat="server" Text="WISHLIST" CommandName="wishList" Visible='<%# Convert.ToInt32(DataBinder.Eval(Container,"DataItem.Count")) > 0 ? true : false %>' Enabled="true" CssClass="btn btn-outline-dark wishListButton" />
                            <asp:Button ID="WishList1" runat="server" Text="WISHLIST" CommandName="wishList1" Visible='<%# Convert.ToInt32(DataBinder.Eval(Container,"DataItem.Count")) <= 0 ? true : false %>' Enabled="true" CssClass="btn btn-outline-dark wishListButton wishListButton1" />
                            <asp:Button ID="AddedToWishList" runat="server" Text="WISHLISTED" CommandName="wishListed" Visible="false" Enabled="false" CssClass="btn btn-outline-dark AddedToWishList" />
                        </div>
                    </div>
                    <asp:Button ID="AddedToCart" runat="server" Text="ADDED TO BAG" CommandName="addedToCart" Visible="false" Enabled="false" CssClass="btn btn-primary AddedToBagButton" />
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
