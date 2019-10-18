<%@page contentType="text/html; charset=euc-kr"%>
<jsp:useBean id="bbsItem" class="web.BBSItem" />
<jsp:setProperty name="bbsItem" property="seqNo" value="${param.SEQ_NO}" />
<% bbsItem.readDB(); %>
<H4>게시글 읽기</H4>
[제목] ${bbsItem.title} <BR>
[작성자] ${bbsItem.writer} 
[작성일시] ${bbsItem.date} ${bbsItem.time} <BR>
------------------------------------------------------------ <BR>
${bbsItem.content}
