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
			border: 3px solid #000;
			margin:0 5px;
			overflow-y:scroll;
		}
		
		/*단어리스트*/
		#list_head{
			border-bottom: 3px solid #000;
			background-color: #ddd;
		}
		.management_list th{
		}
		.management_list td{
		}
		#list_content{
			border-bottom: 1px solid #ddd;

		}
		.quiz_content{
			width: 50%;	
		}
		
		

	</style>
	<script>
		function EditDelBtn(){
			location.href="${pageContext.servletContext.contextPath}/admin/quiz_edit";
		}
	</script>
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
		<h1 id="quiz_list_title">퀴즈 관리</h1>
		
		<div id="reg_buttons">
			<input type="button" value="관리자 퀴즈 등록" onclick="location.href='${pageContext.servletContext.contextPath}/admin/quiz/reg_manager'">
			<input type="button" value="유저 퀴즈 등록" onclick="location.href='${pageContext.servletContext.contextPath}/admin/quiz/reg_user'">
		</div>
		
		<div id="quiz_list">
		
			<!-- 쉬움 -->
			<div class="qqlist" id="quiz_easy">
				<table id="example" class="display" style="width:100%">
			        <thead id="list_head">
			            <tr class="management_list">
			                <th class="lise_number">NO</th>
			                <th class="quiz_content">단어</th>
			                <th class="edit_button">수정</th>
			            </tr>
			        </thead>
			        <tbody id = "list_content">
			        	<tr class="management_list">
			        		<td class="lise_number">No.</td>
			                <td class="quiz_content">단어</td>
			                <td class="edit_button"><input type="button" value="수정/삭제" onclick="EditDelBtn()"></td>
			        	</tr>
			        	<tr class="management_list">
			        		<td class="lise_number">No.</td>
			                <td class="quiz_content">단어</td>
			                <td class="edit_button"><input type="button" value="수정/삭제" onclick="EditDelBtn()"></td>
			        	</tr>
			        </tbody>
			    </table>
			</div>
			
			<!-- 중간 -->
			<div class="qqlist" id="quiz_easy">
				<table id="example" class="display" style="width:100%">
			        <thead id="list_head">
			            <tr class="management_list">
			                <th class="lise_number">NO</th>
			                <th class="quiz_content">단어</th>
			                <th class="edit_button">수정</th>
			            </tr>
			        </thead>
			        <tbody id = "list_content">
			        	<tr class="management_list">
			        		<td class="lise_number">No.</td>
			                <td class="quiz_content">단어</td>
			                <td class="edit_button"><input type="button" value="수정/삭제" onclick="EditDelBtn()"></td>
			        	</tr>
			        </tbody>
			    </table>
			</div>
			
			<!-- 어려움 -->
			<div class="qqlist" id="quiz_easy">
				<table id="example" class="display" style="width:100%">
			        <thead id="list_head">
			            <tr class="management_list">
			                <th class="lise_number">NO</th>
			                <th class="quiz_content">단어</th>
			                <th class="edit_button">수정</th>
			            </tr>
			        </thead>
			        <tbody id = "list_content">
			        	<tr class="management_list">
			        		<td class="lise_number">No.</td>
			                <td class="quiz_content">단어</td>
			                <td class="edit_button"><input type="button" value="수정/삭제" onclick="EditDelBtn()"></td>
			        	</tr>
			        </tbody>
			    </table>
			</div>
		</div>
	</div>
</div>
</body>
</html>
