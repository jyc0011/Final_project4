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
		
		#memberList{
		margin:0 auto;list-style-type: none;
		}
		#memberList>li{
		float: left;height:40px;line-height: 40px; border-bottom: 1px solid #ddd;width: 15%;
		}
		.search{
		width:10%;
		height:40px;
		float: left;
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
		<h1 id="quiz_list_title">현재 회원 관리</h1>
		
		<ul id="memberList">
			<li>
				<div class="search" style="width:100%">
					<form method="get" action="" >
						<input type="text" name="searchMember" id="searchMember" style="width:70%;height: 40px"/>
						<input type="submit" value="검색" style="width:25%;height: 40px">
					</form>
				</div>
			</li>
			<li>닉네임</li>
			<li>아이디</li>
			<li>가입일</li>
			<li>작성글/댓글 수</li>
			<li>신고횟수</li>
		</ul>
		

	</div>
</div>
</body>
</html>