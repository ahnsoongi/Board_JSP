<%@page import="ch13.model.BoardDataBean"%>
<%@page import="ch13.model.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script type = "text/javascript" src = "script.js"></script>
</head>
<body bgcolor = "<%=bodyback_c%>">
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String id = (String)session.getAttribute("id");
	String passwd = (String)session.getAttribute("passwd");
	String email = (String)session.getAttribute("email");
	String strV = "";
	
	try{
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.updateGetArticle(num);
%>

<p>글수정</p>
<br>
<form method = "post" name = "updateform"
action = "updatePro.do?pageNum=<%=pageNum %>" onsubmit = "return writeSave()"
enctype = "multipart/form-data">
<table>
	<tr>
		<td width = "70" bgcolor = "<%= value_c%>" align = "center">이름</td>
		<td align = "left" width = "330">
		<input type = "text" size ="10" maxlength = "10" name = "id"
		value = "<%=id %>" style = "ime-mode:active;" readonly>
		<input type = "hidden" name = "num" value = "<%=article.getNum() %>"></td>
	</tr>
	<tr>
		<td width = "70" bgcolor = "<%= value_c%>" align = "center">제목</td>
		<td align = "left" width = "330">
		<input type = "text" size ="40" maxlength = "50" name = "subject"
		value = "<%=article.getSubject() %>" style = "ime-mode:active;">
		</td>
	</tr>
	<%
    if(request.getParameter("num")==null)
    	strV ="";
    else
    	strV = "[수정]";
    %>
	<tr>
		<td width = "70" bgcolor = "<%= value_c%>" align = "center">Email</td>
		<td align = "left" width = "330">
		<input type = "text" size ="40" maxlength = "30" name = "email"
		value = "<%=email %>" style = "ime-mode:inactive;" readonly>
		</td>
	</tr>
	<tr>
		<td width = "70" bgcolor = "<%= value_c%>" align = "center">내 용</td>
		<td align = "left" width = "330">
		<textarea name = "content" rows = "13" cols = "40" style = "ime-mode:active;"><%=article.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<%-- <td width = "70" bgcolor = "<%= value_c%>" align = "center">비밀번호</td>
		<td align = "left" width = "330"> --%>
		<input type = "hidden" size ="8" maxlength = "12" 
		name = "passwd" style = "ime-mode:inactive;" value="<%=passwd%>">
		<!-- </td> -->
	</tr>
	<tr>
		<td colspan=2 bgcolor="<%=value_c%>" align = "center">
			<input type = "submit" value="글수정">
			<!-- <input type = "reset" value="다시작성"> -->
			<input type = "button" value="목록보기"
			onclick = "document.location.href = 'list.do?pageNum=<%=pageNum %>'">
		</td>
	</tr>
</table>
</form>
<%}catch(Exception e){}%>

</body>
</html>