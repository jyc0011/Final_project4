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

        .friend-card {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .friend-avatar {
            margin-right: 10px;
        }

        .friend-info {
            flex-grow: 1;
        }

        .btn-action {
            margin-left: 5px;
        }

        .list-inline li a {
            text-decoration: none;
            color: black;
            font-size: 20px;
        }
    </style>
    <script>
        $(function () {
            // 차단 해제
            $(document).on('click', '#unlock', function () {
                var block_id = $("#block_id").val();
                var user_id = $(this).attr("title");
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/mypage/unlock',
                    type: 'GET',
                    data: {
                        block_id: block_id,
                        user_id: user_id
                    },
                    success: function (response) {
                        document.location.reload();
                    },
                    error: function (error) {
                        console.log("An error occurred: " + error.responseText);
                    }
                });
            })
        });
    </script>
</head>

<body>
<div id="wrapper" class="container-fluid">
    <div id="sidebar">
        <br/>
        <ul class="sidebar-menu">
            <li><a href="${pageContext.servletContext.contextPath}/mypage/change_user">회원정보 수정</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/post_user">작성한글</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/friend_user" class="active">친구관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/save_user">저장소</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user">탈퇴하기</a></li>
        </ul>
    </div>
    <div id="content" class="col-10">
        <ul class="list-inline">
            <li class="list-inline-item">
                <a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구 목록</a>
            </li>
            <li class="list-inline-item">
                <a href="${pageContext.servletContext.contextPath}/mypage/blocklist">차단 목록</a>
            </li>
        </ul>
        <hr/>
        <c:forEach var="blist" items="${blist}">
            <div class="friend-card">
                <div class="friend-avatar">
                    <img src="${pageContext.servletContext.contextPath}/image/profile/user.png" alt="Friend's Avatar"
                         class="rounded-circle" style="width: 50px; height: 50px;">
                </div>
                <div class="friend-info">
                    <input type="hidden" name="block_id" id="block_id" value="${blist.block_id}"/>
                    <strong>${blist.user_name}</strong>
                    <p>${blist.block_reason}</p>
                </div>
                <div>
                    <button type="button" class="btn btn-outline-secondary btn-action" id="unlock"
                            title="${blist.user_id}">차단해제
                    </button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>