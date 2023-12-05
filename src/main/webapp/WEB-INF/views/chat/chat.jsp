<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Chating</title>
    <style>
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
        }

        body {
            margin: 0;
            padding: 0;
            font-weight: 400;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 1rem;
            line-height: 1.58;
            height: 100%;
        }

        .clearfix:after {
            display: block;
            content: "";
            clear: both;
        }

        .hidden {
            display: none;
        }

        .form-control {
            width: 100%;
            min-height: 38px;
            font-size: 15px;
            border: 1px solid #c8c8c8;
        }

        .form-group {
            margin-bottom: 15px;
        }

        input {
            padding-left: 10px;
            outline: none;
        }

        h1, h2, h3, h4, h5, h6 {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 1.7em;
        }

        button {
            box-shadow: none;
            border: 1px solid transparent;
            font-size: 14px;
            outline: none;
            line-height: 100%;
            white-space: nowrap;
            vertical-align: middle;
            padding: 0.6rem 1rem;
            border-radius: 2px;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
            min-height: 38px;
        }

        #chat-page {
            position: relative;
            height: 100%;
        }

        .chat-container {
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            background-color: #fff;
            margin-top: 30px;
            height: calc(100% - 60px);
            max-height: 600px;
            position: relative;
        }

        #chat-page ul {
            list-style-type: none;
            background-color: #FFF;
            margin: 0;
            overflow: auto;
            overflow-y: scroll;
            padding: 0 20px 0px 20px;
            height: calc(100% - 150px);
        }

        #chat-page #messageForm {
            padding: 20px;
        }

        #chat-page ul li {
            line-height: 1.5rem;
            padding: 10px 20px;
            margin: 0;
            border-bottom: 1px solid #f4f4f4;
        }

        #chat-page ul li p {
            margin: 0;
        }

        #chat-page .event-message {
            width: 100%;
            text-align: center;
            clear: both;
        }

        #chat-page .event-message p {
            color: #777;
            font-size: 14px;
            word-wrap: break-word;
        }

        #chat-page .chat-message {
            padding-left: 68px;
            padding-right: 68px;
            position: relative;
        }

        #chat-page .message-others img {
            position: absolute;
            width: 42px;
            height: 42px;
            overflow: hidden;
            left: 10px;
            display: inline-block;
            vertical-align: middle;
            font-size: 18px;
            line-height: 42px;
            color: #fff;
            text-align: center;
            border-radius: 50%;
            font-style: normal;
            text-transform: uppercase;
        }

        #chat-page .message-mine img {
            position: absolute;
            width: 42px;
            height: 42px;
            overflow: hidden;
            right: 10px;
            display: inline-block;
            vertical-align: middle;
            font-size: 18px;
            line-height: 42px;
            color: #fff;
            text-align: center;
            border-radius: 50%;
            font-style: normal;
            text-transform: uppercase;
        }

        #chat-page .chat-message span {
            color: #333;
            font-weight: 600;
        }

        #chat-page .chat-message p {
            color: #43464b;
        }

        .message-mine {
            text-align: right;
        }

        .message-mine > i {
            float: right;
        }


        #messageForm .input-group input {
            float: left;
            width: calc(100% - 85px);
        }

        #messageForm .input-group button {
            float: left;
            width: 80px;
            height: 38px;
            margin-left: 5px;
        }

        .chat-header {
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid #ececec;
        }

        .chat-header h2 {
            margin: 0;
            font-weight: 500;
        }

        .connecting {
            padding-top: 5px;
            text-align: center;
            position: absolute;
            top: 65px;
            width: 100%;
        }
    </style>
</head>

