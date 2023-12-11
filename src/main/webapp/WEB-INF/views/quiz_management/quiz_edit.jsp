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
            padding: 98px 10px 0;
            width: 150px;
            height: 1000px;
            list-style-type: none;
            border-right: 1px solid #ddd;
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
            width: 900px;
            height: auto;
            margin: 50px auto;

        }

        #quiz_list_title {
            text-align: center;
            border-bottom: 4px solid #000;

        }

        #quiz_content {
            width: 900px;
            height: 150px;
            line-height: 150px;
            font-size: 3em;
            text-align: center;
            margin: 0 auto;
        }

        #answerlist {
            width: 900px;
            margin: 0 auto;
            padding-bottom: 30px;
        }

        #answer {
            width: 900px;
            margin: 10px auto;
            height: 60px;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            border-bottom: 1px solid #ddd;
        }

        #quiz_answer {
            width: 80%;
            height: 60px;
            font-size: 2em;

        }

        #quiz_delete {
            width: 50px;
            height: 50px;
            font-size: 2em;
        }

        h1 {
            padding-bottom: 20px;
        }

        #editDelForm {
            display: flex;
            flex-wrap: nowrap;
            align-items: center;
            justify-content: space-between;
            width: 95%;
            margin: 0;
        }

        form {
            display: flex;
            flex-wrap: nowrap;
            flex-direction: row;
            align-items: center;
        }

        #input-text {
            margin-top: 20px;
            width: 450px;
            display: flex;
            align-items: center;
        }

        label{
            margin-right: 5px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-right: 20px;
        }

        #side_menu li a.active{
            background-color: #333333;
            color: white;
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
            <li><a href="${pageContext.servletContext.contextPath}/admin/quiz/list" class="active">퀴즈관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/chat/management">채팅관리</a></li>

        </ul>
    </div>
    <div id="member_management">
        <h1 id="quiz_list_title">퀴즈 수정/삭제</h1>
        <div id="quiz_content">
            <p>${qVO.quiz_content}</p>
        </div>
        <div id="answerlist">
            <c:forEach var="eVO1" items="${editlist}" varStatus="status">
                <div id="answer">
                    <div id="quiz_answer">${eVO1.answer}</div>
                    <a href="${pageContext.servletContext.contextPath}/answerDelete?answer=${eVO1.answer}&quiz_id=${eVO1.quiz_id}"><button id="quiz_delete"> -</button></a>
                </div>
            </c:forEach>
        </div>
        <div id="editDelForm">
            <form method="post" action="${pageContext.servletContext.contextPath}/quiz/answer_insert">
                <div class="form-group">
                    <label for="answer_lang">정답 언어:</label>
                    <select id="answer_lang" name="answer_lang">
                        <option value="ko">한국어</option>
                        <option value="en">영어</option>
                        <option value="ja">일본어</option>
                        <option value="zh-CN">중국어 간체</option>
                        <option value="zh-TW">중국어 번체</option>
                        <option value="vi">베트남어</option>
                        <option value="th">태국어</option>
                        <option value="id">인도네시아어</option>
                        <option value="fr">프랑스어</option>
                        <option value="es">스페인어</option>
                        <option value="ru">러시아어</option>
                        <option value="de">독일어</option>
                        <option value="it">이탈리아어</option>
                    </select>
                </div>
                <div class="input-group mb-3" id="input-text">
                    <input type="text" name="answer" class="form-control" placeholder="추가할 뜻 작성">
                    <input type="hidden" name="quiz_id" value="${qVO.quiz_id}">
                    <button class="btn btn-dark">추가</button>
                </div>
            </form>
            <div>
                <a href="${pageContext.servletContext.contextPath}/quizDelete?quiz_id=${qVO.quiz_id}">
                    <button class="btn btn-dark">단어 삭제</button>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>