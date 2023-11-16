<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비밀번호 찾기</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  	<style>
		body {
			margin: 0 auto;
		}
		main {
			width: 1200px;
			height: 600px;
			margin: 30px auto;
			display: flex;
			justify-content: space-evenly;
			align-items: center;
			flex-direction: column;
		}
  		#find_pwd_form>h1{
  			text-align: center;
  		}
  		#find_pwd_form>ul>li{
  			list-style-type: none;
  			margin-top: 5px;
			margin-bottom: 5px;
  		}
  		.submitbtn{
			background-color: #FFB300;
			border: none;
			color: white;
		}
		#find{
			width: 400px;
			height: 40px;
			line-height: 40px;
		}
		#username, #email, #userid{
			width: 400px;
			height: 40px;
			line-height: 40px;
		}
  	</style>
</head>
<body>
	<main>
		<jsp:include page="${pageContext.servletContext.contextPath}/resources/header.jsp" />
		<form method="post" action="/findpwdOk" id=find_pwd_form>
			<h1>비밀번호 찾기</h1>
			<ul>
				<li><label>이름</label></li>
				<li><input type="text" name="username" id="username" placeholder="이름을 입력해주세요."/></li>
				<li><label>아이디</label></li>
				<li><input type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요."/></li>
				<li><label>이메일</label></li>
				<li><input type="text" name="email" id="email" placeholder="이메일을 입력해주세요."/></li>
				<li><input type="submit" name="find" id="find" value="찾기" class="submitbtn"/></li>
			</ul>
		</form>
	</main>
	<jsp:include page="${pageContext.servletContext.contextPath}/resources/footer.jsp" />
</body>
</html>
