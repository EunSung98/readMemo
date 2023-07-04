<%@page import="java.text.SimpleDateFormat"%>
<%@page import="books.bookDo"%>
<%@page import="java.util.ArrayList"%>
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
<div class="h5 container shadow p-3 mb-5 bg-body rounded vh-100">
	<jsp:include page="../header.jsp"/>
	<div class="d-grid mt-5 w-50">
	  <button class="btn btn-info" type="button" onclick="location.href='upload.jsp'">일기 쓰기</button>
	</div>
	
	<table class="table table-striped mt-3">
	  <thead>
	    <tr>
	      <th class="col-1" scope="col"></th>
	      <th class="col-5"  scope="col">책 제목</th>
	      <th class="col-4" scope="col">저자</th>
	      <th class="col-3"  scope="col">날짜</th>
	    </tr>
	  </thead>
	    <tbody>
	    
	   <jsp:useBean id="bdao" class="books.bookDao" scope="application" />
	   
	<%
		String id = (String) session.getAttribute("id");
			
		ArrayList<bookDo> b = bdao.getAll(id);
		
		for(int i=0; i<b.size(); i++){
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy.MM.dd");
			
			bookDo bdo = b.get(i);
			
			String date = dateformat.format(bdo.getDate());
	%>
		<tr  class="align-middle" style="cursor: pointer" onclick="location.href='page.jsp?book=<%= bdo.getBookName()%>'">
	      <th scope="row" class="p-3"><%= i+1 %></th>
	      <td><%= bdo.getBookName() %></td>
	      <td><%= bdo.getWriter() %></td>
	      <td><%= date %></td>
	    </tr>
	<%
		}	
	%>
	  </tbody>
	</table>
</div>
</body>
</html>