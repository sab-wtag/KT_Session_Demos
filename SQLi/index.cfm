<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Search - SQL Injection Demo</title>
</head>
<body>
    <h1>Product Search</h1>
    
    <!-- Vulnerable Search Form -->
    <form action="/vulnerableSearch.cfm" method="get">
        <label for="productName">Vulnerable Search:</label>
        <input type="text" id="productName" name="productName" placeholder="Enter product name">
        <button type="submit">Search</button>
    </form>

    <!-- Secure Search Form -->
    <form action="secureSearch.cfm" method="get">
        <label for="secureProductName">Secure Search:</label>
        <input type="text" id="secureProductName" name="productName" placeholder="Enter product name">
        <button type="submit">Search</button>
    </form>

</body>
</html>
