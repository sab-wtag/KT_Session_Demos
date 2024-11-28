component {
    this.name = "XSSDemoApp";
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0,0,30,0);
    
    // Map the components
    this.mappings["/services"] = getDirectoryFromPath(getCurrentTemplatePath()) & "components";
    
    function onApplicationStart() {
        application.securityService = new components.SecurityService();
        application.xssService = new components.XSSService();
    }
    
    function onRequestStart() {
        // Security headers
        cfheader(name="X-XSS-Protection", value="1; mode=block");
        cfheader(name="X-Content-Type-Options", value="nosniff");
        cfheader(name="Content-Security-Policy", value="default-src 'self'");
        
        // Reset application on demand
        if(structKeyExists(url, "reset")) {
            onApplicationStart();
        }
    }
}