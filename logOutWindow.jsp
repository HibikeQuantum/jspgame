<%@page contentType="text/html; charset=utf-8" %>
<FORM ACTION=../logOutProcess.jsp METHOD=GET 
         onSubmit="CURRENT_URL.value = window.location.href">
    안녕하세요, ${sessionScope.ID}님 <BR>
    <INPUT TYPE=HIDDEN NAME=CURRENT_URL>
    <INPUT TYPE=SUBMIT VALUE='로그아웃'> <BR>
</FORM>
