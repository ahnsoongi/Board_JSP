<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = (String)session.getAttribute("id");
String email = (String)session.getAttribute("email");
String passwd = (String)session.getAttribute("passwd");
int checkId = (int)request.getAttribute("checkId");

if(checkId ==-1){
	%>
	<script>
	alert("해당 아이디를 찾을 수 없습니다. 회원가입을 해 주세요.");
	</script>
	<%
}
else if (checkId==1){
	%>
	<script>
	alert("아이디와 패스워드가 일치하지 않습니다. 다시 로그인해 주세요.");
	</script>
	<%
}
else if (id!=null){
	%>
	<script>
	alert("반갑습니다. list 화면으로 이동합니다.");
	location.href = "list.do";
	</script>
	<%	
}
%> 