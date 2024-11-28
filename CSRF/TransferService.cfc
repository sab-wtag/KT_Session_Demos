component {
    
    public boolean function process_secure(required string toAccount, required numeric amount, required string csrf_token) {
        try {
            if (!CSRFVerifyToken(arguments.csrf_token)) {
                writeLog(
                    file = "transferLog",
                    type = "error",
                    text = "CSRF token verification failed for transfer to #arguments.toAccount#"
                );
                return false;
            }
            
            if (!structKeyExists(session, "loggedin") || !session.loggedin) {
                writeLog(
                    file = "transferLog",
                    type = "error",
                    text = "Unauthorized transfer attempt to #arguments.toAccount#"
                );
                return false;
            }
            
            writeLog(
                file = "transferLog",
                type = "information",
                text = "Secure transfer processed: Amount: $#arguments.amount# to Account: #arguments.toAccount# by user: #session.username#"
            );
                        
            return true;    
        } catch (any e) {
            writeLog(
                file = "transferLog",
                type = "error",
                text = "Error in secure transfer: #e.message# - #e.detail#"
            );
            return false;
        }
    }
    
    public boolean function process(required string toAccount, required numeric amount) {
        try {
            if (!structKeyExists(session, "loggedin") || !session.loggedin) {
                return false;
            }
            
            writeLog(
                file = "transferLog",
                type = "warning",
                text = "VULNERABLE transfer processed: Amount: $#arguments.amount# to Account: #arguments.toAccount# by user: #session.username#"
            );
            
            return true;
            
        } catch (any e) {
            writeLog(
                file = "transferLog",
                type = "error",
                text = "Error in vulnerable transfer: #e.message# - #e.detail#"
            );
            return false;
        }
    }
    
}