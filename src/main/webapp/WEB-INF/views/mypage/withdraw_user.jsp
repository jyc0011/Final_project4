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
            width: 100%;
        }

        #withdraw-div {
            margin-top: 100px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
    </style>
    <script>
        function confirmDeletion() {
            var password = $('#password').val();
            var password_confirm = $('#password-confirm').val();
            var userConfirmed;
            if (password != password_confirm) {
                alert("비밀번호가 일치하지 않습니다. 다시입력하세요.");
                return false;
            } else if (password == "") {
                alert("비밀번호를 입력해주세요.");
                return false;
            } else {
                userConfirmed = confirm("정말 탈퇴하시겠습니까?");
            }

            if (userConfirmed) {
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/mypage/withdrawOk',
                    type: "GET",
                    data: {
                        password: password

                    }
                });
            }
        }
    </script>
</head>

<body>
<div id="wrapper" class="container-fluid">
    <div id="sidebar">
        <ul class="sidebar-menu">
            <li><a href="${pageContext.servletContext.contextPath}/mypage/change_user">회원정보 수정</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/post_user">작성한글</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/save_user">저장소</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user" class="active">탈퇴하기</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="account-deletion-form">
            <div id="withdraw-div">
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요"
                           style="width: 300px">
                </div>
                <div class="mb-3">
                    <label for="password-confirm" class="form-label">비밀번호확인</label>
                    <input type="password" class="form-control" id="password-confirm" placeholder="비밀번호를 다시 입력하세요"
                           style="width: 300px">
                </div>
                <button type="button" class="btn btn-warning" onclick="confirmDeletion()" style="width: auto">탈퇴하기
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>