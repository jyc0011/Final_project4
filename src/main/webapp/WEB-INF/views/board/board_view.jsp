<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>글 내용보기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        main {
            width: 1200px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            text-align: left;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #viewArea {
            width:1000px;
            height: auto;
            display: flex;
            flex-direction: column;
            margin-bottom: 30px;
        }

        #viewArea ul {
            padding: 15px;
            border-radius: 5px;
        }

        #viewArea li {
            margin-bottom: 10px;
            line-height: 1.6;
        }

        #viewArea li:first-child {
            font-size: 0.9em;
            color: #555;
        }

        #viewArea li:nth-child(3) {
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
        }

        #viewArea li:last-child {
            font-size: 1em;
            padding: 10px 0;
        }

        .replyArea {
            width: 1000px;
            margin: 20px 0;
            padding: 15px;
            border-radius: 5px;
            border-top: 1px solid #ddd;
        }


        .replyArea #replyList {
            list-style-type: none;
            padding: 0;
        }

        .replyArea #replyList li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
        }


        .replyArea #replyList b {
            font-weight: bold;
            text-align: left;
        }

        .replyArea #replyList p {
            text-align: left;
            margin-bottom: 0;
        }

        #replyForm{
            width: 970px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        #replyForm>div{
            display: flex;
            justify-content: flex-end;
        }

        #coment {
            flex-grow: 1;
            height: 100px;
            border-radius: 4px;
        }

        button {
            width: 120px;
            height: 40px;
            border: none;
            cursor: pointer;
        }

        hr {
            width: 100%;
        }

        body,
        ul,
        li {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        a:link,
        a:visited,
        a:hover,
        a:active {
            color: black;
            text-decoration: none;
        }

        .util > a {
            display: inline-block;
            color: #333;
            padding: 10px 15px;
            margin: 5px;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            transition: border-color 0.3s ease, color 0.3s ease;
        }

        .util {
            text-align: center;
            margin-top: 20px;
        }

        .btn btn-warning{
            font-size: 13px;
        }
        #box{
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }
        #userid-box{
            padding: 0 10px;
            width: 120px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        #reply-box{
            width: 82%;
        }
        #replyContent{
            width: 600px;
        }
        #replyDate{
            color: #979797;
            font-size: 12px;
        }
        #replyBtn-box{
            width: 160px;
            display: flex;
            gap: 3px;
        }
    </style>
    <script>
        window.onload = function () {
            document.getElementById("toList").onclick = function () {
                location.href="${listUrl}";
            }
            document.getElementById("editPost").onclick = function() {
                location.href="${pageContext.servletContext.contextPath}/board/${bVO.board_cat}/edit?no=${bVO.post_id}"
            }
            document.getElementById("deletePost").onclick = function() {
                if (!confirm("정말 삭제하시겠습니까?")) {
                    alert("취소 되었습니다.");
                } else {
                    location.href="/board/${bVO.board_cat}/delete?no=${bVO.post_id}";

                }
            }
        }
        $(function(){
            $("#addReply").click(function(){
                $.ajax({
                    type: "POST",
                    url: "/create/sendcode",
                    data: {email: email},
                    success: function (r) {
                        var data = JSON.parse(r);
                        if (data.result === true) {
                            alert("이메일이 전송되었습니다.");
                            $("#emailCheckDiv").css('display', '');
                            // $("#authenticate").css('display', '');
                            // $("#checkcode").css('display', '');
                        } else {
                            alert(data.msg);
                        }
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })
            })
        })

    </script>
<body>
<main>
    <div id="viewArea">
        <ul>
            <li>글번호 : ${bVO.post_id}  &nbsp;  작성자 : ${bVO.user_id}  &nbsp;  조회수 : ${bVO.views}  &nbsp;  작성일 : ${bVO.write_date}</li>
            <hr>
            <li><h4><b>제목 : ${bVO.title}</b></h4></li>
            <hr>
            <li>${bVO.content}</li>
        </ul>
    </div>

    <div class="util">
        <button id="toList" class="btn btn-secondary">목록</button>
        <c:if test="${logId==bVO.user_id}">
            <button id="editPost" class="btn btn-warning">수정</button>
        </c:if>

        <c:if test="${logId==bvo.user_id}">
            <button id="deletePost" class="btn btn-warning">삭제</button>
        </c:if>
    </div>
    <br>
    <!-- 댓글 -->
    <div class="replyArea">
        <c:if test="${'Y'.equals(logStatus)}">
            <form method="post" id="replyForm">
                <!--  원글 글번호 -->
                <input type="hidden" name="no" value="${bvo.post_id}"/>
                <textarea name="coment" id="coment"></textarea>
                <!-- button은 form안에있을경우 input type submit과 동일 -->
                <div><button class="btn btn-warning">댓글등록</button></div>
            </form>
        </c:if>
        <br>
        <div>댓글 목록</div>
        <br>
        <ul id="replyList">
            <li>
                <div id="box">
                    <div id="userid-box">
                        <b>gogumagogumagoguma</b>
                    </div>
                    <div id="reply-box">
                        <div id="replyContent">댓글 공부중댓글 공부중댓글 공부중</div>
                        <div id="replyDate">(2023-10-10 12:12:23)</div>
                    </div>
                    <div id="replyBtn-box">
                        <input type="button" value="댓글수정" class="btn btn-warning"/>
                        <input type="button" value="댓글삭제" class="btn btn-warning"/>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</main>
</body>

</html>