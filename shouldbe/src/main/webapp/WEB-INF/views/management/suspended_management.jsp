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

		#side_menu{
			padding:100px 0 0 0;
			float: left;
		}
		#side_menu>ul>li{
		list-style-type: none;
		}
		#member_management{
			width: 1100px;
			text-align: center;
		}
		#memberList{
		
		margin:0;
		list-style-type: none;
		}
		#memberList>li{
		float: left;height:40px;line-height: 40px; border-bottom: 1px solid #ddd;width: 13%;
		}
		.search{
		height:40px;
		float: left;
		margin:0 auto;
		wid
		}
		#searchform{
		width:100px;
		}
		
	</style>
</head>
<body>
<div class="container">
	<div id="side_menu" >
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
		<h1 id="membertitle">정지 회원 관리</h1>
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
			<li>정지일</li>
			<li>정지사유</li>
			<li>작성글/댓글 수</li>
			<li>신고횟수</li>
		</ul>
	
	</div>
</div>
</body>
</html>