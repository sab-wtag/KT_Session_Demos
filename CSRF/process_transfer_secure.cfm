<cfif not structKeyExists(session, "loggedin") or not session.loggedin>
    <cflocation url="login.cfm" addtoken="no">
</cfif>

<cfif structKeyExists(form, "submitTransfer")>
    <cfset transferService = new TransferService()>
    <cfif structKeyExists(form, "csrf_token")>
    <cfset transferSuccess = transferService.process_secure(
        toAccount = form.toAccount,
        amount = form.amount,
        csrf_token = form.csrf_token
    )>
    <cfoutput>
        <h3>Transfer Processed Securely</h3>
            <p>Transferred $#form.amount# to account: #form.toAccount#</p>
            <p style="color: green;">This transfer was protected against CSRF attacks!</p>
        <p><a href="secure_page.cfm">Back to Secure Page</a></p>
    </cfoutput>
    <cfelse>
        <cfoutput>
            <p style="color: red;">Please don't hack me! ~_~</p>
        </cfoutput>
    </cfif>
    
    
</cfif>