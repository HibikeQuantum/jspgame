<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
errorPage="DBError.jsp" buffer="100kb" 
import="java.sql.*" import="javax.servlet.*" import="java.io.*" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String slot = request.getParameter("slot");%>
<HTML>
    <HEAD>  
    	<TITLE>Log Live Prologue</TITLE>  
    </HEAD>
    <BODY>
        <H4> 슬롯 <%=slot%>번</H4>
        <FORM ACTION=Upload.jsp METHOD=POST ENCTYPE="multipart/form-data">
        	캐릭터 만들기 <BR>
        				<input type="hidden" name="SLOT" value="<%=slot%>">
       		닉네임 		<INPUT TYPE=TEXT NAME=NAME SIZE=12> <BR>
         	자기소개	<INPUT TYPE=TEXT NAME=DESCRIPTION SIZE=12> <BR>
        	프로필 사진 <INPUT TYPE=FILE NAME=FILE> <BR><BR>
          <INPUT TYPE=SUBMIT VALUE="만들기">
        </FORM>
    </BODY>
</HTML>
