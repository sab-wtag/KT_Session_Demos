component {
    this.name = "CSRFDemo";
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0,0,30,0);
    
    // Enable CSRF protection
    this.secureJSON = true;
    
    function onApplicationStart() {
        return true;
    }
    
    function onSessionStart() {
        session.loggedin = false;
    }
}