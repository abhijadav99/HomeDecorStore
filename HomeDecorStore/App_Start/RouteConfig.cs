using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace HomeDecorStore
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            // Custom routes
            routes.MapPageRoute("HomeRoute", "home", "~/Default.aspx");
            routes.MapPageRoute("ProductsRoute", "products", "~/Products.aspx");
            routes.MapPageRoute("CartRoute", "cart", "~/Cart.aspx");
            routes.MapPageRoute("AdminLoginRoute", "adminlogin", "~/AdminLogin.aspx");
            routes.MapPageRoute("AdminDashboardRoute", "admindashboard", "~/AdminDashboard.aspx");
            routes.MapPageRoute("LoginRoute", "login", "~/Login.aspx");
            routes.MapPageRoute("RegisterRoute", "register", "~/Register.aspx");
            routes.MapPageRoute("CheckoutRoute", "checkout", "~/Checkout.aspx");

            
        }
    }
}
