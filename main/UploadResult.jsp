<%@ page contentType="text/html; charset=UTF-8"%>
<%	String	address="/jspgame/upload/"+ request.getParameter("profile_add"); 
	String	name = request.getParameter("name");
	String 	description = request.getParameter("description");
%>
<HTML>
    <HEAD> <TITLE>Log Live: Prologue 폐허의 고블린킹 </TITLE></HEAD>
    <BODY>
    	<H3> 캐릭터 생성 완료 </H3>
        <H2>닉네임: ${param.name} <BR>
        자기소개: ${param.description} <BR>
        프로필사진: <BR><img src="<%=address%>" width="100" height="100"><BR>
        [프로실 사진은 언제든지 교체가능 합니다]<BR>
        3초 뒤에 캐릭터 선택창으로 돌아갑니다.<BR></H2>
        setTimeout("location.href='main/home.jsp?BODY_PATH=main/selectCha.jsp'",3000);
    </BODY>
</HTML>