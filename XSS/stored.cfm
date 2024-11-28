<!DOCTYPE html>
<html>
<head>
    <title>Stored XSS Demo</title>
</head>
<body>
    <h2>Comments Section</h2>
    
    <!--- Save comment (normally would go to database) --->
    <cfif structKeyExists(form, "comment")>
        <cfset session.comments = structKeyExists(session, "comments") ? 
                                session.comments : []>
        <cfset arrayAppend(session.comments, form.comment)>
        <cfset application.securityService.logXSSAttempt(form.comment, "stored.cfm")>
    </cfif>
    
    <!--- Display comments --->
    <div class="warning">
        <h3>Vulnerable Output:</h3>
        <cfif structKeyExists(session, "comments")>
            <cfloop array="#session.comments#" index="comment">
                <cfoutput>
                <div class="comment">#comment#</div>
            </cfoutput>
            </cfloop>
        </cfif>
    </div>
    
    <div class="safe">
        <h3>Secure Output:</h3>
        <cfif structKeyExists(session, "comments")>
            <cfloop array="#session.comments#" index="comment">
                <cfset secureComment = application.securityService.sanitizeInput(comment)>
                <cfoutput>
                <div class="comment">#secureComment#</div>
            </cfoutput>
            </cfloop>
        </cfif>
    </div>
</body>
</html>