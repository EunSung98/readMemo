l<%@ page language="java" contentType="text/html; charset=utf-8"
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
<div class="container shadow p-3 mb-5 bg-body rounded vh-100">
	<%-- <%@ include file="header.jsp" %> --%>
	<jsp:include page="../header.jsp"/>
	<form action="signUpProc.jsp"  onsubmit="javascript:check()" name="signUpForm" class="row g-3" method="post">
		<div class="col-12">
		  <label for="inputAddress" class="form-label">이름</label>
		  <span class="text-primary" style="font-size:12px">(필수)</span>
		  <input type="text" class="w-50 form-control" name="name">
		</div>
		<div class="col-12">
		  <label for="inputAddress2" class="form-label">아이디</label>
		  <span class="text-primary" style="font-size:12px">(필수)</span>
		  <input type="text" class="w-50 form-control" name="id" >
		</div>
		<div class="col-12">
		  <label for="inputCity" class="form-label">비밀번호</label>
		  <span class="text-primary" style="font-size:12px">(필수)</span>
		  <input type="password" class="w-50 form-control" name="pw">
		</div>
		<div class="col-12">
		  <label for="inputCity" class="form-label">이메일</label>
		  <input type="email" class="w-50 form-control" name="email">
		</div>
		<div class="col ">
		  <button type="button" class="btn btn-primary" onclick="location.href='start.jsp'">취소</button>
		  <!-- <button type="submit" class="btn btn-primary">가입</button> -->
		  <input type="submit" class="btn btn-primary" value="가입">
		</div>
	</form>
</div>
<script>
function check() {
	if(!document.signUpForm.name.value){
		alert("이름을 입력해주세요");
		return false;
	}else if (!document.signUpForm.id.value) {
		alert("아이디를 입력해주세요");
		return false;
	} else if (!document.signUpForm.pw.value){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	return true;
}
</script>
</body>
</html>