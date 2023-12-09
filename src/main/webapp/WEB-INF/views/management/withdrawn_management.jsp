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
        }

        .withdrawn {
            float: right;
        }

        .withdraw_button {
            background-color: black;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 20px 0;
        }

        .withdraw_button:hover {
            background-color: white;
            color: black;
        }

        .withdraw_btn:hover {
            background-color: white;
            color: black;
        }

        .withdraw_btn {
            background-color: black;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #list_head {
            margin-top: 30px;
            padding-bottom: 40px;
            border-top: 4px solid #000;
            border-bottom: 4px solid #000;
        }

        .management_list th {
            width: 14%;
            height: 50px;
            line-height: 50px;
            text-align:center;
        }

        .management_list td {
            width: 14%;
            height: 75px;
            text-align:center;
        }

        #list_content {
            border-bottom: 1px solid #ddd;
        }

        .pagination {
            justify-content: center;
        }

        .pagination .page-link {
            color: black;
            text-decoration: none;
            background-color: transparent;
        }

        #side_menu li a.active{
            background-color: #333333;
            color: white;
        }

        /* Style for the active page link */
        .pagination .page-link.active {
            background-color: #ffe3a0;
            color: black;
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
            <li><a href="${pageContext.servletContext.contextPath}/admin/withdrawn/management" class="active">탈퇴회원관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/board">게시글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/reply">댓글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/quiz/list">퀴즈관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/chat/management">채팅관리</a></li>

        </ul>
    </div>
    <div id="member_management">
        <h1 id="quiz_list_title">탈퇴 회원 관리</h1>
        <form class="withdrawn" action="/admin/withdrawn/all" method="get">
            <button type="submit" class="withdraw_button">유예 기한 만료 회원 전부 탈퇴</button>
        </form>

        <div class="col-sm-12">
            <table id="example" class="display" style="width:100%">
                <thead id="list_head">
                <tr class="management_list">
                    <th class="user_name">닉네임</th>
                    <th class="user_id">아이디</th>
                    <th class="time">가입일</th>
                    <th class="withdrawn_date">탈퇴일</th>
                    <th class="writing_count">작성글/댓글 수</th>
                    <th class="report_count">신고횟수</th>
                    <th class="withdraw">탈퇴처리</th>
                </tr>
                </thead>
                <tbody id="list_content">
                <c:forEach var="awVO" items="${awlist}">
                    <tr class="management_list">
                        <td class="user_name">${awVO.user_name}</td>
                        <td class="user_id">${awVO.user_id}</td>
                        <td class="time">${awVO.time}</td>
                        <td class="withdrawn_date">${awVO.withdrawn_time}</td>
                        <td class="writing_count">${awVO.posts_count}/${awVO.comments_count}</td>
                        <td class="report_count">${awVO.count_report}</td>
                        <td class="withdraw">
                            <form action="/admin/withdrawn/personal" method="post">
                                <input type="hidden" name="userId" value="${awVO.user_id}"/>
                                <button type="submit" class="withdraw_btn">
                                    바로 탈퇴
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <div class="pagination-container" style="margin: 0 auto; margin-top: 20px; width: fit-content">
                <div class="pagination" style="display: flex">
                    <div class="paging">
                        <ul class="pagination justify-content-center d-flex">
                            <c:if test="${pVO.nowPage > 1}">
                                <li class="page-item"><a class="page-link"
                                                         href="${pageContext.request.contextPath}/admin/withdrawn/management?page=${pVO.nowPage - 1}"><
                                </a></li>
                            </c:if>
                            <c:forEach var="i" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount - 1}">
                                <c:if test="${i <= pVO.totalPage}">
                                    <c:choose>
                                        <c:when test="${i != pVO.nowPage}">
                                            <li class="page-item"><a class="page-link" href='?page=${i}'>${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link active" href="">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pVO.nowPage < pVO.totalPage}">
                                <li class="page-item"><a class="page-link"
                                                         href="${pageContext.request.contextPath}/admin/withdrawn/management?page=${pVO.nowPage + 1}">>
                                </a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>