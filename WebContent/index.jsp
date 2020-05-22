<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판</title>
<style>
	ul{list-style:none; padding:0; }
	li{float:left}
	#list {background:#99F}
	#login {background:#FC3}
	#join {background:#6F9}
	a:link, a:visited {color:#000; text-decoration:none; font:bold 15px 맑은 고딕;
	width:150px; display:block; padding:5px; text-align:center;}
</style>
</head>
<body>
<nav id="topmenu">
	<ul>
		<li id = "list"><a href = "list.do">글목록</a></li>
		<li id = "login"><a href = "login.jsp">로그인</a></li>
		<li id = "join"><a href = "member_insForm.do">회원가입</a></li>
	</ul>
</nav>

<footer>
대구시 동구 동부로 통합응용SW
</footer>
</body>
</html>