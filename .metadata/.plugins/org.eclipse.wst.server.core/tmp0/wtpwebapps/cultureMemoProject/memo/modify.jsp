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
<div class="container shadow p-3 mb-5 bg-body rounded vh-100">
<jsp:useBean id="bdao" class="books.bookDao" />
<%
	String userId = (String) session.getAttribute("id");
	String book = request.getParameter("book");
	
	bookDo bdo = bdao.goPage(book,userId);
%>
<jsp:include page="../header.jsp"/>
	<form action="modifyProc.jsp?book=<%=book %>" method="post">
	<div class="row">
		<div class="col">
		  <label for="exampleFormControlInput1" class="form-label  mt-3">제목</label>
		  <input type="text" class="form-control" name="bookName"
		  		value="<%= bdo.getBookName() %>">
		 </div>
		 <div class="col mb-3"> 
		  <label for="exampleFormControlInput1" class="form-label  mt-3">저자</label>
		  <input type="text" class="form-control" name="writer"
		  	value="<%= bdo.getWriter() %>">
		</div>
	</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">나의 감상</label>
		  <textarea class="form-control" name="content" rows="16"
		  	placeholder="여러분의 감상을 적어주세요.">
		  	<%= bdo.getContent() %>
		  </textarea>
		</div>
		<div class="col">
		  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class=" btn btn-outline-secondary me-md-2" type="button" onclick="history.back()">되돌아가기</button>
			<button class="btn btn-primary"type="submit">기록하기</button>
		  </div>
		</div>
	</form>
</div>
</body>
</html>