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
				#side_menu {
					padding: 100px 0 0 0;
					float: left;
				}

				#side_menu>ul>li {
					list-style-type: none;
				}

				#member_management {
					width: 1100px;

				}

				#quiz_list {
					display: flex;
					justify-content: space-around;
				}

				#quiz_list_title {
					text-align: center;
				}

				#reg_buttons {
					margin-bottom: 50px;
					text-align: right;
				}

				.qqlist {

					width: 300px;
					height: 500px;
					border: 1px solid #ddd;

				}
			</style>
		</head>

		<body>
			<div class="container">
				<div id="side_menu">
					<ul>
						<li><a href="">대시보드</a></li>
						<li><a href="">현재회원관리</a></li>
						<li><a href="">정지회원관리</a></li>
						<li><a href="">탈퇴회원관리</a></li>
						<li><a href="">글관리</a></li>
						<li><a href="">퀴즈관리</a></li>
						<li><a href="">채팅관리</a></li>

					</ul>
				</div>
				<div id="member_management">
					<h1 id="quiz_list_title">퀴즈 관리</h1>
					<div id="reg_buttons">
						<input type="button" value="관리자 퀴즈 등록">
						<input type="button" value="유저 퀴즈 등록">
					</div>

					<div id="quiz_list">
						<div class="qqlist" id="quiz_easy">

						</div>
						<div class="qqlist" id="quiz_medium"></div>
						<div class="qqlist" id="quiz_hard"></div>
					</div>


				</div>
			</div>
		</body>

		</html>