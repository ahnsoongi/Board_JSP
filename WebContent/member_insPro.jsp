<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% //request.setCharacterEncoding("utf-8"); 
String id = (String)request.getAttribute("id");
String email = (String)request.getAttribute("email");
String passwd = (String)request.getAttribute("passwd");
int result = (int)request.getAttribute("result");

if(id != null & email != null & passwd != null){
	

	if(result == 1){
		
%>
		<script>
			alert("회원가입 완료 되었습니다.");
		location.href = "login.jsp";
		</script>
<%	
	}else {
%> 

	<script>
		alert("회원가입 완료 되었습니다.");
	</script>
<%
	}
}
else{
%>	
	<script>
		alert("회원가입에 실패하였습니다.");
	</script>
<%
}
%>