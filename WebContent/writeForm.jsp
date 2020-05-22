<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %>



<%
int num = 0, ref = 1, re_step = 0, re_level = 0;
String strV = "";
String id = (String)session.getAttribute("id");
String email = (String)session.getAttribute("email");
String passwd = (String)session.getAttribute("passwd");
try{
	if(request.getParameter("num")!=null){
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		re_step= Integer.parseInt(request.getParameter("re_step"));
		re_level=Integer.parseInt(request.getParameter("re_level"));
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>

<!-- <style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

body {
  background: #76b852; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
</style> -->



</head>
<body bgcolor="<%=bodyback_c %>" >
<p>글쓰기</p>
<form method="post" name = "writeform"
      action="writePro.do" enctype = "multipart/form-data">
<input type = "hidden" name = "num" value = "<%=num %>">
<input type = "hidden" name = "ref" value = "<%=ref %>">
<input type = "hidden" name = "re_step" value = "<%=re_step %>">
<input type = "hidden" name = "re_level" value = "<%=re_level %>">


<table style = "margin-right:auto; margin-left:auto; ">
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="list.do"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">이 름</td>
    <td  width="330" align="left">
       <input type="text" size="10" maxlength="10" 
          name="writer" style="ime-mode:active;" value="<%=id %>" readonly></td><!--active:한글-->
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >제 목</td>
    <td  width="330" align="left">
    <%
    if(request.getParameter("num")==null)
    	strV ="";
    else
    	strV = "[답변]";
    %>
    <input type="text" size="40" maxlength="50" name="subject"
         value="<%=strV%>" style="ime-mode:active;"></td>	
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">Email</td>
    <td  width="330" align="left">
       <input type="text" size="40" maxlength="30" name="email" value="<%=email %>"
           style="ime-mode:inactive;" readonly ></td><!--inactive:영문-->
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >Content</td>
    <td  width="330" align="left">
     <textarea name="content" rows="13" cols="40" 
              style="ime-mode:active;"></textarea> </td>
  </tr>
  
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >파일선택</td>
    <td  width="330" align="left"><input type = "file"
     	name = "selectfile"></td>
  </tr>
  
  <tr>
    <%-- <td  width="70"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td  width="330" align="left"> --%>
     <input type="hidden" size="8" maxlength="12" 
             name="passwd" style="ime-mode:inactive;" value = "<%=passwd%>"> 
	 <!-- </td> -->
  </tr>
  
  <tr>      
    <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
      <input type="submit" value="글쓰기" >  
      <input type="reset" value="다시작성">
      <input type="button" value="목록보기" OnClick="window.location='list.do'">
    </td>
  </tr>
</table>
<%
}catch(Exception e){}
%> 
</form>
</body>
</html>