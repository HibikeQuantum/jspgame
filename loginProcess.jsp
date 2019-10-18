<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
errorPage="DBError.jsp" buffer="100kb" 
import="java.sql.*" 
import="javax.servlet.*"
import="java.io.*"
import="java.sql.*"
%>           
<%
    String id		= request.getParameter("ID");
    String password = request.getParameter("PASSWORD");
    String id_code 	= null;
    
	Connection 	conn	= null;
	Statement	stmt	= null;
	ResultSet	rs		= null;
	String		command	= null;
	String 		correctPassword	= null;
	
	
	if (id == null || password == null) 
	throw new Exception("입력되지 않은 항목이 있습니다.a");
	
    Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.71.10:1521:ORCL", "JSP", "123123");
    if (conn != null) {
	    out.println("orcl_pool 데이터베이스로 연결했습니다.<BR>");   
	}
    else {
        out.println("orcl_pool 데이터베이스로 연결할 수 없습니다.<BR>");
    }
	stmt = conn.createStatement();
	command = String.format("select * FROM ACCOUNT_TABLE where ACCOUNT = '%s'", id);
	rs = stmt.executeQuery(command);
	
	if (!rs.next()){
		throw new Exception("아이디 정보가 잘못되었습니다.");
	}
   	
	correctPassword = rs.getString("PW_FIRST");
	id_code 		= rs.getString("ID_CODE");
	if (null == correctPassword){
		throw new Exception("비빌번호 정보 못들고 왔습니다. 죄송하빈다.");
	}
   		
   	if (password.equals(correctPassword)){
   		application.log(id +"님 로그인");
   	 	session.setAttribute("ID", id);
   	 	session.setAttribute("ID_CODE",id_code);
   	  	
   	 	response.sendRedirect("main/mainHome.jsp?BODY_PATH=intro.html");	
   	}
   	 else{
   		application.log(id +"님 로그인 실패");
   	 	response.sendRedirect("main/mainHome.jsp?BODY_PATH=intro.html");   	 		
   	 	throw new Exception("kth: login fail");
	}
   	
   	try {stmt.close();} 
	   	catch (Exception ignored) {}
	try {conn.close();} 
	   catch (Exception ignored){}
  	
%>