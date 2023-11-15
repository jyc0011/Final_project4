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
</head>
<body>
	<main>
		<h1>회원가입</h1>
		<ul>
			<li><label>이름</label></li>
			<li><input type="text"/></li>
			<li><label>아이디</label></li>
			<li><input type="text"/></li>
			<li><input type="button" value="아이디체크"/>
			<li><label>비밀번호</label></li>
			<li><input type="password"/></li>
			<li><label>비밀번호 확인</label></li>
			<li><input type="password"/></li>
			<li>비밀번호가 다릅니다..</li>
			<li><label>이메일</label></li>
			<li><input type="text"/></li>
			<li><input type="button" value="인증발송"/>
			<li><input type="text"/></li>
			<li><input type="button" value="인증하기"/>
			<li><label>사용언어</label></li>
			<li>
				한국어 <input type="checkbox" id="lang" name="lang"/>
				일본어 <input type="checkbox" id="lang" name="lang"/>
				영어 <input type="checkbox" id="lang" name="lang"/>
			</li>
			<li><label>국적</label></li>
			<li>
				<select>
					<option value="kor">한국</option>
					<option value="eng">미국</option>
					<option value="jpn">일본</option>
				</select>
			</li>
			<li><label>성별</label></li>
			<li>
				남자 <input type="radio" id="sex" name="sex"/>
				여자 <input type="radio" id="sex" name="sex"/>
			</li>
			<li><input type="submit" value="가입하기"/></li>
		</ul>
	</main>
</body>
</html>