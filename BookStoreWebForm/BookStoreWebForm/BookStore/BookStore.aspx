<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="BookStore.aspx.cs" Inherits="BookStoreWebForm.BookStore.BookStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link  type="text/css" rel="stylesheet" href="../CSS/Registration.css" />
      <script  src="../Scripts/WebForms/snackbar.js" type="text/javascript" ></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bookcount" >
            <asp:Label ID="Book" runat="server" style="font-size:30px" Text="Books"></asp:Label>
            <asp:Label ID="BookCount" CssClass="Count" runat="server" style="font-size:15px" Text="items"></asp:Label>
    </div>

      <asp:Label ID="Label1" runat="server" style="position:absolute; left:60px; font-size:30px" Text="Books"></asp:Label>
            <asp:Label ID="Label2" typeof="text" runat="server" style="position:absolute; left:150px;font-size:15px" Text="items"></asp:Label>
    
      <div  style="display:flex; justify-content:stretch ; margin-left:170px; margin-top:120px; align-items:stretch; flex-wrap:wrap">
     <asp:Repeater ID="RepeatInformation"     runat="server">  
         <HeaderTemplate>
       
               </HeaderTemplate>
           <ItemTemplate> 
               
              
                <div class="card cardFlex1" style=" margin: 10px;  height: 330px; width: 18rem;">
                     <asp:Image ID="Image1" ImageUrl="~/assets/PNGPIX-COM-Mahendra-Singh-Dhoni-PNG-Image-500x488.png" style="height:175px;width:280px" runat="server" />
  <div class="card-body ">
    <h5 class="card-title" style="position:absolute; bottom:105px"><%#DataBinder.Eval(Container,"DataItem.Name")%> </h5>
    <p class="card-text" style="position:absolute; bottom:73px"><%#DataBinder.Eval(Container,"DataItem.AuthorName")%> </p>
    <p class="card-text" style="position:absolute; bottom:61px"> <%#DataBinder.Eval(Container,"DataItem.Price")%>  </p>
  </div>

                    <div class="row">

                                <div class="col-md-2">

                                    <asp:Button ID="CreateButton"  runat="server" style=" position:absolute; bottom: 10px; left:15px;  width:120px" Text="ADD TO BAG" CssClass="btn btn-danger "   />

                                </div>

                                 <div class="col-md-2">
                                  <asp:Button ID="Button1" runat="server" Text="WISHLIST" CssClass="btn btn-outline-dark wishListButton"  />
                                     </div>

                            </div>
                    </div>

                     
            </ItemTemplate> 
         
         
           
          
         </asp:Repeater>

       </div>

</asp:Content>
