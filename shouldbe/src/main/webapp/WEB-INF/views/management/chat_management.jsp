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
			padding-bottom: 20px;
		}
		
		/*#quiz_grade{
			display: flex;
			flex-direction: column;
  			justify-content: space-around;
  			margin: 10px auto;
		}*/
		
		/*리스트 내용*/
		#list_head{
			border-bottom: 4px solid #000;
		}
		.management_list th{
			width:12%;
			height:40px;
			line-height: 40px;
		}
		.management_list td{
			width:12%;
			height:100px;
		}
		#list_content{
			border-bottom: 1px solid #ddd;
		}
		.management_list .chat_content{
			width: 40%;
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
		<h1 id="quiz_list_title">채팅 관리</h1>
		
		<div class="col-sm-12">
			<table id="example" class="display" style="width:100%">
		        <thead id="list_head">
		            <tr class="management_list">
		                <th class="reported_id">신고받은 ID</th>
		                <th class="user_id">신고한 ID</th>
		                <th class="chat_content">채팅 내용</th>
		                <th class="report_count">신고횟수</th>
		                <th class="suspend_button"></th>
		            </tr>
		        </thead>
		        <tbody id = "list_content">
		        	<tr class="management_list">
		        		<td class="reported_id">신고받은 ID</td>
		                <td class="user_id">신고한 ID</td>
		                <td class="chat_content">
		                	<div class="origin">
		                		sdf
		                	</div>
		                	<div class="translation">
		                		asdfsadfsadfsaf
		                	</div>
		                </td>
		                <td class="report_count">신고횟수</td>
		                <td class="suspend_button"><input type="button" value="계정정지"></td>

		        	</tr>
		        </tbody>
		    </table>
		</div>

	</div>
</div>
</body>
</html>