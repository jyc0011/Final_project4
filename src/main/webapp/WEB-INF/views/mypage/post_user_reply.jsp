<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>작성한글</title>
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
    </style>
</head>

<body>
<div id="wrapper" class="container-fluid">
    <div id="sidebar">
        <br/>
        <ul class="sidebar-menu">
            <li><a href="${pageContext.servletContext.contextPath}/mypage/change_user">회원정보 수정</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/post_user" class="active">작성한글</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/save_user">저장소</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user">탈퇴하기</a></li>
        </ul>
    </div>
    <div id="content">
        <ul class="list-inline">
            <li class="list-inline-item"><a href="${pageContext.servletContext.contextPath}/mypage/post_user">작성 글</a>
            </li>
            <li class="list-inline-item"><a href="${pageContext.servletContext.contextPath}/mypage/post_user/reply">작성
                댓글</a></li>
        </ul>
        <hr/>
        <table class="table">
            <thead>
            <tr>
                <th>댓글번호</th>
                <th>댓글작성 글</th>
                <th>댓글내용</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <!-- ajax로 세팅변경 -->
            <c:forEach var="rVO" items="${list}">
                <tr>
                    <td>${rVO.post_id}</td>
                    <td>${rVO.comment_id}</td>
                    <td><a href="${pageContext.servletContext.contextPath}/board/${rVO.board_cat}/view?no=${rVO.post_id}">${rVO.content}</a></td>
                    <td>${rVO.write_date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>