<%@ Page Title="" Language="C#" MasterPageFile="~/BookstoreHomePage.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="BookStoreWebForm.WebForm.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script  src="../Scripts/WebForms/snack.js" type="text/javascript"></script>
        <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
    <link  type="text/css" rel="stylesheet" href="../CSS/Bookstore.css" />
    <link  type="text/css" rel="stylesheet" href="../CSS/Order.css" />
     <script  src="../Scripts/WebForms/snackbar.js" type="text/javascript" ></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row" style="margin-top: 19px">
            <div class="col-md-6 mx-auto">
                <div class="card " style="margin-top: 29px">
                    <div class="card-body ">
                        <div class="row">
                            <asp:Image ID="Image1" ImageUrl="~/assets/OrderPlaced.PNG" CssClass="Image" runat="server" />
                        </div>
                        <div class="flexLabel">
                            <asp:Label ID="Label1" runat="server" CssClass="line1" Text="">hurray!!!your order is confirmed  </asp:Label>
                            <asp:Label ID="Label2" runat="server" CssClass="line2" Text="">  the order id is #123456 save the order is for </asp:Label>
                            <asp:Label ID="Label3" runat="server" CssClass="line3" Text=""> further communication...</asp:Label>
                        </div>
                        <div class="table">
                            <asp:Literal ID="ltTable" runat="server" />
                        </div>
                        <div class="flexShopping">
                            <asp:Button ID="PlaceOrder" runat="server" Text="CONTINUE SHOPPING" CssClass="btn btn-primary ContinueShopping" OnClick="PlaceOrder_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
