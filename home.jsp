<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
    <HEAD>
        <TITLE>Log Live</TITLE>
    </HEAD>
    <BODY>
        <H1> <A HREF="home.jsp">Log Live</A><BR></H1> 
        <TABLE border=1 cellpadding=10>
            <TR>
                <TD width=100 valign=top>
                    <c:choose> 
                        <c:when test="${sessionScope.ID == null}">
                            <jsp:include page="loginWindow.html"/>
                        </c:when>
                        <c:otherwise>
                            <%response.sendRedirect("main/mainHome.jsp");%>
                        </c:otherwise>
                    </c:choose> 
                </TD>
           </TR>
        </TABLE>
        <H5>Copyright@ 2015 Kangtaehun </H5>
    </BODY>
</HTML>