using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Http;
using Microsoft.AspNet.SignalR;

namespace eadp_forum
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            /* RouteTable.Routes.MapHttpRoute(
    name: "DefaultApi",
    routeTemplate: "api/{Controller = ForumPostController}/{query}",
    defaults: new { query = System.Web.Http.RouteParameter.Optional }
);
            RegisterCustomRoutes(RouteTable.Routes); */

            // RouteTable.Routes.MapHubs("/Hubs", new HubConfiguration());

        }

        /* void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "DefaultApi",
                "ForumPost/{search_query}",
                "~/forum_search_results.aspx"
            ); 

        }*/
    }
}