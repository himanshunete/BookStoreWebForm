<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="CustomerRecords.aspx.cs" Inherits="BookStoreWebForm.WebForm.CustomerRecords" %>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="container">
        <div class="row" style="margin-top: 19px">
            <div class="col-md-6 mx-auto">
                <div class="card " style="margin-top: 29px">
                    <div class="card-body ">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField ItemStyle-Width="150px" DataField="id" HeaderText="Customer ID" />
                                <asp:BoundField ItemStyle-Width="150px" DataField="FirstName" HeaderText="First Name" />
                                <asp:BoundField ItemStyle-Width="150px" DataField="LastName" HeaderText="Last Name" />
                                <asp:BoundField ItemStyle-Width="150px" DataField="EmailAddress" HeaderText="Email Address" />
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>
    </div>
              
</asp:Content>
