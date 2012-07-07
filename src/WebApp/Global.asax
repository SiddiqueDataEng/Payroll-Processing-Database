<%@ Application Language="C#" %>
<script runat="server">
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Application["AppName"] = "Payroll System";
        Application["StartTime"] = DateTime.Now;
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        // Code that runs on application shutdown
    }
    
    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs
        Exception ex = Server.GetLastError();
        // Log error
        System.Diagnostics.EventLog.WriteEntry("Payroll-Processing-Database", ex.ToString(), 
            System.Diagnostics.EventLogEntryType.Error);
    }
    
    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
    }
    
    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends
    }
</script>

