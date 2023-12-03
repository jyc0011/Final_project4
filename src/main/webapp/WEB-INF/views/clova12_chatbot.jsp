<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>챗봇 Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- JQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .chatbotMain {
            width: 600px;
            margin: 0 auto;
        }

        #content {
            overflow: scroll;
            height: 400px;
            border: 1px solid #ddd;
        }

        .queRight, .queLeft {
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            clear: both;
        }

        .queRight {
            text-align: right;
            background: pink;
            float: right;
        }

        .queLeft {
            text-align: left;
            background: #A5FFE4;
            float: left;
        }
    </style>
    <script>
        $(function () {
            $("#queryBtn").click(function () {
                // 질문입력유무
                if ($("#queryin").val() == '') {
                    alert("질문을 입력하세요.");
                    return false;
                }
                // ajax로 서버에 보내 결과받기
                $.ajax({
                    url: 'chatbotMessage',
                    data: {
                        queryin: $("#queryin").val()
                    },
                    type: 'post',
                    success: function (r) {
                        $("#resultCode").val(r);
                        var jsonChat = JSON.parse(r);
                        console.log(jsonChat);

                        var now = new Date(jsonChat.timestamp);
                        // 질문을 뷰에 출력하고, queryin은 초기화
                        var queTag = "<div class='queRight'>" + $("#queryin").val() + "<br/><span style='font-size:10px;color:gray;'>" + now + "</span></div>";
                        $("#content").append(queTag);
                        $("#queryin").val();

                        // 답변 처리
                        if (jsonChat.bubbles[0].type == 'text') {	// 답변이 문자로 온 경우
                            // \n을 <br/>바꾸어야 뷰페이지에 줄바꿈
                            var txtAnswer = jsonChat.bubbles[0].data.description.replaceAll('\n', '<br/>');
                            txtAnswer = "<div class='queLeft'>" + txtAnswer + "<br/><span style='font-size:10px;color:gray;'>" + now + "</span></div>";
                            $("#content").append(txtAnswer);
                        } else if (jsonChat.bubbles[0].type == 'template') {	// 답변이 버튼으로 온 경우
                            var btnAnswer = "<div class='queLeft'>";
                            // 안내메세지
                            btnAnswer += jsonChat.bubbles[0].data.cover.data.description + "<br/>";

                            btnAnswer += "<div class='d-grid gap-1'>";

                            jsonChat.bubbles[0].data.contentTable.map(function (value, i) {
                                btnAnswer += "<input type='button' value='" + value[0].data.title + "' class='btn btn-outline-danger btn-block' ";
                                btnAnswer += " onclick='location.href=\"" + value[0].data.data.action.data.url + "\"'/>";
                            });

                            btnAnswer += "</div></div>";
                            $("#content").append(btnAnswer);
                        } else if (jsonChat.bubbles[0].type == 'carousel') {	// 답변이 이미지로 온 경우
                            var imageJson = jsonChat.bubbles[0].data;

                            var imageAnswer = `<div class='queLeft' style="width:300px;">
													<div id="demo" class="carousel slide" data-bs-ride="carousel" style="width:270px;">
							  							<div class="carousel-inner">`;

                            // 이미지 + 메뉴명 + 설명 반복수행
                            imageJson.cards.map(function (card, i) {
                                var description = card.data.cover.data.description.replaceAll('\n', '<br/>');

                                if (i == 0) imageAnswer += `<div class="carousel-item active" style="width:270px;">`;
                                else imageAnswer += `<div class="carousel-item" style="width:270px;">`;
                                imageAnswer += `<img src="` + card.data.cover.data.imageUrl + `" alt="` + card.data.cover.title + `" class="d-block w-100">
								      <p style='background:#fff'>` + card.data.cover.title + `<br/>` + description + `</p>
								    </div>`;
                            });
                            // ------------------------------

                            imageAnswer += `</div>
							
							  <!-- Left and right controls/icons -->
							  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon"></span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
							    <span class="carousel-control-next-icon"></span>
							  </button>
							</div></div>`;
                            // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            $("#content").append(imageAnswer);
                        }	// if

                        // 스크롤바를 맨 아래로 보내기
                        var div = document.getElementById("content");
                        div.scrollTop = div.scrollHeight;
                    }, error: function (e) {
                        console.log(e.responseText);
                    }
                });

            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="chatbotMain">
        <h1>챗봇</h1>
        <!-- 대화내용을 표시할 곳 -->
        <div id="content"></div>
        <!-- 질문을 입력하는 곳 -->
        <div class="input-group mb-3 mt-2">
            <input id="queryin" name="queryin" type="text" class="form-control" placeholder="질문을 입력하세요">
            <button id="queryBtn" class="btn btn-success" type="submit">보내기</button>
        </div>
    </div>
    <hr/>
    <!-- 답변 받은 결과를 출력할 곳 -->
    <textarea id="resultCode" style="width:100%; height:300px"></textarea>
</div>
</body>
</html>