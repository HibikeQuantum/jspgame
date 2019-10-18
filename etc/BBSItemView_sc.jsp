<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="web.BBSItem"%>
<%
    int seqNo = Integer.parseInt(request.getParameter("SEQ_NO"));
    BBSItem bbsItem = new BBSItem();
    bbsItem.setSeqNo(seqNo);
    bbsItem.readDB();
%>
<HTML>
    <HEAD><TITLE>게시글 읽기</TITLE></HEAD>
    <BODY>
        <H4>게시글 읽기</H4>
        [제목] <%= bbsItem.getTitle() %> <BR>
        [작성자] <%= bbsItem.getWriter() %>
        [작성일시] <%= bbsItem.getDate() %> <%= bbsItem.getTime() %> <BR>
        ------------------------------------------------------------ <BR>
        <%= bbsItem.getContent() %>
    </BODY>
</HTML>
