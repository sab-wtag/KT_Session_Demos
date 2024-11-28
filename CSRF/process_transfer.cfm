<cfif not structKeyExists(session, "loggedin") or not session.loggedin>
    <cflocation url="login.cfm" addtoken="no">
</cfif>

<cfif structKeyExists(form, "submitTransfer")>
    <cfset transferService = new TransferService()>
    <cfset transferSuccess = transferService.process(
        toAccount = form.toAccount,
        amount = form.amount
    )>
    
    <cfoutput>
        <h3>Transfer Processed (Vulnerable)</h3>
        <cfif transferSuccess>
            <p>Transferred $#form.amount# to account: #form.toAccount#</p>
            <p style="color: red;">Warning: This transfer was processed without CSRF protection!</p>
        <cfelse>
            <p style="color: red;">Transfer failed! Please try again.</p>
        </cfif>
        <p><a href="secure_page.cfm">Back to Secure Page</a></p>
    </cfoutput>
</cfif>