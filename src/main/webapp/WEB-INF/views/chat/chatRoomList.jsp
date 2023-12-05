<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="today" class="java.util.Date"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chat Rooms</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 10px;
            font-family: 'Arial', sans-serif;
        }

        .container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .chat-room-list {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .chat-room-list a li {
            border: 1px solid #eee;
            padding: 15px;
            transition: background-color 0.2s;
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
        }

        .chat-room-list a li:hover {
            background-color: #f7f7f7;
        }

        .chat-room-list a {
            text-decoration: none;
            color: black;
            font-size: 1.1em;
            font-weight: bold;
            flex-grow: 1; /* Allows the link to fill the space */
        }

        .chat-details {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            color: #333;
        }

        .chat-last-content {
            font-size: 1.5em;
            margin-bottom: 4px;
            display: flex;
            justify-content: flex-end;
            width: 100%;
        }

        .unread-count {
            color: #784214;
            margin-left: 50px;
        }

        .last-message-time {
            color: grey;
            font-size: 0.9em;
            margin-top: 4px;
        }

        .chat-details div {
            margin-top: 5px;
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
    <h2>Your Chat Rooms</h2>
    <ul class="chat-room-list">
        <c:forEach var="chatRoom" items="${chatRoom}">
            <a href="${pageContext.request.contextPath}/chat?chat_id=${chatRoom.chat_id}&other_user_id=${
            chatRoom.from_id != myId ? chatRoom.from_id : chatRoom.to_id}&from_id=${chatRoom.from_id}">
                <li>
                    <c:choose>
                        <c:when test="${chatRoom.from_id != myId}">
                            ${chatRoom.from_id}
                        </c:when>
                        <c:otherwise>
                            ${chatRoom.to_id}
                        </c:otherwise>
                    </c:choose>

                    <div class="chat-details">
                        <div class="chat-last-content">
                            <div>${chatRoom.last_content}</div>
                            <div class="unread-count"> ${chatRoom.not_read}</div>
                        </div>
                        <div class="last-message-time">Last message time: ${chatRoom.last_time}</div>
                    </div>
                </li>
            </a>
        </c:forEach>
    </ul>

    <div>
        <div>
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
        </div>
    </div>
</div>
</body>
</html>