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
        #loginForm > ul > li,
        #link > ul > li {
            list-style-type: none;
            text-align: center;
        }
        ul{
            padding: 0;
        }

        #link {
            margin-top: 30px;
            width: 500px;
            height: 50px;
        }

        #link > ul > li {
            float: left;
            border-right: 2px solid #ddd;
            width: 33%;
            text-align: center;
        }

        #link > ul > li:last-child {
            border-right: none;
        }

        #link > ul > li > a {
            text-decoration: none;
            color: black;
        }

        #logo {
            margin-bottom: 30px;
            width: 300px;
        }

        main {
            width: 1200px;
            margin: 0 auto;
            padding: 100px 0;
            display: flex;
            justify-content: center;
            justify-items: center;
            flex-direction: column;
            align-items: center;
        }
        .box{
            display: flex;
        }
        #userpwd,
        #userid {
            margin-top: 5px;
            margin-bottom: 5px;
            width: 400px;
            height: 40px;
            line-height: 40px;
        }

        .submitBtn {
            background-color: #FFB300;
            border: none;
            color: white;
        }

        #login {
            margin-top: 30px;
            margin-bottom: 10px;
            width: 400px;
        }
        #loginForm{
        }

        .input-container{
            position:relative;
            margin-bottom:25px;
        }
        .input-container label{
            position:absolute;
            top:0px;
            left:0px;
            font-size:16px;
            pointer-event:none;
            transition: all 0.5s ease-in-out;
        }
        .input-container input{
            border:0;
            border-bottom:1px solid #555;
            background:transparent;
            width:100%;
            padding:8px 0 5px 0;
            font-size:16px;
        }
        .input-container input:focus{
            border:none;
            outline:none;
            border-bottom:1px solid #e74c3c;
        }
        .btn{
            color:#fff;
            outline: none;
            border: 0;
            color: #fff;
            padding:10px 20px;
            text-transform:uppercase;
            margin-top:20px;
            border-radius:2px;
            cursor:pointer;
            position:relative;
        }
        /*.btn:after{
            content:"";
            position:absolute;
            background:rgba(0,0,0,0.50);
            top:0;
            right:0;
            width:100%;
            height:100%;
        }*/
        .input-container input:focus ~ label,
        .input-container input:valid ~ label{
            top:-12px;
            font-size:12px;

        }
    </style>
    <script>
        $(document).ready(function () {
            var result = "${result}";
            if (result != "") {
                alert(result);
            }
        })
    </script>
</head>

<body style="margin: 0 auto;">
<main>
    <div class="box">
        <form method="post" action="/loginOk" id="loginForm">
            <div class="input-container">
                <input type="text" name="userid" id="userid" required=""/>
                <label>아이디</label>
            </div>
            <div class="input-container">
                <input type="password" name="userpwd" id="userpwd" required=""/>
                <label>비밀번호</label>
            </div>
            <button type="submit" name="login" id="login" class="btn btn-warning submitBtn">로그인</button>
        </form>
    </div>
    <div id="link">
        <ul>
            <li><a href="create">회원가입</a></li>
            <li><a href="login/findid">아이디찾기</a></li>
            <li><a href="login/findpwd">비밀번호찾기</a></li>
        </ul>
    </div>
</main>
</body>

</html>