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
			border-bottom: 4px solid #000;
			
		}
		#quiz_content{
			width:900px;
			height:150px;
			line-height:150px;
			font-size:4em;
			text-align: center;
			margin:0 auto;
			border-bottom: 1px solid #ddd;
		}
		#answerlist{
			width:900px;
			margin:0 auto;
			padding-bottom: 30px;
			border-bottom: 1px solid #ddd;
		}
		#answer{
			margin: 0 auto;
			height: 80px;
			display: flex;
			flex-direction: row;
  			justify-content: space-around;
  			border-bottom: 1px solid #ddd;
		}
		#quiz_answer{
			width:80%;
			height:80px;
			font-size: 2em;
			
		}
		#quiz_delete{
			width: 80px;
			height:80px;
			font-size: 2em;
		}
		h1{
			padding-bottom: 20px;
		}
		/*#quiz_grade{
			display: flex;
			flex-direction: column;
  			justify-content: space-around;
  			margin: 10px auto;
		}*/
		#input-text{
			width: 280px;
			margin-top: 20px;
		}
		#editDelForm{
			width: 900px;
			margin: 0;
			display: flex;
			justify-content: space-around;
			line-height: 70px;
		}

	</style>
</head>
<body>
<div class="container">
	<div id="side_bar" >
		<ul id="side_menu">
			<li><a href="${pageContext.servletContext.contextPath}/admin">대시보드</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/member/management">현재회원관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/suspended/management">정지회원관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/withdrawn/management">탈퇴회원관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/board">게시글관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/reply">댓글관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/quiz/list">퀴즈관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/chat/management">채팅관리</a></li>
			
		</ul>
	</div>
	<div id="member_management">
		<h1 id="quiz_list_title">퀴즈 수정/삭제</h1>
		<div id="editDelForm">
			<div class="input-group mb-3" id="input-text">
				<input type="text" class="form-control" placeholder="추가할 단어 작성">
				<button class="btn btn-dark">추가</button>
			</div>
			<div>
				<button class="btn btn-dark">단어 삭제</button>
			</div>
		</div>
		<div id="quiz_content">
			<p>combination</p>
		</div>
		<div id="answerlist">
			<div id="answer">
				<div id="quiz_answer">단어</div>
				<button id="quiz_delete"> - </button>
			</div>
		</div>

		
		

	
	</div>
</div>
</body>
</html>