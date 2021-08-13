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

      <div  style="display:flex; justify-content:stretch ; margin-left:170px; margin-top:120px; align-items:stretch; flex-wrap:wrap">
     <asp:Repeater ID="RepeatInformation"     runat="server">  
         <HeaderTemplate>
       
               </HeaderTemplate>
           <ItemTemplate> 
               
              
                <div class="card cardFlex1" style=" margin: 10px;  height: 310px; width: 17rem;">
                     <asp:Image ID="Image1" ImageUrl="~/assets/PNGPIX-COM-Mahendra-Singh-Dhoni-PNG-Image-500x488.png" style="height:175px;width:280px" runat="server" />
  <div class="card-body ">
    <h5 class="card-title" style="position:absolute; bottom:5px"><%#DataBinder.Eval(Container,"DataItem.Name")%> </h5>
    <p class="card-text" style="position:absolute; bottom:10px"><%#DataBinder.Eval(Container,"DataItem.AuthorName")%> </p>
    <p class="card-text" style="bottom:5px"> <%#DataBinder.Eval(Container,"DataItem.Price")%>  </p>
  </div>
                    </div>

                     
            </ItemTemplate> 
         
         
           
          
         </asp:Repeater>

       </div>

</asp:Content>
