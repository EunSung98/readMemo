<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <link rel="icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/128/9433/9433739.png">
<title>감상 일기</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	String saveId = "";
	
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				saveId = cookies[i].getValue();
				break;
			}
		}
	}
%>
<div class="container shadow p-3 mb-5 bg-body rounded vh-100">
<jsp:include page="../header.jsp"/>
<form action="loginProc.jsp" name="loginForm" onsubmit="return check()" method="post">
	<div class="form-floating mb-3 w-50">
	  <input type="text" class="form-control" name="id" value="<%= saveId %>">
	  <label for="floatingInput">아이디</label>
	</div>
	<div>
		아이디 저장 <input type="checkbox" name="saveId" value="1">
	</div>
	<div class="form-floating w-50">
	  <input type="password" class="form-control" name="pw" placeholder="Password">
	  <label for="floatingPassword">비밀번호</label>
	</div>
	<button type="button" class="btn btn-primary mt-3" onclick="location.href='start.jsp'">취소</button>
	<button type="submit" class="btn btn-primary mt-3">로그인</button>
</form>
</div>
<script>
function check() {
	if (!document.loginForm.id.value) {
		alert("아이디를 입력해주세요");
		return false;
	} else if (!document.loginForm.pw.value){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	return true;
}
</script>
</body>
</html>