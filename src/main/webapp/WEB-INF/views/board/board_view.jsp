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
            margin: 20px 0;
            padding: 15px;
            border-radius: 5px;
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

        .replyArea #replyList li div {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .replyArea #replyList b {
            font-weight: bold;
            text-align: left;
        }

        .replyArea #replyList p {
            text-align: left;
        }

        #replyForm {
            width: 1000px;
            display: flex;
            align-items: flex-end;
            gap: 10px;
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
            <li>번호 : ${bVO.post_id}  &nbsp;  글쓴이 : ${bVO.user_id}  &nbsp;  조회수 : ${bVO.views}  &nbsp;  작성일 : ${bVO.write_date}</li>
            <hr>
            <li>제목 : ${bVO.title}</li>
            <hr>
            <li>${bVO.content}</li>
        </ul>
    </div>

    <div class="util">
        <button id="toList">목록</button>
        <!-- 현재글쓴이와 로그인 아이디가 같을 때만 수정 삭제 가능 -->
        <button id="editPost">수정</button>

        <c:if test="${logId==bVO.user_id}">
        <button id="deletePost">삭제</button>
        </c:if>
    </div>
    <br>
    <!-- 댓글 -->
    <div class="replyArea">
        <!-- 로그인 상태일 때 댓글쓰기 -->
        <form method="post" id="replyForm">
            <!--  원글 글번호 -->
            <input type="hidden" name="no" value="${bVO.post_id}"/>
            <textarea name="coment" id="coment"></textarea>
            <!-- button은 form안에있을경우 input type submit과 동일 -->
            <button id="addReply">댓글등록</button>
        </form>
        <br>
        <div>댓글 목록</div>
        <br>
        <ul id="replyList">
            <li>
                <div>
                    <b>goguma</b>
                    <p>댓글 공부중</p>
                    (2023-10-10 12:12:23)
                    <input type="button" value="Edit"/>
                    <input type="button" value="Del"/>
                </div>
            </li>
            <li>
                <div>
                    <b>goguma</b>
                    <p>댓글 공부중..33333..</p>
                    (2023-10-10 12:12:23)
                </div>
            </li>
            <li>
                <div>
                    <b>goguma</b>
                    <p>댓글 공부중55555.5.5</p>
                    (2023-10-10 12:12:23)
                    <input type="button" value="Edit"/>
                    <input type="button" value="Del"/>
                </div>
            </li>
        </ul>
    </div>
</main>
</body>

</html>