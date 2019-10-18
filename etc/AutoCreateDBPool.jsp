<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.apache.commons.dbcp.*"%>
<%@page import="org.apache.commons.pool.impl.*"%>
<%!
    public void jspInit() { 
        GenericObjectPool objectPool = new GenericObjectPool();
        DriverManagerConnectionFactory connectionFactory 
                    = new DriverManagerConnectionFactory("jdbc:oracle:thin:@192.168.71.10:1521:ORCL", "JSP", "123123");
        new PoolableConnectionFactory(connectionFactory, objectPool, null, null, false, true);
        PoolingDriver driver = new PoolingDriver();
        driver.registerPool("/orcl_pool", objectPool);
    }
%>