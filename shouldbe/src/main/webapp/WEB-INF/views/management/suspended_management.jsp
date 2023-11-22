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
			padding-bottom: 20px;
		}
		
		
		/*리스트 내용*/
		#list_head{
			border-bottom: 4px solid #000;
		}
		.management_list th{
			width:12.5%;
			height:40px;
			line-height: 40px;
		}
		.management_list td{
			width:12.5%;
			height:100px;
		}
		#list_content{
			border-bottom: 1px solid #ddd;
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
		<h1 id="quiz_list_title">정지 회원 관리</h1>
		
		<div class="col-sm-12">
			<table id="example" class="display" style="width:100%">
		        <thead id="list_head">
		            <tr class="management_list">
		            	<th class="profile_img"></th>
		                <th class="user_name">닉네임</th>
		                <th class="user_id">아이디</th>
		                <th class="time">정지일</th>
		                <th class="suspend_reason">정지사유</th>
		                <th class="writing_count">작성글/댓글 수</th>
		                <th class="report_count">신고횟수</th>
		                <th class="suspend_button"></th>
		            </tr>
		        </thead>
		        <tbody id = "list_content">
		        	<tr class="management_list">
		        		<td class="user_name"></td>
		        		<td class="user_name">닉네임</td>
		                <td class="user_id">아이디</td>
		                <td class="time">정지일</td>
		                <th class="suspend_reason">정지사유</th>
		                <td class="writing_count">작성글/댓글 수</td>
		                <td class="report_count">신고횟수</td>
		                <td class="unsuspend_button"><input type="button" value="정지해제"></td>

		        	</tr>
		        </tbody>
		    </table>
		</div>
	</div>
</div>
</body>
</html>
