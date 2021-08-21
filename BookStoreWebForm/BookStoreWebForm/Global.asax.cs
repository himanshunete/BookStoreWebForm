using BusinessLayer.Interface;
using BusinessLayer.Service;
using Microsoft.AspNet.WebFormsDependencyInjection.Unity;
using RepositoryLayer.Interface;
using RepositoryLayer.Service;
using RepositoryLayer.WebForm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Unity;

namespace BookStoreWebForm
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {


            System.Web.Routing.RouteTable.Routes.MapPageRoute("Registration", "BookStore/Registration", "~/WebForm/Registration.aspx");
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Login", "BookStore/Login", "~/WebForm/Login.aspx");
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Forget", "BookStore/Forget", "~/WebForm/Forget.aspx");
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Reset", "BookStore/Reset", "~/WebForm/ResetPassword.aspx");
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Home", "BookStore/Home", "~/WebForm/Bookstore.aspx");
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Cart", "BookStore/Cart", "~/WebForm/Cart.aspx");
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Order", "BookStore/Order", "~/WebForm/Order.aspx");
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Order", "BookStore/Records", "~/WebForm/CustomerRecords.aspx");

            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //Dependancy Injection
            var container = this.AddUnity();
            container.RegisterType<ICustomerBL, CustomerBL>();
            container.RegisterType<ICustomerRL, CustomerRL>();
            container.RegisterType<IBookStoreBL, BookStoreBL>();
            container.RegisterType<IBookStoreRL, BookStoreRL>();


         
        }
    }
}