<cfset productDAO = new ProductDAO()>
<cfset productName = url.productName>

<cfset result = productDAO.searchProductsVulnerable(productName)>

<cfdump var="#result#">
