<cfif structKeyExists(form, "submitLogin")>
    <!--- Simple login logic (for demo purposes) --->
    <cfif form.username eq "admin" && form.password eq "password123">
        <cfset session.loggedin = true>
        <cfset session.username = form.username>
        <cflocation url="secure_page.cfm" addtoken=false>
    </cfif>
</cfif>

<cfoutput>
    <h2>Login Form</h2>
    <form method="post" action="login.cfm">
        <div>
            Username: <input type="text" name="username" required>
        </div>
        <div>
            Password: <input type="password" name="password" required>
        </div>
        <input type="submit" name="submitLogin" value="Login">
    </form>
</cfoutput>