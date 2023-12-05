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
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>


    <style>
        .container {
            width: 600px; /* 너비를 600px로 설정 */
            margin: 0 auto; /* 가운데 정렬 */
        }

        #showChat {
            margin: 0 auto;
            padding: 10px;
            background-color: #f8f9fa;
        }

        #toMsg {
            height: 600px;
            overflow-y: auto;
            background: #ffffff;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        input[type=text] {
            border-radius: 4px;
            border: 1px solid #ced4da;
            padding: 10px;
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        @media (max-width: 600px) {
            #container, #showChat {
                width: 100%; /* 화면이 600px보다 작을 때 100% 너비 사용 */
            }
        }
    </style>

    </style>
    <script>
        let socket = null;
        let stompClient = null;
        let nickname;
        $(function () {
            //disableChat();

            // 서버 연결 버튼
            $("#connectBtn").click(function () {
                if ($("#nickname").val() == '') {
                    $("#status").html("<span style='color:red'>write nickname</span>");
                    return false;
                }
                nickname = $("#nickname").val();
                chatConnection(); // 이 함수 내에서 연결 상태 업데이트
            });

            // 메시지 전송 로직
            $("#inputMsg").keypress(function (event) {
                if (event.keyCode == 13 && $("#inputMsg").val() != '') {
                    let str = {
                        from: nickname,
                        to: 'all',
                        text: $("#inputMsg").val()
                    }
                    stompClient.send('/chatting', {}, JSON.stringify(str));
                    $("#inputMsg").val('');
                }
            });

            // 서버 연결 해제 버튼
            $("#disConnectBtn").click(function () {
                if (stompClient != null) {
                    let str = {
                        from: nickname,
                        to: 'all',
                        text: nickname + "님 퇴장"
                    }
                    stompClient.send('/chatting', {}, JSON.stringify(str));
                    stompClient.disconnect();
                    stompClient = null;
                    socket = null;
                    //disableChat();
                    $("#connectBtn").prop('disabled', false);
                    nickname = null;
                }
            });
        });

        function chatConnection() {
            console.log("chatConnection 함수가 호출되었습니다.");
            socket = new SockJS("/chattings");
            console.log("hi");
            stompClient = Stomp.over(socket);
            console.log("hi");
            stompClient.connect({}, function (frame) {
                console.log('frame->', frame);
                console.log('=======connect=======')
                setConnected();
                console.log("hi");
                let str = {
                    from: nickname,
                    to: 'all',
                    text: nickname + "님 접속"
                }
                stompClient.send('/hello/chattings', {}, JSON.stringify(str));
                console.log("hi");
                stompClient.subscribe('/topic/message', function (msg) {
                    console.log(msg);
                    var jsonMsg = JSON.parse(msg.body);
                    console.log(jsonMsg + '123123123');
                    showChatMessage(jsonMsg);
                });
            }, function (error) {
                // 연결 실패 시 로그 출력
                console.error("WebSocket 연결 실패:", error);
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

        // function disableChat() {
        //     $("#nickname").val('');
        //     $("#inputMsg").val('');
        //     $("#toMsg").html('');
        //     $("#status").html('연결후 사용');
        //     $("#showChat").css('display', 'none');
        // }
    </script>
</head>
<body>
<div class='container'>
    <div class="mt-4 p-5 bg-warning text-white rounded">
        <h1>Chatting(1:N)</h1>
        <div class="mb-3 mt-3">
            <label for="nickname" class="form-label">Nickname:</label>
            <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="nickname">
        </div>
        <button type="button" id="connectBtn" class="btn btn-dark">서버 연결</button>
        <button type="button" id="disConnectBtn" class="btn btn-dark">서버 연결 해제</button>
    </div>
    <div id="status" class="alert" style="background: #965417; color:white">
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
