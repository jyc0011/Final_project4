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

        .submitBtn {
            background-color: #FFB300;
            border: none;
            color: white;
        }

        .input-container {
            position: relative;
            margin-bottom: 25px;
        }

        .input-container label {
            position: absolute;
            top: 0;
            left: 0;
            font-size: 16px;
            pointer-event: none;
            transition: all 0.5s ease-in-out;
        }

        .input-container input {
            border: 0;
            border-bottom: 1px solid #555;
            background: transparent;
            width: 100%;
            padding: 8px 0 5px 0;
            font-size: 16px;
            margin: 5px 0;
        }

        .input-container input:focus {
            border: none;
            outline: none;
            border-bottom: 1px solid #e74c3c;
        }

        .btn {
            color: #fff;
            outline: none;
            border: 0;
            padding: 10px 20px;
            text-transform: uppercase;
            margin-top: 30px;
            border-radius: 2px;
            cursor: pointer;
            position: relative;
        }

        .input-container input:focus ~ label,
        .input-container input:valid ~ label {
            top: -12px;
            font-size: 12px;

        }

        .box {
            display: flex;
            flex-direction: column;
            width: 400px;
        }

        .withdraw-box {
            width: 100%;
            display: flex;
            align-items: center;
            flex-direction: column;
            margin-top: 170px;
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

            if (!userConfirmed) {
                return false;
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
            <li><a href="${pageContext.servletContext.contextPath}/mypage/save_chat">저장소</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user" class="active">탈퇴하기</a></li>
        </ul>
    </div>
    <div class="withdraw-box">
        <form method="get" action="${pageContext.servletContext.contextPath}/mypage/withdrawOk">
            <input type="hidden" name="user_id" id="user_id" value="${logId}"/>
            <div class="box">
                <div class="input-container">
                    <input type="password" name="password" id="password" required=""/>
                    <label for="password" class="form-label">비밀번호</label>
                </div>
                <div class="input-container">
                    <input type="password" name="password-confirm" id="password-confirm" required=""/>
                    <label for="password" class="form-label">비밀번호 확인</label>
                </div>
                <button type="submit" class="btn btn-warning submitBtn" onclick="confirmDeletion()">탈퇴하기</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>