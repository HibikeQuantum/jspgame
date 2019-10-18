<%@page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<% response.setStatus(200); %>
<HTML>
    <HEAD><TITLE>파일 업로드 에러 페이지</TITLE></HEAD>
    <BODY>
        파일 업로드 에러가 발생했습니다. <BR><BR>
        상세 에러 메시지: <%= exception.getMessage() %>
    </BODY>
</HTML>