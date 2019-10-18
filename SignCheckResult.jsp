<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<H4>가입완료 3초 뒤 홈으로 돌아갑니다!</H4>
<script type='text/javascript'>
	setTimeout("location.href='main/home.jsp?BODY_PATH=main/intro.html'",3000);
</script>