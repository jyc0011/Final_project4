<<<<<<< HEAD
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
	</style>
</head>
<body>

</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
				#wrapper {
					max-width: 1200px;
					margin: auto;
					display: flex;
				}

				#sidebar {
					padding: 20px;
					width: 20%;
					height: 100vh;
					border-right: 1px solid #ccc;
				}

				#content {
					padding: 20px;
					width: 80%;
				}

				.sidebar-menu {
					list-style-type: none;
					padding: 0;
				}

				.sidebar-menu li a {
					text-decoration: none;
					color: black;
					display: block;
					padding: 10px;
					transition: all 0.3s;
				}

				.sidebar-menu li a:hover {
					background-color: #ddd;
				}

				.active {
					background-color: #ffe3a0;
					color: white;
				}

				.list-inline li a {
					text-decoration: none;
					color: black;
					font-size: 20px;
				}

				.post-card {
					background-color: #fff8dc;
					border: 1px solid #ccc;
					padding: 15px;
					margin-bottom: 15px;
					box-shadow: 0 2px 4px rgba(0, 0, 0, .1);
				}

				.pagination {
					justify-content: center;
				}
			</style>
		</head>

		<body>
			<jsp:include page="${pageContext.servletContext.contextPath}/resources/header.jsp" />
			<div id="wrapper" class="container-fluid">
				<div id="sidebar">
					<br />
					<ul class="sidebar-menu">
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/change_user">회원정보 수정</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/post_user">작성한글</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구관리</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user">탈퇴하기</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/save_user" class="active">저장소</a></li>
					</ul>
				</div>
				<div id="content">
					<ul class="list-inline">
						<li class="list-inline-item"><a href="#">채팅 저장소</a></li>
						<li class="list-inline-item"><a href="#">퀴즈 저장소</a></li>
					</ul>
					<hr />
					<div class="col-md-4">
						<div class="post-card">
							<strong>I want to learn Korean happily!</strong>
							<p>즐겁게 한국어를 배우고 싶어요!</p>
						</div>
					</div>
					<!-- Repeat for other posts -->
				</div>
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>
			<jsp:include page="${pageContext.servletContext.contextPath}/resources/footer.jsp" />
		</body>

		</html>
>>>>>>> upstream/main
