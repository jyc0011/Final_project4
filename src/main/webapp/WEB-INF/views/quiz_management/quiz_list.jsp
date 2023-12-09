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
            height: 1000px;
            margin: 50px auto;

        }

        #quiz_list_title {
            text-align: center;
            margin-bottom: 30px;
        }

        /*#quiz_grade{
            display: flex;
            flex-direction: column;
              justify-content: space-around;
              margin: 10px auto;
        }*/

        .quiz_list {
            display: flex;
            justify-content: space-around;
        }

        #quiz_list_title {
            text-align: center;
            border-bottom: 4px solid #000;
        }

        .qqlist {
            width: 300px;
            height: 500px;
            border: 3px solid #000;
            margin: 0 5px;
            overflow-y: scroll;
        }

        .list_head {
            border-bottom: 3px solid #000;
            background-color: #ddd;
            text-align: center;
        }

        .management_list {
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .list_content {
            border-bottom: 1px solid #ddd;

        }

        .quiz_content {
            width: 50%;
        }

        h1 {
            padding-bottom: 20px;
        }

        #side_menu li a.active{
            background-color: #333333;
            color: white;
        }

    </style>
    <script>
        function EditDelBtn() {
            location.href = "${pageContext.servletContext.contextPath}/admin/quiz_edit";
        }
    </script>
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
        <h1 id="quiz_list_title">퀴즈 관리</h1>
        <div class="quiz_list">
            <!-- 쉬움 -->
            <div class="qqlist" id="quiz_easy">
                <table class="display" style="width:100%">
                    <thead class="list_head">
                    <tr class="management_list">
                        <th class="lise_number">NO</th>
                        <th class="quiz_content">단어</th>
                        <th class="edit_button">수정</th>
                    </tr>
                    </thead>
                    <tbody class="list_content">
                    <c:forEach var="qVO1" items="${quizlist1}" varStatus="status">
                        <tr class="management_list">
                            <td class="lise_number">${status.count}</td>
                            <td class="quiz_content">${qVO1.quiz_content}</td>
                            <td class="edit_button">
                                <a href="${pageContext.servletContext.contextPath}/admin/quiz_edit?quiz_id=${qVO1.quiz_id}">
                                    <input type="button" value="수정/삭제" class="btn btn-dark">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 중간 -->
            <div class="qqlist" id="quiz_medium">
                <table class="display" style="width:100%">
                    <thead class="list_head">
                    <tr class="management_list">
                        <th class="lise_number">NO</th>
                        <th class="quiz_content">단어</th>
                        <th class="edit_button">수정</th>
                    </tr>
                    </thead>
                    <tbody class="list_content">
                    <c:forEach var="qVO2" items="${quizlist2}" varStatus="status">
                        <tr class="management_list">
                            <td class="lise_number">${status.count}</td>
                            <td class="quiz_content">${qVO2.quiz_content}</td>
                            <td class="edit_button">
                                <a href="${pageContext.servletContext.contextPath}/admin/quiz_edit?quiz_id=${qVO2.quiz_id}">
                                    <input type="button" value="수정/삭제" class="btn btn-dark">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 어려움 -->
            <div class="qqlist" id="quiz_hard">
                <table class="display" style="width:100%">
                    <thead class="list_head">
                    <tr class="management_list">
                        <th class="lise_number">NO</th>
                        <th class="quiz_content">단어</th>
                        <th class="edit_button">수정</th>
                    </tr>
                    </thead>
                    <tbody class="list_content">
                    <c:forEach var="qVO3" items="${quizlist3}" varStatus="status">
                        <tr class="management_list">
                            <td class="lise_number">${status.count}</td>
                            <td class="quiz_content">${qVO3.quiz_content}</td>
                            <td class="edit_button">
                                <a href="${pageContext.servletContext.contextPath}/admin/quiz_edit?quiz_id=${qVO3.quiz_id}">
                                    <input type="button" value="수정/삭제" class="btn btn-dark">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
