<%@page contentType="text/html; charset=UTF-8" errorPage="DBError.jsp" %>
<%@page import="java.sql.*"%>
<%
    String id		= request.getParameter("ID");
    String password1= request.getParameter("pw1");
	String password2= request.getParameter("pw2");
	String password3= request.getParameter("pw3");
	String password4= request.getParameter("pw4");

	if (id == null || password1 == null || password2 == null|| password3 == null || password4 == null) 
	throw new Exception("입력되지 않은 항목이 있습니다.a");

	if (password1 == password2) 
        throw new Exception("비밀번호가 일치하지 않습니다.");
	if (password3 == password4) 
        throw new Exception("비밀번호힌트가 일치하지 않습니다.");

	    Connection conn		= null;
		Statement	stmt	= null;
	

        Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.71.10:1521:ORCL", 
				"JSP", "123123");

        if (conn != null) {
           out.println("orcl_pool 데이터베이스로 연결했습니다.<BR>");   
	    }
        else {
            out.println("orcl_pool 데이터베이스로 연결할 수 없습니다.<BR>");
        }
	
        stmt = conn.createStatement();
		String command = String.format("INSERT INTO ACCOUNT_TABLE(ACCOUNT, PW_FIRST, PW_SECOND, ID_CODE) values ('%s', '%s', '%s', ACCOUNT_SEQ.NEXTVAL)", id, password1, password3);

		int rowNum = stmt.executeUpdate(command);        
		if (rowNum < 1)
            throw new Exception("데이터를 DB에 입력할 수 없습니다.");

		try {stmt.close();} 
           catch (Exception ignored) {}
        try {conn.close();} 
           catch (Exception ignored){}
	
        response.sendRedirect("SignCheckResult.jsp");
	%>