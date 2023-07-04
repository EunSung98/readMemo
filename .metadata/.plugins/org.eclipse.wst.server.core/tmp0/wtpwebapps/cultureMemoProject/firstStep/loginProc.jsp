<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/128/9433/9433739.png">
<title>감상 일기</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- dao 클래스를 이용해 입력값을 저장 (signUp) -->
<jsp:useBean id="mdao" class="member.memberDao" />
<%
	String saveId = request.getParameter("saveId");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean login;
	
	if(saveId != null){
		Cookie cookie = new Cookie("id",id);
		//시간 지정
		cookie.setMaxAge(60*3);
		response.addCookie(cookie);
	}
	
	login = mdao.signIn(id, pw);
	
	if(login){
		session.setAttribute("id",id);
		
		response.sendRedirect("../memo/diary.jsp");
	}else{
		response.sendRedirect("login.jsp");
	}
%>
</body>
</html>