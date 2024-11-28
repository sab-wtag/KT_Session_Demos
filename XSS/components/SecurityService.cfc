component {
    public SecurityService function init() {
        return this;
    }

    public string function sanitizeInput(required string input, string context="html") {
        switch(arguments.context) {
            case "html":
                return encodeForHTML(arguments.input);
            case "js":
                return encodeForJavaScript(arguments.input);
            case "attr":
                return encodeForHTMLAttribute(arguments.input);
            case "url":
                return encodeForURL(arguments.input);
            case "css":
                return encodeForCSS(arguments.input);
            default:
                return encodeForHTML(arguments.input);
            
        }
    }

    public void function logXSSAttempt(required string payload, required string page){
        var logEntry = {
            timestamp: now(),
            payload: arguments.payload,
            page: arguments.page,
            ip: cgi.remote_addr
        }

        writeLog(text=serializeJSON(logEntry), type="warning", file="xss_attempts");
    }
}