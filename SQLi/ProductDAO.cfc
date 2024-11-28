component accessors = "true" {
    this.data = "sqli";
    public query function searchProductsVulnerable(required string productName){
        try {
            var products = queryExecute(
                sql: "SELECT * FROM Products WHERE name = '#arguments.productName#'",
                params: [],
                options: {
                    datasource: this.data
                }
            )
            return products;
        } catch(any e){
            return queryNew("id, name, price");
        }
    }

    public query function searchProductsSecure(required string productName){
        try {
            var products = queryExecute(
                sql: "SELECT * FROM Products WHERE name = :productName;",
                params: [
                    {
                        name: "productName",
                        value: arguments.productName,
                        cfsqltype: "cf_sql_varchar"
                    }
                ],
                options: {
                    datasource: this.data
                }
            )
            return products;
        } catch(any e){
            return queryNew("id, name, price");
        }
    }
}