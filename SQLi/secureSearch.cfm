<cfset productDAO = new ProductDAO()>
<cfset productName = url.productName>

<cfset result = productDAO.searchProductsSecure(productName)>

<cfdump var="#result#" label="Secure Search Results">
