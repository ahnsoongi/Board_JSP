<%@page import="ch13.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8"); %>

<%-- 	<jsp:useBean id="article" scope="page" class="ch13.model.BoardDataBean">
	 <jsp:setProperty name = "article" property="*"/> 
</jsp:useBean> --%>

<%
	response.sendRedirect("list.jsp");
	
%>

