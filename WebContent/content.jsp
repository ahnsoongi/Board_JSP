<%@page import="ch13.model.BoardDBBean"%>
<%@page import="ch13.model.BoardDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "color.jspf" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script type="text/javascript">
function download(filename){
	document.downloadForm.filename.value =filename; 
	document.downloadForm.submit();
}
</script>


</head>
<body bgcolor = "<%=bodyback_c %>">
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf =
			new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try{
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num);
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();	
%>

<p>글내용 보기</p>


<form name="contentForm">
<table>  
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
    <td align="center" width="125" align="center">
	     <%=article.getNum()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
    <td align="center" width="125" align="center">
	     <%=article.getWriter()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>" >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
    <td align="left" width="375" colspan="3">
           <pre><%=article.getContent()%></pre></td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="<%=value_c%>">파일다운로드</td>
    <td align="left" width="375" colspan="3">
           <%
           String filename = article.getFilename();
           if( filename !=null && !filename.equals("")) { %>
	           <a href="javascript:download('<%=filename %>')">
	           <%=filename %>
	           
	           </a>
           <%} else { %>
           파일이 없습니다.
           <%}  %>
    </td>
  </tr>
  <tr height="30">      
    <td colspan="4" bgcolor="<%=value_c%>" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='update.do?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='delete.do?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="답글쓰기" 
       onclick="document.location.href='write.do?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='list.do?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
	}catch(Exception e){}
%>
</form>

<form name = "downloadForm" action = "downloadPro.jsp" method = "post">
	<input type = "hidden" name = "filename">
</form>































</body>
</html>