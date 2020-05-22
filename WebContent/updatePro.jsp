<%@page import="ch13.model.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8");%>

<%
String pageNum = (String)request.getAttribute("pageNum");

int check = (int)request.getAttribute("check");

if(check==1){
%>
	<meta http-equiv = "Refresh" content = "0;url=list.do?pageNum=<%=pageNum %>">
<% }else{ %>
	<script type = "text/javascript">
	
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
	
	</script>
<%
}
%>
