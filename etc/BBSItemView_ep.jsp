<%@page contentType="text/html; charset=euc-kr"%>
<jsp:useBean id="bbsItem" class="web.BBSItem" />
<jsp:setProperty name="bbsItem" property="seqNo" value="${param.SEQ_NO}" />
<% bbsItem.readDB(); %>
<HTML>
    <HEAD><TITLE>게시글 읽기</TITLE></HEAD>
    <BODY>
        <H4>게시글 읽기</H4>
        [제목] ${bbsItem.title} <BR>
        [작성자] ${bbsItem.writer} 
        [작성일시] ${bbsItem.date} ${BBS_ITEM.time} <BR>
        ------------------------------------------------------------ <BR>
        ${bbsItem.content}
    </BODY>
</HTML>
