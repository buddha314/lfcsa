dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
           pooled = true
           dbCreate = "create-drop"
           //dbCreate = "update"
           url = "jdbc:mysql://localhost/lfcsa"
           driverClassName = "com.mysql.jdbc.Driver"
           username = "lfcsadmin"
           password = "br0wnc0w"
        }
    }
    test {
        dataSource {
           pooled = true
           dbCreate = "update"
           url = "jdbc:mysql://localhost/lfcsa"
           driverClassName = "com.mysql.jdbc.Driver"
           username = "lfcsadmin"
           password = "br0wnc0w"
        }
    }
    production {
        dataSource {
           pooled = true
           dbCreate = "update"
           url = "jdbc:mysql://localhost/lfcsa"
           driverClassName = "com.mysql.jdbc.Driver"
           username = "lfcsadmin"
           password = "br0wnc0w"
        }
    }
}
