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
  	</style>
</head>
<body>
	<jsp:include page="${pageContext.servletContext.contextPath}/resources/header.jsp" />
	<main>
        <h1>퀴즈 등록하기</h1>
        <hr/>
        <form method="post" action="/quiz_createOk" id="quiz_createForm">
            <input type="text"/>
            <input type="text"/>
            <input type="submit" value="제출하기"/>
        </form>
	</main>
	<jsp:include page="${pageContext.servletContext.contextPath}/resources/footer.jsp" />
</body>
</html>