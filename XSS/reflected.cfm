<!DOCTYPE html>
<html>
<head>
    <title>Reflected XSS Demo</title>
</head>
<body>
    <h2>Search Results</h2>
    
    <!--- Vulnerable Version --->
    <div class="warning">
        <h3>Vulnerable Output:</h3>
        <cfif structKeyExists(form, "searchTerm")>
            <cfoutput>
            Search term: #form.searchTerm#
            </cfoutput>
        </cfif>
    </div>
    
    <!--- Secure Version --->
    <div class="safe">
        <h3>Secure Output:</h3>
        <cfif structKeyExists(form, "searchTerm")>
            <cfset secureOutput = application.securityService.sanitizeInput(form.searchTerm)>
            <cfoutput>
            Search term: #secureOutput#
        </cfoutput>
        </cfif>
    </div>
    
    <cfif structKeyExists(form, "searchTerm")>
        <cfset application.securityService.logXSSAttempt(form.searchTerm, "reflected.cfm")>
    </cfif>
</body>
</html>