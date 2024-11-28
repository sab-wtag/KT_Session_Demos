<!DOCTYPE html>
<html>
<head>
    <title>Secure Implementation Examples</title>
    <style>
        .demo-box {
            border: 1px solid #ccc;
            margin: 10px 0;
            padding: 15px;
            background-color: #f9f9f9;
        }
        .code-example {
            background-color: #f5f5f5;
            padding: 10px;
            margin: 5px 0;
            font-family: monospace;
        }
    </style>
</head>
<body>
    <h1>Secure Implementation Examples</h1>
    
    <!--- Input Form --->
    <div class="demo-box">
        <h3>Test Input</h3>
        <form action="secure.cfm" method="post">
            <label for="userInput">Enter test payload:</label><br>
            <textarea name="userInput" id="userInput" rows="4" cols="50"><script>alert('test')</script></textarea><br>
            <input type="submit" value="Test All Contexts">
        </form>
    </div>

    <cfif structKeyExists(form, "userInput")>
        <cfset input = form.userInput>
        
        <!--- 1. HTML Context --->
        <div class="demo-box">
            <h3>1. HTML Context</h3>
            <div class="code-example">
                Original Input: <cfoutput>#input#</cfoutput><br>
                Secure Output: <cfoutput>#application.securityService.sanitizeInput(input, "html")#</cfoutput>
            </div>
            <p>Implementation:</p>
            <pre>
                &lt;cfoutput&gt;#encodeForHTML(userInput)#&lt;/cfoutput&gt;
            </pre>
        </div>
        
        <!--- 2. JavaScript Context --->
        <div class="demo-box">
            <h3>2. JavaScript Context</h3>
            <div class="code-example">
                <cfset safeJsValue = application.securityService.sanitizeInput(input, "js")>
                <cfoutput>
                    <button onclick="showAlert('#safeJsValue#')">Click to Show Alert</button>
                    <script>
                        function showAlert(value) {
                            alert('Safely embedded value: ' + value);
                        }
                    </script>
                </cfoutput>
            </div>
            <p>Implementation:</p>
            <pre>
                &lt;script&gt;
                    var safeValue = '#encodeForJavaScript(userInput)#';
                &lt;/script&gt;
            </pre>
        </div>
        
        <!--- 3. HTML Attribute Context --->
        <div class="demo-box">
            <h3>3. HTML Attribute Context</h3>
            <div class="code-example">
                <cfoutput>
                    <!--- Example with title attribute --->
                    <div title="#application.securityService.sanitizeInput(input, "attr")#">
                        Hover over this text to see the sanitized input in a title tooltip
                    </div>
                    
                    <!--- Example with data attribute --->
                    <div data-content="#application.securityService.sanitizeInput(input, "attr")#">
                        This div has the sanitized input in a data attribute
                    </div>
                </cfoutput>
            </div>
            <p>Implementation:</p>
            <pre>
                &lt;div title="#encodeForHTMLAttribute(userInput)#"&gt;
            </pre>
        </div>
        
        <!--- 4. URL Context --->
        <div class="demo-box">
            <h3>4. URL Context</h3>
            <div class="code-example">
                <cfoutput>
                    <!--- Example with href --->
                    <a href="page.cfm?param=#application.securityService.sanitizeInput(input, "url")#">
                        Safe Link with Parameter
                    </a>
                    
                    <!--- Example with form action --->
                    <form action="process.cfm?source=#application.securityService.sanitizeInput(input, "url")#">
                        <input type="submit" value="Safe Form Action">
                    </form>
                </cfoutput>
            </div>
            <p>Implementation:</p>
            <pre>
                &lt;a href="page.cfm?param=#encodeForURL(userInput)#"&gt;
            </pre>
        </div>
        
        <!--- 5. CSS Context --->
        <div class="demo-box">
            <h3>5. CSS Context</h3>
            <div class="code-example">
                <cfoutput>
                    <!--- Example with inline style --->
                    <div style="color: #application.securityService.sanitizeInput(input, "css")#">
                        Text with user-provided color (safely encoded)
                    </div>
                    
                    <!--- Example with background --->
                    <div style="background-image: url('#application.securityService.sanitizeInput(input, "css")#')">
                        Element with user-provided background
                    </div>
                </cfoutput>
            </div>
            <p>Implementation:</p>
            <pre>
                &lt;div style="color: #encodeForCSS(userInput)#"&gt;
            </pre>
        </div>
    </cfif>
    
    <!--- Test Cases Section --->
    <div class="demo-box">
        <h3>Common Test Payloads</h3>
        <ul>
            <li><code>&lt;script&gt;alert('test')&lt;/script&gt;</code></li>
            <li><code>javascript:alert('test')</code></li>
            <li><code>&lt;img src="x" onerror="alert('test')"&gt;</code></li>
            <li><code>"); alert('test');//</code></li>
            <li><code>' OR '1'='1</code></li>
        </ul>
    </div>
    
    <script>
        // Safe DOM manipulation example
        function updateDemoValue(safeValue) {
            document.getElementById('demoOutput').textContent = safeValue;
        }
    </script>
</body>
</html>