<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
errorPage="DBError.jsp" buffer="100kb" 
import="java.sql.*" 
import="javax.servlet.*"
import="java.io.*"
import="java.sql.*"
%>    
<%
        String currentURL = request.getParameter("CURRENT_URL");
        session.removeAttribute("ID");
        response.sendRedirect(currentURL);
%>