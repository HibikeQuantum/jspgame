<%@page contentType="text/html; charset=euc-kr"%>
<jsp:useBean id="bbsItem" class="web.BBSItem" />
<jsp:setProperty name="bbsItem" property="seqNo" value="${param.SEQ_NO}" />
<% bbsItem.readDB(); %>
<HTML>
    <HEAD><TITLE>게시글 읽기</TITLE></HEAD>
    <BODY>
        <H4>게시글 읽기</H4>
        [제목] <jsp:getProperty name="bbsItem" property="title" /> <BR>
        [작성자] <jsp:getProperty name="bbsItem" property="writer" /> 
        [작성일시] <jsp:getProperty name="bbsItem" property="date" />
                   <jsp:getProperty name="bbsItem" property="time" /> <BR>
        ------------------------------------------------------------ <BR>
        <jsp:getProperty name="bbsItem" property="content" />
    </BODY>
</HTML>
