<%@ Import namespace="System.Web.Profile"%>
<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        MembershipCreateStatus status = new MembershipCreateStatus();
        if (!Roles.RoleExists("StoreAdmins"))
            Roles.CreateRole("StoreAdmins");
        if (Membership.GetUser("Admin") == null)
            Membership.CreateUser("Admin", "secret", "", "dog", "rover", true, out status);
        if (!Roles.IsUserInRole("Admin", "StoreAdmins"))
            Roles.AddUserToRole("Admin", "StoreAdmins");
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        // Log all unhandled errors
        Utilities.LogError(Server.GetLastError());

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    void Profile_OnMigrateAnonymous(object sender, ProfileMigrateEventArgs e)
    {
        // get the profile for the anonymous user
        ProfileCommon anonProfile = Profile.GetProfile(e.AnonymousID);
        // if they have a shopping cart, then migrate that to the authenticated user
        if (anonProfile.Cart != null)
        {
            if (Profile.Cart == null)
                Profile.Cart = new DevMedia.ECommerce.Cart();
            Profile.Cart.Items.AddRange(anonProfile.Cart.Items);
            anonProfile.Cart = null;
        }
        ProfileManager.DeleteProfile(e.AnonymousID);
        AnonymousIdentificationModule.ClearAnonymousIdentifier();
    }

       
</script>
