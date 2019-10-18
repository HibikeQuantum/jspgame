<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
    <HEAD>
        <TITLE>Log Live</TITLE>
    </HEAD>
    <BODY>
        <H1> <A HREF="mainHome.jsp?BODY_PATH=intro.html">Log Live</A><BR></H1> 
        <TABLE border=1 cellpadding=2>
            <TR>
                <TD width=100 valign=top>
                    <c:choose> 
                        <c:when test="${sessionScope.ID == null}">
                            <jsp:include page="../loginWindow.html" />
                        </c:when>
                        <c:otherwise>
                            <jsp:include page="../logOutWindow.jsp" />
                        </c:otherwise>
                    </c:choose> 
                </TD>
                <TD valign=top width=350 colspan="3">
                    <jsp:include page="${param.BODY_PATH}" />
                </TD>
            </TR>
				<TR>
				<TD>
					<A HREF="mainHome.jsp?BODY_PATH=intro.html">게임 소개2</A><BR>
				</TD>
				<TD>
					<A HREF="mainHome.jsp?BODY_PATH=selectCha.jsp">수련</A><BR>
				</TD>
				<TD>
					<A HREF="mainHome.jsp?BODY_PATH=adventure.html">모험</A><BR>
				</TD>
				<TD>
					<A HREF="mainHome.jsp?BODY_PATH=info.html">정보조회</A><BR>
				</TD>
			</TR>
        </TABLE>
        <H5>Copyright@ 2015 Kangtaehun </H5>
    </BODY>
</HTML>