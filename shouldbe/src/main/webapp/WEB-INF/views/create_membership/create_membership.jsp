<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  	<style>
  		main{
			width: 1200px;
			margin: 0 auto;
  		}
  		h1{
  			text-align: center;
  		}
  		#create_Form>ul>li{
  			list-style-type: none;
  		}
  		.submitbtn{
			background-color: #FFB300;
			border: none;
			color: white;
		}
		#username, #userid, #userpwd, #userpwdCheck, #email, #authenticate{
			width: 400px;
			height: 40px;
		}
		#create_Form{
			margin-left: 350px;
		}
		#join, #cancel{
			float: left;
			width: 100px;
			height: 40px;
		}
		#join{
			margin-right: 200px;
		}
		#authenticate, #userid, #email{
			float: left;
		}
		#checkcode, #idcheck, #sendcode{
			margin: 10px;
		}
  	</style>
  	<script>
  		function checkpwd(){
  			if(document.getElementById("userpwd").value != "" && document.getElementById("userpwdCheck").value != ""){
  				if(document.getElementById("userpwd").value == document.getElementById("userpwdCheck").value){
  					document.getElementById("passwordCheckOk").innerHTML="비밀번호가 일치합니다.";
  					document.getElementById("passwordCheckOk").style.color="blue";
  				}else{
  					document.getElementById("passwordCheckOk").innerHTML="비밀번호가 일치하지 않습니다.";
  					document.getElementById("passwordCheckOk").style.color="red";
  				}
  			}
  		}
  		$(function(){
  			$("#sendcode").on('click', function(){
  				$("#authenticate").css('display', '');
  				$("#checkcode").css('display', '');
  			});
  		});
  	</script>
</head>
<body>
	<main>
		<h1>회원가입</h1>
		<form method="post" action="/createOk" id="create_Form">
			<ul>
				<li><label>이름</label></li>
				<li><input type="text" id="username" name="username"/></li>
				<li><label>아이디</label></li>
				<li><input type="text" id="userid" name="userid"/></li>
				<li><input type="button" value="아이디체크" id="idcheck" class="submitbtn"/>
				<li><label>비밀번호</label></li>
				<li><input type="password" id="userpwd" name="userpwd" onchange="checkpwd()"/></li>
				<li><label>비밀번호 확인</label></li>
				<li><input type="password" id="userpwdCheck" name="userpwdCheck" onchange="checkpwd()"/></li>
				<li><span id="passwordCheckOk"></span></li>
				<li><label>이메일</label></li>
				<li><input type="text" id="email" name="email"/></li>
				<li><input type="button" value="인증발송" id="sendcode" class="submitbtn"/>
				<li><input type="text" id="authenticate" name="authenticate" style="display: none;"/></li>
				<li><input type="button" value="인증하기" id="checkcode" class="submitbtn" style="display: none;"/>
				<li><label>사용언어</label></li>
				<li>
					한국어 <input type="checkbox" id="lang" name="lang"/>
					일본어 <input type="checkbox" id="lang" name="lang"/>
					영어 <input type="checkbox" id="lang" name="lang"/>
				</li>
				<li><label style="float: left; margin-right: 10px;">국적</label></li>
				<li>
					<select id="nation" name="nation">
						<option value="kor">한국</option>
						<option value="eng">미국</option>
						<option value="jpn">일본</option>
					</select>
				</li>
				<li><label style="float: left; margin-right: 10px;">성별</label></li>
				<li>
					남자 <input type="radio" id="sex" name="sex"/>
					여자 <input type="radio" id="sex" name="sex"/>
				</li>
				<li><input type="submit" value="가입하기" id="join" class="submitbtn"/></li>
				<li><input type="button" value="취소" id="cancel" class="submitbtn"/></li>
			</ul>
		</form>
	</main>
</body>
</html>