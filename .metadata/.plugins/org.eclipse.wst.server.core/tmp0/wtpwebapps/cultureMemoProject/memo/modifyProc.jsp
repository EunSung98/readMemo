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

<!-- dao 클래스를 이용해 입력값을 저장  -->
<jsp:useBean id="bdo" class="books.bookDo" >
	<jsp:setProperty name="bdo" property="*" />
</jsp:useBean>

<jsp:useBean id="bdao" class="books.bookDao" scope="application"/>

<% 	
		String userId = (String) session.getAttribute("id");
		String book = request.getParameter("book");
		
		bdao.modifyBook(bdo,book,userId);
		
		response.sendRedirect("diary.jsp");
%>
</body>
</html>