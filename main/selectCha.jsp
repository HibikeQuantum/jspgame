<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
errorPage="DBError.jsp" buffer="100kb" 
import="java.sql.*" import="javax.servlet.*" import="java.io.*" import="java.sql.*"
import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<%
	//DB조회,캐릭터코드 123 가지고 와서 변수 정보 정리, 없으면 없는 파트별로 makeCha.Jsp 호출
	
	request.setCharacterEncoding("UTF-8");

	Connection 	conn	= null;
	ResultSet	rs		= null;
	String		command	= null;
	Statement	stmt	= null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.71.10:1521:ORCL", "JSP", "123123");
	if (conn != null) {out.println("orcl_pool 데이터베이스로 연결했습니다.<BR>");}
    else {out.println("orcl_pool 데이터베이스로 연결할 수 없습니다.<BR>");}
	
	Object get_idcode = session.getAttribute("ID_CODE");
	String id_code = (String)get_idcode;
	
	stmt = conn.createStatement();
	command = String.format("select * FROM CHARACTER_TABLE where ID_CODE = '%s'", id_code);
	rs = stmt.executeQuery(command);
	
	if (!rs.next()){
		//아이디 정보가 없음. CHA_CODE를 모두 0으로 테이블에 ID_CODE 열을 갱신해준다.
		session.setAttribute("CHA_CODE1", 0);
		session.setAttribute("CHA_CODE2", 0);
		session.setAttribute("CHA_CODE3", 0);
		
		command = String.format
				("INSERT INTO CHARACTER_TABLE(ID_CODE) VALUES('%s')", id_code);
		application.log("둘 째 쿼리 작성 성공 id_code ="+id_code);
		int rowNum = stmt.executeUpdate(command);  
		if (rs.next()){
			application.log("축하합니다. 캐릭터테이블에 ID_CODE 열이 갱신되었습니다.");
		}
	}
   	
	else {
		//세션 아이디에 코드를 지정해준다.
		session.setAttribute("CHA_CODE1",rs.getInt("CHA_CODE1"));
		session.setAttribute("CHA_CODE2",rs.getInt("CHA_CODE2"));
		session.setAttribute("CHA_CODE3",rs.getInt("CHA_CODE3"));
		//makeChar에서 2-3값도 정리해줘야한다.
	}      	
   	try {stmt.close();} 
	   	catch (Exception ignored) {}
	try {conn.close();} 
	   catch (Exception ignored){}
	
%>

<HTML>
<head> 
<script language="javascript"> 
function onclick_function() { 
document.location.href='./mainHome.jsp?BODY_PATH=mainTown.jsp'; 
} 
</script>
</head>
	<BODY>
		<H3> 캐릭터 선택창</H3>
  		<TABLE border=1 cellpadding=2>
            <TR>
                <TD valign=top width=200 >
                	<c:choose>
                	     <c:when test="${sessionScope.CHA_CODE1 == 0}">
	                    	 	<jsp:include page="./makeCha.jsp" flush="true"> 
	                    	 	<jsp:param name="slot" value="1" />
	                    	 	</jsp:include>
	                                 	 
                   		 </c:when>
                    <c:when test= "${sessionScope.CHA_CODE2!= 1}">
                        <h3> 1 접속합니당 ${sessionScope.CHA_CODE1} </h3>
                       		<input type=button onclick="onclick_function()" value='버튼'>
                        </c:when>
                    </c:choose>
                     
                </TD>
                <TD valign=top width=200>
                    <c:choose>
                	
                		<c:when	test="${sessionScope.CHA_CODE2 == 0}">
                    	<jsp:include page="./makeCha.jsp"> 
                    	<jsp:param 	name="slot" value="2"/>
                    	</jsp:include>
                    </c:when>
                    
                  	  	<c:when test= "${sessionScope.CHA_CODE2!= 0}">
                        <h3> 2 접속합니당 ${sessionScope.CHA_CODE2} </h3>
                        </c:when>
                    </c:choose>
                </TD>
                <TD valign=top width=200>
                    <c:choose>
 
                		<c:when test= "${sessionScope.CHA_CODE3 == 0}">                   
						    <jsp:include page="./makeCha.jsp"> 
	                    	<jsp:param name="slot" value="3"/>
    	                	</jsp:include>
                        </c:when>
                    
 	                   <c:when test= "${sessionScope.CHA_CODE3 != 0}">
                        <h3> 3 접속합니당 ${sessionScope.CHA_CODE3}  </h3>
                        </c:when>
                    </c:choose>
                </TD>
            </TR>
		</TABLE> 
		</BODY>
		</HTML>