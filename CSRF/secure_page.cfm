<cfif not structKeyExists(session, "loggedin") or not session.loggedin>
    <cflocation url="login.cfm" addtoken="no">
</cfif>

<cfoutput>
    <h2>Secure Page - Transfer Money</h2>
    <p>Welcome, #session.username#!</p>
    
    <!--- Vulnerable Form (without CSRF protection) --->
    <div>
        <h3>Vulnerable Form (No CSRF Protection)</h3>
        <form method="post" action="process_transfer.cfm">
            <div>
                To Account: <input type="text" name="toAccount" required>
            </div>
            <div>
                Amount: <input type="number" name="amount" required>
            </div>
            <input type="submit" name="submitTransfer" value="Transfer Money">
        </form>
    </div>
    
    <!--- Protected Form (with CSRF protection) --->
    <div>
        <h3>Protected Form (With CSRF Protection)</h3>
        <form method="post" action="process_transfer_secure.cfm">
            <div>
                To Account: <input type="text" name="toAccount" required>
            </div>
            <div>
                Amount: <input type="number" name="amount" required>
            </div>
            <!--- Generate CSRF Token --->
            <input type="hidden" name="csrf_token" value="#CSRFGenerateToken()#">
            <input type="submit" name="submitTransfer" value="Transfer Money Securely">
        </form>
    </div>
    
    <p><a href="logout.cfm">Logout</a></p>
</cfoutput>