<%--
  Created by IntelliJ IDEA.
  User: cje
  Date: 2023-12-05
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>New Chat Partners</title>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 4px;
            background-color: #fafafa;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .user-list {
            list-style-type: none;
            padding: 0;
        }

        .user-list li {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-list li a {
            text-decoration: none;
            color: #5cb85c; /* Bootstrap 'success' color */
            padding: 5px 10px;
            border: 1px solid #5cb85c;
            border-radius: 4px;
        }

        .user-list li a:hover {
            background-color: #5cb85c;
            color: #fff;
        }

        .pagination {
            justify-content: center;
        }

        .pagination .page-link {
            color: black;
            text-decoration: none;
            background-color: transparent;
        }

        .pagination .page-link.active {
            background-color: #ffe3a0;
            color: black;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Find New Chat Partners</h2>
    <ul class="user-list">
        <c:forEach var="user" items="${potentialChatPartners}">
            <li>
                <span>${user.userName}</span>
                <a href="${pageContext.request.contextPath}/chat/start?userId=${user.userId}">Start Chat</a>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="pagination-container" style="margin: 0 auto; margin-top: 20px; width: fit-content">
    <div class="pagination" style="display: flex">
        <div class="paging">
            <ul class="pagination justify-content-center d-flex">
                <c:if test="${pVO.nowPage > 1}">
                    <li class="page-item"><a class="page-link" href="'?page=${pVO.nowPage - 1}'"><
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
                    <li class="page-item"><a class="page-link" href="'?page=${pVO.nowPage + 1}'">>
                    </a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
