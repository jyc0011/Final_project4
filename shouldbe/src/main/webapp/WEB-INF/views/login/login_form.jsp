<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="width: 1200px; margin: 0 auto;">
	<main>
		<img src="/image/login/logo.png"/>
		<form method="post" action="/loginOk">
			<ul>
				<li><input type="text" name="userid" id="userid" placeholder="아이디"></li>
				<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호"></li>
				<li><input type="submit" name="login" id="login" value="로그인"/></li>
				<li><a href="">회원가입</a></li>
				<li><a href="find_id">아이디찾기</a></li>
				<li><a href="find_pwd">비밀번호찾기</a></li>
			</ul>
		</form>
	</main>
</body>
</html>