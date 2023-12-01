<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!--https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"
            integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!--https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"
            integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        #showChat {
            width: 600px;
            margin: 0 auto;
            border: 1px solid red;
        }

        #toMsg {
            width: 600px;
            height: 600px;
            box-shadow: 3px 3px 3px 3px #dddddd;
            border: 1px solid #cccccc;
            border-radius: 3px;
            padding: 10px;
            background: #fefcf3;
            overflow: auto;
        }
    </style>
    <script>
        let socket = null;
        let stompClient = null;
        let nickname;
        $(function () {
            disableChat()
            $("#connectBtn").click(function () {
                if ($("nickname").val() == '') {
                    $("#status").html("<span style='color:red'>write nickname</span>");
                    return false;
                }
                nickname = $("nickname").val();
                chatConnection();
            });
            $("inputMsg").keypress(function () {
                if (event.keyCode == 13) {
                    if ($("#inputMsg").val() != '') {
                        let str = {
                            from: nickname,
                            to: 'all',
                            text: $("#inputMsg").val()
                        }
                        stompClient.send('/chatting', {}, JSON.stringify(str));
                        $("inputMsg").val('');
                    }
                }
            });
            $("disConnectBtn").click(function () {
                let str = {
                    from: nickname,
                    to: 'all',
                    text: nickname + "님 퇴장"
                }
                stompClient.send('/chatting', {}, JSON.stringify(str));
                nickname = null;
                if (stompClient != null) {
                    stompClient.disconnect();
                    stompClient = null;
                    socket = null;
                    disableChat();
                    $("#connectBtn").prop('disabled', false);
                }
            });
        });

        function chatConnection() {
            socket = new SocketJS("${pageContext.request.contextPath}/chat");
            stompClient = Stomp, over(socket);
            stompClient.connect({}, function (frame) {
                console.log('frame->', frame);
                console.log('=======connect=======')
                setConnected();

                let str = {
                    from: nickname,
                    to: 'all',
                    text: nickname + "님 접속"
                }
                stompClient.send('/chatting', {}, JSON.stringify(str));

                stompClient.subscribe('/topic/messages', function (msg) {
                    console.log(msg);
                    var jsonMsg = JSON.parse(msg.body)
                    showChatMessage(jsonMsg);
                });
            });
        }

        function showChatMessage(data) {
            if (nickname == data.from) {
                tag += `
                <div style="overflow: auto;">
                <img src="${pageContext.servletContext.contextPath}/image/user.png" class="rounded-circle" style="float: right"/>
                <p style="float: right; left: 5px">
                <div style="text-align: right">
                <span class="badge bg-sucess">` + data.from + `</span>
        </div>
            <div class="rounded" style="text-align: right">` + data.text + `</div>
            <div style="font-size: 0.7em; color: #cccccc;"> style="text-align: right"
                &nbsp;&nbsp;&nbsp;` + data.time + `
            </div>
        </p>
        </div>
            `;
            } else {
                tag += `
            <div style="overflow: auto;">
                <img src="${pageContext.servletContext.contextPath}/image/user.png" className="rounded-circle" style="float: left"/>
                <p style="float: left; left: 5px">
                    <div>
                        <span className="badge bg-dark">` + data.from + `</span>
                    </div>
                    <div className="rounded">` + data.text + `</div>
                    <div style="font-size: 0.7em; color: #cccccc;">
                        &nbsp;&nbsp;&nbsp;` + data.time + `
                    </div>
                </p>
            </div>`;
            }
            addMessage(tag);
        }

        function addMessage(tag) {
            $("#toMsg").append(tag);
        }

        function addMessage(tag) {
            $("#toMsg").append(tag);

            var height = $("#toMsg").outerHeight();
            $("#toMsg").scrollTop(height);

        }

        function setConnected() {
            $("#connectBtn").prop('disabled', true);
            $("#nickname").prop('readonly', true);
            $("#status").html(nickname + "님이 접속")
            $("showChat").css('display', 'block');

        }

        function disableChat() {
            $("#nickname").val('');
            $("#inputMsg").val('');
            $("#toMsg").html('');
            $("#status").html('연결후 사용');
            $("#showChat").css('display', 'none');
        }
    </script>
</head>
<body>
<div class='container'>
    <div class="mt-4 p-5 bg-primary text-white rounded">
        <h1>Chatting(1:N)</h1>
        <div class="mb-3 mt-3">
            <label for="nickname" class="form-label">Nickname:</label>
            <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="nickname">
        </div>
        <button type="button" class="btn btn-dark">서버 연결</button>
        <button type="button" class="btn btn-dark">서버 연결 해제</button>
    </div>
    <div id="status" class="alert" style="background: #439A97; color:white">
        <strong>채팅을 연결후 사용하세요</strong>
    </div>
    <div id="showChat">
        <div class="mb-3 mt-3">
            <label for="inputMsg" class="form-label">message:</label>
            <input type="text" class="form-control" id="inputMsg" placeholder="Enter message" name="inputMsg">
        </div>
    </div>
    <div id="toMsg">
        <!-- 받은 메세지-->
        <div style="overflow: auto;">
            <img src="${pageContext.servletContext.contextPath}/image/user.png" class="rounded-circle"
                 style="float: left"/>
            <p style="float: left; left: 5px">
            <div>
                <span class="badge bg-dark">AAAAA</span>
            </div>
            <div class="rounded">안녕하세요...</div>
            <div style="font-size: 0.7em; color: #cccccc;">
                &nbsp;&nbsp;&nbsp;2023.11.29 10:10:12
            </div>
            </p>
        </div>
        <div style="overflow: auto;">
            <img src="${pageContext.servletContext.contextPath}/image/user.png" class="rounded-circle"
                 style="float: right"/>
            <p style="float: right; left: 5px">
            <div style="text-align: right">
                <span class="badge bg-sucess">AAAAA</span>
            </div>
            <div class="rounded" style="text-align: right">안녕하세요...</div>
            <div style="font-size: 0.7em; color: #cccccc;"> style="text-align: right"
                &nbsp;&nbsp;&nbsp;2023.11.29 10:10:12
            </div>
            </p>
        </div>
    </div>
</div>
</body>
</html>
