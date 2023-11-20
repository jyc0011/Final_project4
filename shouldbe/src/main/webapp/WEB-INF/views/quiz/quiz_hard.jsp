<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
				body {
					margin: 0 auto;
				}

				main {
					width: 1200px;
					margin: 100px auto;
					display: flex;
					justify-content: space-around;
					align-items: center;
				}
			</style>
		</head>

		<body>
			<main>
				<h1>어려움</h1>
				<hr />
				<h2>1/10</h2>
				<b>Combination</b>
				<form method="post" action="#">
					<input type="text" placeholder="정답 입력" />
					<input type="button" value="제출" />
				</form>
			</main>
		</body>

		</html>