<body>
<div id="chat-page">
    <div class="chat-container">
        <div class="chat-header">
            <c:choose>
                <c:when test="${(message.is_from_id == 1 and userId == fromId) or (message.is_from_id == 0 and userId != fromId)}">
                    <h2>${userId}님과의 채팅방</h2>
                </c:when>
                <c:otherwise>
                    <h2>${otherId}님과의 채팅방</h2>
                </c:otherwise>
            </c:choose>
        </div>
        <ul id="messageArea">
            <div class="chat-messages">
                <c:forEach var="message" items="${pastMessages}">
                    <c:choose>
                        <c:when test="${(message.is_from_id == 1 and userId == fromId)
                        or (message.is_from_id == 0 and userId != fromId)}">
                            <li class="message-mine chat-message">
                                <div class="text-container">
                                    <span class="username">${userId}</span>
                                    <i style="position: absolute; width: 42px; height: 42px; right: 10px;">
                                        <img src="${profile_img}" style="width: 100%; height: 100%; object-fit: cover;">
                                    </i>
                                    <p>${message.content}</p>
                                    <p>${message.send_date}</p>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="message-others chat-message">
                                <div class="text-container">
                                    <span class="username">${otherId}</span>
                                    <i style="position: absolute; width: 42px; height: 42px; left: 10px;">
                                        <img src="${other_profile_img}"
                                             style="width: 100%; height: 100%; object-fit: cover;">
                                    </i>
                                    <p>${message.content}</p>
                                </div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </ul>
        <form id="messageForm" name="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off"
                           class="form-control"/>
                    <button type="submit" class="primary">Send</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    var chatPage = document.querySelector('#chat-page');
    var messageForm = document.querySelector('#messageForm');
    var messageInput = document.querySelector('#message');
    var messageArea = document.querySelector('#messageArea');
    var connectingElement = document.querySelector('.connecting');
    const fromId = "${fromId}";
    const chatId = ${chatId};
    var username = "${userId}";
    var stompClient = null;
    const userProfileImage = "${profile_img}";
    const otherUserProfileImage = "${other_profile_img}";

    function connect() {
        console.log("Connect");
        console.log("Username:", username);
        if (username) {
            chatPage.classList.remove('hidden');

            var socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);
            console.log("Connect");
            stompClient.connect({}, onConnected, onError);
        }
    }

    function onConnected() {
        console.log("Connected to WebSocket");
        stompClient.subscribe('/topic/public/${chatId}', onMessageReceived);
    }

    function onError(error) {
        console.error("WebSocket Error", error);
        connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
        connectingElement.style.color = 'red';
    }

    function sendMessage(event) {
        var messageContent = messageInput.value.trim();
        if (messageContent && stompClient) {
            var chatMessage = {
                chat_id:chatId,
                sender: username,
                content: messageInput.value,
                from_id: fromId
            };
            stompClient.send('/app/chat.sendMessage/${chatId}', {}, JSON.stringify(chatMessage));
            messageInput.value = '';
        }
        event.preventDefault();
    }

    function onMessageReceived(payload) {
        const message = JSON.parse(payload.body);
        const messageElement = document.createElement('li');
        const avatarElement = document.createElement('img');
        avatarElement.src = message.sender === username ? userProfileImage : otherUserProfileImage;
        avatarElement.style.width = '42px';
        avatarElement.style.height = '42px';
        avatarElement.style.borderRadius = '50%';
        avatarElement.style.objectFit = 'cover';
        messageElement.classList.add('chat-message');
        const textContainer = document.createElement('div');
        textContainer.classList.add('text-container');
        const usernameElement = document.createElement('span');
        const usernameText = document.createTextNode(message.sender);
        usernameElement.appendChild(usernameText);
        messageElement.appendChild(usernameElement);
        messageElement.classList.add(message.sender === username ? 'message-mine' : 'message-others');
        messageElement.appendChild(avatarElement);

        const textElement = document.createElement('p');
        const messageText = document.createTextNode(message.content);
        textElement.appendChild(messageText);

        messageElement.appendChild(textElement);
        messageArea.appendChild(messageElement);
        messageArea.scrollTop = messageArea.scrollHeight;
    }

    connect();
    messageForm.addEventListener('submit', sendMessage, true)
    messageArea.scrollTop = messageArea.scrollHeight;
</script>
</body>
</html>
