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
		#quiz_content{
			width:900px;
			height:300px;
			line-height:300px;
			font-size:4em;
			text-align: center;
			margin:0 auto;
			border-bottom: 1px solid #ddd;
		}
		#answerlist{
			width:900px;
			height:600px;
			margin:0 auto;
			border-bottom: 1px solid #ddd;
		}
		#answer{
			margin: 0 auto;
			display: flex;
			flex-direction: row;
  			justify-content: space-around;
  			border-bottom: 1px solid #ddd;
		}
		#quiz_answer{
			width:80%;
			height:100px;
			font-size: 2em;
			
		}
		#quiz_delete{
			width: 100px;
			height:100px;
			font-size: 2em;
		}
		
		/*#quiz_grade{
			display: flex;
			flex-direction: column;
  			justify-content: space-around;
  			margin: 10px auto;
		}*/

		

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
		<h1 id="quiz_list_title">퀴즈 수정/삭제</h1>
		
		<div id="quiz_content">
			combination
		</div>
		<div id="answerlist">
			<div id="answer">
				<div id="quiz_answer">단어</div>
				<button id="quiz_delete"> - </button>
			</div>
		</div>
		<div>
			<input type="text">
			<button>추가</button>
		</div>
		<div>
			<button>단어 삭제</button>
		</div>
		
		

	
	</div>
</div>
</body>
</html>