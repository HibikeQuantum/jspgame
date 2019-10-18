<%@page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"
 buffer="100kb" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="java.net.URLEncoder"%>
<%
	//변수 초기화 및 정리
	
	String profile_add	= null;
	String id_code		= (String)session.getAttribute("ID_CODE");
	
	//시계 부분
	long curr = System.currentTimeMillis();
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");
	String serverTime = sdf2.format(new Date(curr));
	
	//파일 전송 파라미터
	request.setCharacterEncoding("UTF-8");
    int maxSize  = 1024*1024*10;        
    String root = request.getSession().getServletContext().getRealPath("/");
    String savePath = root + "upload";
    
    MultipartRequest multi = null;
    String filename1 = null;
    String o_filename2 = null;
	//DB    
	Connection conn		= null;
	Statement	stmt	= null;
	String 		command = null;

    
    //파일전송구현

	multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	Enumeration files= multi.getFileNames();    
    String file1 	=	(String)files.nextElement(); 
    filename1		=	multi.getFilesystemName(file1); //저장될 이름이다.
    profile_add = filename1;
    
    String slot 		= multi.getParameter("SLOT");
	String name			= multi.getParameter("NAME");
	String description	= multi.getParameter("DESCRIPTION");
    
	application.log("slot="	+ 	slot);
	application.log("name="	+	name);
	application.log("description="+description);
	application.log("serverTime="+serverTime);
	application.log("profile_add="+profile_add);
	application.log("ID_CODE="+id_code);
	application.log("프로필 생성을 위한 파라미터값 준비 완료");	
	
	try{
	//DB 연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.71.10:1521:ORCL", "JSP", "123123");
	if (conn != null) {
		application.log("ORCL 데이터 베이스 연결 완료"); 
	}
	else {
		application.log("ORCL 데이터 베이스 연결 실패"); 
	}
	stmt = conn.createStatement();
	if(slot.equals("1")){
			application.log("실행전");
			command = String.format("UPDATE CHARACTER_TABLE SET CHA_CODE1 = CHARACTER_SEQ.NEXTVAL, CHA_MAKED_TIME1 = '%s', CHA_NAME1 = '%s', CHA_PROFILE1 = '%s', CHA_DESC1 = '%s' WHERE ID_CODE = '%s'", serverTime, name, profile_add, description, id_code); 
			stmt.executeUpdate(command); 
			application.log("slot 1 excute success");
			conn.commit();
	}
		else{
		application.log("slot 1 excute fail");
		}
	if(slot.equals("2")){
		application.log("실행전");
		command = String.format("UPDATE CHARACTER_TABLE SET CHA_CODE2 = CHARACTER_SEQ.NEXTVAL, CHA_MAKED_TIME2 = '%s', CHA_NAME2 = '%s', CHA_PROFILE2 = '%s', CHA_DESC2 = '%s' WHERE ID_CODE = '%s'", serverTime, name, profile_add, description, id_code); 
		stmt.executeUpdate(command); 
		application.log("slot 2 excute success");
		conn.commit();
}
	else{
	application.log("slot 2 excute fail");
	}
	if(slot.equals("3")){
		application.log("실행전");
		command = String.format("UPDATE CHARACTER_TABLE SET CHA_CODE3 = CHARACTER_SEQ.NEXTVAL, CHA_MAKED_TIME3 = '%s', CHA_NAME3 = '%s', CHA_PROFILE3 = '%s', CHA_DESC3 = '%s' WHERE ID_CODE = '%s'", serverTime, name, profile_add, description, id_code); 
		stmt.executeUpdate(command); 
		application.log("slot 3 excute success");
		conn.commit();
}
	else{
	application.log("slot 3 excute fail");
	}
	
	
	}
	catch (Exception e){
		if ( conn != null )try{conn.rollback();}catch(Exception ee){}
		
		out.println("캐릭터 생성 SQL 실행 실패" + slot +"");	
		stmt.close();
		conn.close();	
	}
	
/* 	request.SetAttribute("name", name);
	request.SetAttribute("description", description);
	request.SetAttribute("profile_add", profile_add);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadResult.jsp");
	dispatcher.forward(request, response); */
	
	String url = String.format("UploadResult.jsp?name=%s&description=%s&profile_add=%s",
    URLEncoder.encode(name, "UTF-8"), 
    URLEncoder.encode(description, "UTF-8"), 
    URLEncoder.encode(profile_add, "UTF-8"));
	response.sendRedirect(url);
%>
