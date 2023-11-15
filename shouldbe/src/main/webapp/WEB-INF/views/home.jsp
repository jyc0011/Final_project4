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
		body{
			width: 1200px;
			margin: 0 auto;
		}
		main{
			width: 1200px;
			margin: 0 auto;
		}
		.banner{
			width: 920px;
			height: 280px;
			border: 1px solid #ddd;
			border-radius: 5px;
		}
		#freeboard{
			width: 400px;
			height: 200px;
			border: 1px solid #ddd;
		}
		#databoard{
			width: 400px;
			height: 200px;
			border: 1px solid #ddd;
		}
		.ctrlbtn{
			width: 190px;
			height: 180px;
		}
		
		li{
			list-style-type: none;
			float: left;
			width: 25%;
		}
		a{
		text-decoration: none;
		color: black;
		}
		#login{
		height: 30px;
		}
	</style>
</head>
<body>
	<main>
		<div id="login">
			<a href="" style="float: right; margin: 10px auto;">로그인/회원가입</a>
		</div>
		<div style="width: 1200px;">
			<h1 style="height: 100px; text-align: center; font-size: 2em; line-height: 100px;">쇼드비</h1>
		</div>
		<div style="height: 40px; line-height: 40px; text-align: center; background-color: #FFF2d4;">
			<ul style="width: 1200px;">
				<li><a href="">마이페이지</a></li>
				<li><a href="">게시판</a></li>
				<li><a href="">퀴즈</a></li>
				<li><a href="">채팅</a></li>
			</ul>
		</div>
		<div class="banner">
			
		</div>
		<div id="freeboard">
			
		</div>
		<div id="databoard">
			
		</div>
		
		<button id="mypagebtn" class="ctrlbtn">
			
		</button>
		
		<button id="" class="ctrlbtn">
		
		</button>
		
		<button id="" class="ctrlbtn">
		
		</button>
		
		<button id="" class="ctrlbtn">
		
		</button>
	</main>
</body>
</html>