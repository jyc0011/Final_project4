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
<body>
	<main>
		<form>
			<h1>아이디 찾기</h1>
			<ul>
				<li><label>이름</label></li>
				<li><input type="text" name="username" id="username"/></li>
				<li><label>이메일</label></li>
				<li><input type="text" name="email" id="email"/></li>
				<li><input type="submit" name="find" id="find" value="찾기"/></li>
			</ul>
		</form>
	</main>
</body>
</html>