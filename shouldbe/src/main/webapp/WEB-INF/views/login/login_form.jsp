<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
				#loginForm>ul>li,
				#link>ul>li {
					list-style-type: none;
				}

				#link {
					margin-top: 10px;
					width: 500px;
					height: 50px;
					margin-left: 310px;
				}

				#link>ul>li {
					float: left;
					border-right: 2px solid #ddd;
					width: 33%;
					text-align: center;
				}

				#link>ul>li:last-child {
					border-right: none;
				}

				#link>ul>li>a {
					text-decoration: none;
					color: black;
				}

				#logo {
					margin-bottom: 30px;
					width: 300px;
					margin-left: 425px;
				}

				main {
					width: 1200px;
					margin: 0 auto;
				}

				#userpwd,
				#userid {
					margin-top: 5px;
					margin-bottom: 5px;
					margin-left: 350px;
					width: 400px;
					height: 40px;
					line-height: 40px;
				}

				.submitbtn {
					background-color: #FFB300;
					border: none;
					color: white;
				}

				#login {
					margin-top: 30px;
					margin-bottom: 10px;
					margin-left: 350px;
					width: 400px;
					height: 40px;
					line-height: 40px;
				}
			</style>
		</head>

		<body style="margin: 0 auto;">
			<main>
				<form method="post" action="/loginOk" id="loginForm">
					<ul>
						<li><input type="text" name="userid" id="userid" placeholder="아이디"></li>
						<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호"></li>
						<li><input type="submit" name="login" id="login" value="로그인" class="submitbtn" /></li>
					</ul>
				</form>
				<div id="link">
					<ul>
						<li><a href="create_membership">회원가입</a></li>
						<li><a href="find_id">아이디찾기</a></li>
						<li><a href="find_pwd">비밀번호찾기</a></li>
					</ul>
				</div>
			</main>
		</body>

		</html>