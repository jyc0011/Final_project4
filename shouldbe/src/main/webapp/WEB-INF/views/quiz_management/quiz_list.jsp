<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.container{
			display: flex;
		}
		#side_menu{
			padding:98px 0 0 0;
			width:150px;
			height:1000px;

		}
		#side_menu{
			list-style-type: none;
		}
		#side_menu li a{
			text-decoration: none;
			color: black;
			display: block;
			padding: 10px;
		}
		#side_menu li a:hover{
			background-color: #ddd;
		}
		
		#member_management{
			width: 1200px;
			height:1000px;
			margin: 50px auto;
			
		}
		#quiz_list_title{
			text-align: center;
			border-bottom: 1px solid #000;
			
		}
		
		/*#quiz_grade{
			display: flex;
			flex-direction: column;
  			justify-content: space-around;
  			margin: 10px auto;
		}*/
		
		#quiz_list{
			display: flex;
  			justify-content: space-around;
		}
		#quiz_list_title{
			text-align: center;
		}
		#reg_buttons{
			margin-bottom: 50px;
			text-align: right;
		}
		.qqlist{

			width: 300px;
			height: 500px;
			border: 1px solid #ddd;
			
		}
		

	</style>
</head>
<body>
<div class="container">
	<div id="side_bar" >
		<ul id="side_menu">
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
		</body>

	</div>
</div>
</body>
</html>
