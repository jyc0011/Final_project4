<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>탈퇴하기</title>
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

			.account-deletion-form {
				width: 300px;
			}
		</style>
	</head>

	<body>
		<div id="wrapper" class="container-fluid">
			<div id="sidebar">
				<h3>회원정보수정</h3>
				<ul class="sidebar-menu">
					<li><a href="${pageContext.servletContext.contextPath}/mypage/change_user">회원정보 수정</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/mypage/post_user">작성한글</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구관리</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user" class="active">탈퇴하기</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/mypage/save_user">저장소</a></li>
				</ul>
			</div>
			<div id="content">
				<div class="account-deletion-form">
					<h2>탈퇴하기</h2>
					<div class="mb-3">
						<label for="password" class="form-label">비밀번호</label>
						<input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
					</div>
					<div class="mb-3">
						<label for="password-confirm" class="form-label">비밀번호확인</label>
						<input type="password" class="form-control" id="password-confirm" placeholder="비밀번호를 다시 입력하세요">
					</div>
					<button type="button" class="btn btn-warning" onclick="confirmDeletion()">탈퇴하기</button>
				</div>
			</div>
		</div>
	</body>
	<script>
		function confirmDeletion() {
			var userConfirmed = confirm("정말 탈퇴하시겠습니까?");

			if (userConfirmed) {
				var userId = $('#userid').val();
				var password = $('#password').val();

				// AJAX POST 요청
				$.ajax({
					url: '/path', // URL
					type: 'POST',
					data: {
						userid: userId, // 아이디
						password: password // 비밀번호
					},
					success: function (response) {
						if (response.success) {
							alert("탈퇴완료");
						} else {
							alert("탈퇴에 실패하였습니다.");
						}
					},
					error: function (xhr, status, error) {
						alert("오류가 발생했습니다: " + error);
					}
				});
			}
		}
	</script>

	</html>