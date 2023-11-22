<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>should be</title>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
			<style>
				body {
					margin: 0 auto;
				}

				main {
					width: 1200px;
					margin: 100px auto;
					display: flex;
					flex-direction: column;
					justify-content: space-around;
					align-items: center;
				}

				.ctrlbtn {
					width: 190px;
					height: 180px;
				}

				.temp-login {
					width: 1200px;
					margin: 100px auto;
					display: flex;
					justify-content: space-around;
					align-items: center;
				}
			</style>
		</head>

		<body>
			<main>
				<div>
					<div id="freeboard">

					</div>
					<div id="databoard">

					</div>
				</div>
				<br/>
				<div>
					<button id="mypagebtn" class="ctrlbtn">

					</button>

					<button id="" class="ctrlbtn">

					</button>

					<button id="" class="ctrlbtn">

					</button>

					<button id="" class="ctrlbtn">

					</button>
				</div>
			</main>
			<div class="temp-login">
				<br />
				<a href="${pageContext.servletContext.contextPath}/log">임시로그인</a>
				<p>현재 아이디 : ${logId} / 로그인 상태 : ${logStatus}</p>
			</div>
		</body>

		</html>