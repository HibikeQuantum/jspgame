<%@page contentType="text/html; charset=utf-8" isErrorPage="true" %>
<% response.setStatus(200); %>
<HTML>
    <HEAD><TITLE>DB error</TITLE></HEAD>
    <BODY>
        <H3>DBerror </H3>
        error message: <%= exception.getMessage() %>
    </BODY>
</HTML>
