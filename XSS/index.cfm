<!DOCTYPE html>
<html>
<head>
    <title>XSS Testing Framework</title>
    <style>
        .warning { color: red; }
        .safe { color: green; }
    </style>
</head>
<body>
    <h1>XSS Testing Framework</h1>
    
    <h2>1. Reflected XSS Test</h2>
    <form action="reflected.cfm" method="post">
        <input type="text" name="searchTerm">
        <input type="submit" value="Search">
    </form>
    
    <h2>2. Stored XSS Test</h2>
    <form action="stored.cfm" method="post">
        <textarea name="comment" rows="4" cols="50"></textarea>
        <input type="submit" value="Post Comment">
    </form>
    
    <h2>3. DOM-based XSS Test</h2>
    <div id="output"></div>
    <script>
        // Vulnerable DOM manipulation (for demonstration)
        function updateOutput() {
            var param = new URLSearchParams(window.location.search).get('input');
            if(param) {
                document.getElementById('output').innerHTML = param; // Vulnerable
            }
        }
        updateOutput();
    </script>
</body>
</html>