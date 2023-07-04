<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link rel="icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/128/9433/9433739.png">
<title>감상 일기</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 입력된 값을 DO에 한번에 받음 -->
<jsp:useBean id="mdo" class="member.memberDo" >
	<jsp:setProperty name="mdo" property="*" />
</jsp:useBean>

<!-- dao 클래스를 이용해 입력값을 저장 (signUp) -->
<jsp:useBean id="mdao" class="member.memberDao" />
<%
		if(mdao.signUp(mdo)){
			response.sendRedirect("start.jsp");	
		}else{
			response.sendRedirect("signUp.jsp");	
		}
%>
</body>
</html>