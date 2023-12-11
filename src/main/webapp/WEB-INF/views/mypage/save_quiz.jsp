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
            display: flex;
            flex-direction: column;
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
            font-weight: bold;
        }

        .post-card {
            background-color: #fff8dc;
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, .1);
        }

        #now{
            font-weight: bold;
            text-decoration-line: underline;
            text-decoration-color: #ffe3a0;
            text-decoration-thickness: 3px;
            padding-top: 2px;
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
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var listItems = document.querySelectorAll('#content .list-inline-item a');
            listItems.forEach(function (item) {
                item.addEventListener('click', function () {
                    listItems.forEach(function (i) {
                        i.classList.remove('emphasized');
                    });
                    this.classList.add('emphasized');
                });
            });
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
            <li><a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/save_chat" class="active">저장소</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user">탈퇴하기</a></li>
        </ul>
    </div>
    <div id="content">
        <div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="${pageContext.servletContext.contextPath}/mypage/save_chat">채팅
                    저장소</a>
                </li>
                <li class="list-inline-item"><a href="${pageContext.servletContext.contextPath}/mypage/save_quiz" id="now">퀴즈
                    저장소</a>
                </li>
            </ul>
            <div class="col-md-4">
                <c:forEach var="saveQuiz" items="${saveQuiz}">
                <div class="post-card">
                        <strong>${saveQuiz.quiz_content}</strong>
                        <p>${saveQuiz.answer}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div>
            <div>
                <div class="pagination-container" style="margin: 0 auto; margin-top: 20px; width: fit-content">
                    <div class="pagination" style="display: flex">
                        <div class="paging">
                            <ul class="pagination justify-content-center d-flex">
                                <c:if test="${pVO.nowPage > 1}">
                                    <li class="page-item"><a class="page-link" href="?page=${pVO.nowPage - 1}"><
                                    </a></li>
                                </c:if>
                                <c:forEach var="i" begin="${pVO.startPage}"
                                           end="${pVO.startPage + pVO.onePageCount - 1}">
                                    <c:if test="${i <= pVO.totalPage}">
                                        <c:choose>
                                            <c:when test="${i != pVO.nowPage}">
                                                <li class="page-item"><a class="page-link" href='?page=${i}'>${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item"><a class="page-link active" href="">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${pVO.nowPage < pVO.totalPage}">
                                    <li class="page-item"><a class="page-link" href="?page=${pVO.nowPage + 1}">>
                                    </a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>