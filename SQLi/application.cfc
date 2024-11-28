component {
    this.datasources["sqli"] = {
        class: "com.mysql.cj.jdbc.Driver", 
        bundleName: "com.mysql.cj", 
        bundleVersion: "8.4.0",
        connectionString: "jdbc:mysql://host.docker.internal:3307/sqli?characterEncoding=UTF-8&serverTimezone=Etc/UTC&maxReconnects=3",
        username: "ahbab",
        password: "encrypted:6d9b53de0e7218b05b928cd048afcefd41698b7435e3ad484c7550cc9347c2aa",
        
        // optional settings
        connectionLimit:-1, // default:-1
        liveTimeout:15, // default: -1; unit: minutes
        alwaysSetTimeout:true, // default: false
        validate:false, // default: false
    }; 
}