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
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 0 auto;
            padding: 25px
        }

        .container h1 {
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 20px;
        }

        .chating {
            background-color: #000;
            width: 500px;
            height: 500px;
            overflow: auto;
        }

        .chating p {
            color: #fff;
            text-align: left;
        }

        input {
            width: 330px;
            height: 25px;
        }

        #yourMsg {
            display: none;
        }
    </style>
</head>

<script type="text/javascript">
    var ws;
    var userName = "<%= session.getAttribute("logName") %>"; // 세션에서 userName 가져오기
    var chatRoomId = "<%= session.getAttribute("chatRoomId") %>"; // 세션에서 chatRoomId 가져오기

    function wsOpen() {
        ws = new WebSocket("ws://" + location.host + "/chating");
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function (data) {
            // 소켓이 열리면 초기화 세팅
        }

        ws.onmessage = function (data) {
            var msg = data.data;
            if (msg != null && msg.trim() != '') {
                $("#chating").append("<p>" + msg + "</p>");
            }
        }

        document.addEventListener("keypress", function (e) {
            if (e.keyCode == 13) { // Enter 키 처리
                send();
            }
        });
    }

    function send() {
        var recipient = "<%= session.getAttribute("recipient") %>"; // 세션에서 recipient 가져오기
        var msg = $("#chatting").val();

        // WebSocket을 통한 메시지 전송
        ws.send(recipient + ":" + userName + " : " + msg);

        // Ajax를 통한 메시지 저장
        $.ajax({
            url: '/chat/message/save',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                chatRoomId: chatRoomId,
                senderId: userName,
                recipientId: recipient,
                content: msg
            }),
            success: function(response) {
                // 성공 로직
            },
            error: function(error) {
                // 에러 처리
            }
        });

        $('#chatting').val("");
    }
</script>

<body>
<div id="container" class="container">
    <h1>채팅</h1>
    <div id="chating" class="chating">
    </div>
    <div id="yourMsg">
        <table class="inputTable">
            <tr>
                <th>메시지</th>
                <th>
                    <input id="chatting" placeholder="보내실 메시지를 입력하세요.">
                </th>
                <th>
                    <button onclick="send()" id="sendBtn">보내기</button>
                </th>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
