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
        .container {
            width: 1200px;
            display: flex;
        }

        #side_menu {
            padding: 98px 0 0 0;
            width: 150px;
            height: 1000px;

        }

        #side_menu {
            list-style-type: none;
        }

        #side_menu li a {
            text-decoration: none;
            color: black;
            display: block;
            padding: 10px;
        }

        #side_menu li a:hover {
            background-color: #ddd;
        }

        #member_management {
            width: 100%;
            height: 1000px;
            margin: 50px auto;
            text-align: center;
        }

        #quiz_list_title {
            text-align: center;
            border-bottom: 4px solid #000;

        }

        /*#quiz_grade{
            display: flex;
            flex-direction: column;
              justify-content: space-around;
              margin: 10px auto;
        }
        #quiz_input{
            border:1px solid #ddd;
        }
        #quiz_reg{
            border:1px solid #ddd;
        }

        */


        #quiz_grade {
            display: flex;
            justify-content: space-around;
            margin: 10px auto;
        }

        #reg_button {
            width: 350px;
            height: 100px;
            margin: 25px auto;
            font-size: 3em;
        }

        .qqlist {
            width: 250px;
            height: 100px;
            border: 1px solid #ddd;
            font-size: 2em;
            background-color: #333333;
        }

        .quiz_txt {
            width: 700px;
            height: 120px;
            font-size: 3em;
            margin: 10px auto;
            padding: 3px 20px;
        }

        h1 {
            padding-bottom: 20px;
        }

        #side_menu > li:nth-child(7) {
            font-weight: bold;
            font-size: 18px;
        }

    </style>
</head>
<body>
<div class="container">
    <div id="side_bar">
        <ul id="side_menu">
            <li><a href="${pageContext.servletContext.contextPath}/admin">대시보드</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/member/management">현재회원관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/suspended/management">정지회원관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/withdrawn/management">탈퇴회원관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/board">게시글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/reply">댓글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/quiz/list">퀴즈관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/chat/management">채팅관리</a></li>

        </ul>
    </div>
    <div id="member_management">
        <h1 id="quiz_list_title">관리자 퀴즈 등록</h1>



        <div id="quiz_reg">
        </div>

        <form method="post" action="${pageContext.servletContext.contextPath}/quiz/reg" onsubmit="return selectCheck()">

            <div id="quiz_input">
                <input type="text" name="quiz_content" class="quiz_txt" id="quiz_content" placeholder="단어를 입력해 주세요">
                <input type="text" name="answer" class="quiz_txt" id="answer" placeholder="정답을 입력해 주세요">
            </div>

            <div id="quiz_grade">
                <button type="button" class="qqlist btn btn-secondary" id="quiz_easy" title="1">쉬움</button>
                <button type="button" class="qqlist btn btn-secondary" id="quiz_medium" title="2">중간</button>
                <button type="button" class="qqlist btn btn-secondary" id="quiz_hard" title="3">어려움</button>
            </div>

            <input
                type="hidden"
                id="level"
                value="1"
                size="20"
                maxlength="10"
                name="level"
            />

            <input
                id="reg_button"
                class="btn btn-dark"
                type="submit"
                name="reg"
                value="등록하기"
            />
        </form>

    </div>
</div>
<script>
    function selectCheck(){
        if(document.getElementById("quiz_content").value===""){
            alert("단어를 입력하세요..");
            return false;
        }
        if(document.getElementById("answer").value===""){
            alert("정답을 입력하세요..");
            return false;
        }
        return true;

        if(document.getElementById("level").value!="1"){
            alert("난이도를 선택하세요");
            return false;
        }
        return true;
    }

    $(document).on("click", "#quiz_grade>button", function () {
        $("#level").attr("value", $(this).attr("title"));
        $("button[title =" + $("#level").val() + "]")
            .css("background", "#FFD954")
            .css("border-radius", "0.3rem");
        $("button[title !=" + $("#level").val() + "]").css("background", "#333333");
    });

    $("#quiz_content").keyup(function(){
        $("#userid2").attr("value", $(this).attr("value"));
    });
    $("#answer").keyup(function(){
        $("#userid3").attr("value", $(this).attr("value"));
    });
</script>
</body>
</html>