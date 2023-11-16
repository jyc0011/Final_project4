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
  		#find_id_form>h1{
  			text-align: center;
  		}
  		#find_id_form>ul>li{
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
		#username, #email{
			width: 400px;
			height: 40px;
			line-height: 40px;
		}
		#finded{
			width: 600px;
			display: none;
		}
		#finded>p{
			text-align: center;
		}
		#back, #find_pwd{
			float: right;
			margin: 20px 10px;
		}
  	</style>
  	<script>
  		$(function(){
  			$("#find_pwd").on('click', function(){
  				location.href="/find_pwd";
  			});
  			$("#back").on('click', function(){
  				location.href="/login";
  			});
  			$("#find").on('click', function(){
  				$("#finded").css('display', 'block');
  			});
  		});
  	</script>
</head>
<body>
	<jsp:include page="${pageContext.servletContext.contextPath}/resources/header.jsp" />
	<main>
		<form method="post" action="/findidOk" id="find_id_form">
			<h1>아이디 찾기</h1>
			<ul>
				<li><label>이름</label></li>
				<li><input type="text" name="username" id="username" placeholder="이름을 입력해주세요."/></li>
				<li><label>이메일</label></li>
				<li><input type="text" name="email" id="email" placeholder="이메일을 입력해주세요."/></li>
				<li><input type="submit" name="find" id="find" value="찾기" class="submitbtn"/></li>
			</ul>
		</form>
		<div id="finded">
			<hr/>
			<p>찾으신 아이디는 "" 입니다.</p>
			<input type="button" value="뒤로가기" class="submitbtn" id="back"/>
			<input type="button" value="비밀번호찾기" class="submitbtn" id="find_pwd"/>
		</div>
	</main>
	<jsp:include page="${pageContext.servletContext.contextPath}/resources/footer.jsp" />
</body>
</html>