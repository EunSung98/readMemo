<%@page import="books.bookDo"%>
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
<jsp:useBean id="bdao" class="books.bookDao" />
<%
	String userId = (String) session.getAttribute("id");
	String book = request.getParameter("book");
	
	bdao.deleteBook(book,userId);
	
	response.sendRedirect("diary.jsp");
%>
</body>
</html>