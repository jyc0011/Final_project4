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
            height: auto;
            margin: 50px auto;
            width: 900px;
        }

        #quiz_list_title {
            text-align: center;
            border-bottom: 4px solid #000;
            padding-bottom: 20px;
        }


        /*리스트 내용*/
        #list_head {
            border-bottom: 4px solid #000;
        }

        .management_list th {
            width: 12.5%;
            height: 40px;
            line-height: 40px;
            text-align:center;
        }

        .management_list td {
            width: 12.5%;
            height: 100px;
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

        /* Style for the active page link */
        .pagination .page-link.active {
            background-color: #ffe3a0;
            color: black;
        }

        #side_menu > li:nth-child(3) {
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
        <h1 id="quiz_list_title">정지 회원 관리</h1>

        <div class="col-sm-12">
            <table id="example" class="display" style="width:100%">
                <thead id="list_head">
                <tr class="management_list">
                    <th class="user_name">닉네임</th>
                    <th class="user_id">아이디</th>
                    <th class="time">정지일</th>
                    <th class="suspend_reason">정지사유</th>
                    <th class="writing_count">작성글/댓글 수</th>
                    <th class="report_count">신고횟수</th>
                    <th class="suspend_button">정지 해제</th>
                </tr>
                </thead>
                <tbody id="list_content">
                <c:forEach var="asVO" items="${aslist}">
                    <tr class="management_list">
                        <td class="user_name">${asVO.user_name}</td>
                        <td class="user_id">${asVO.user_id}</td>
                        <td class="time">${asVO.suspended_time}</td>
                        <th class="suspend_reason">${asVO.reason}</th>
                        <td class="writing_count">${asVO.posts_count}/${asVO.comments_count}</td>
                        <td class="report_count">${asVO.count_report}</td>
                        <td class="unsuspend_button">
                            <a href="${pageContext.servletContext.contextPath}/suspendDelete?suspended_id=${asVO.suspended_id}">
                                <input type="button" value="정지해제" class="btn btn-dark">
                            </a>
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
                                <li class="page-item"><a class="page-link" href="'?page=${pVO.nowPage - 1}'"><
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
                                <li class="page-item"><a class="page-link" href="'?page=${pVO.nowPage + 1}'">>
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
