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
            width: 1000px;
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

        #replyForm, #replyFormEdit {
            width: 970px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        #replyForm > div, #replyFormEdit>div {
            display: flex;
            justify-content: flex-end;
        }

        button {
            width: 120px;
            height: 40px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
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
            margin: 20px;
        }

        .btn btn-warning {
            font-size: 13px;
        }

        .comment-section {
            display: flex;
            flex-direction: column;
        }

        .content-and-buttons {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .button-container {
            display: flex;
        }

        #replyReport, #replyEdit {
            margin-right: 20px;
            padding-left: 5px;
            padding-right: 5px;
            background-color: white;
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #likeButton:hover {
            background-color: #c8c8c8;
        }

        #liked {
            margin-top: 10px;
            text-align: center;
            font-size: 16px;
        }

        #replyReport:hover, #replyLike:hover, #replyEdit:hover, #replyDelete:hover {
            color: #555555;
        }

        #replyLike, #replyDelete {
            padding-left: 5px;
            padding-right: 5px;
            background-color: white;
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #reply
    </style>
    <script>
        var currentCommentId = null;
        $(function () {
            $("#toList").click(function () {
                location.href = "${listUrl}";
            })
            $("#editPost").on('click', function () {
                location.href = "${pageContext.servletContext.contextPath}/board/${bVO.board_cat}/edit?no=${bVO.post_id}"
            })
            $("#deletePost").on('click', function () {
                if (!confirm("정말 삭제하시겠습니까?")) {
                    alert("취소 되었습니다.");
                } else {
                    location.href = "/board/${bVO.board_cat}/delete?no=${bVO.post_id}";

                }
            })

            //댓글목록 불러오기
            function getReply() {
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/boardReply/list',
                    data: {no: ${bVO.post_id}},
                    type: 'GET',
                    success: function (result) {
                        //console.log(result);
                        var tag = ""; //댓글목록 태그(수정, 삭제);
                        $(result).each(function (i, rVO) {
                            tag += "<li><div class='comment-section'>";
                            tag += "<div><b>" + rVO.writer + "</b>(" + rVO.write_date + ")</div>";
                            tag += "<div class='content-and-buttons'>";
                            tag += "<p class='comment-content'>" + rVO.content + "</p>";

                            if ('${logId}' == rVO.writer) {
                                tag += "<div class='button-container'>";
                                tag += "<input type='hidden' class='comment-id' value='" + rVO.comment_id + "'/>";
                                tag += "<input type='button' class='reply-button replyEdit' id='replyEdit' value='Edit'/>";
                                tag += "<input type='button' class='reply-button' id='replyDelete' value='Del'/>";
                            }else{
                                tag += "<div class='button-container'>";
                                tag += "<input type='hidden' class='reply-button reply-comment-id' value='" + rVO.comment_id + "'/>";
                                tag += "<input type='hidden' class='reply-button reply-writer' value='" + rVO.writer + "'/>";
                                tag += "<input type='button' class='reply-button' id='replyReport' value='Report'/>";
                                tag += "<input type='button' class='reply-button' id='replyLike' value='Like'/>";
                            }
                            tag += "<div>&nbsp추천수: " + rVO.like + "</div>"
                            tag += "</div>";
                            tag += "</div>";
                            tag += "</li>";
                        });

                        $("#replyList").html(tag);

                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })
            }

            function getLike() {
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/board/like/get',
                    data: {no: ${bVO.post_id}},
                    type: 'GET',
                    success: function (result) {
                        $("#liked").html(result);
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })
            }

            $(document).on('click', '.replyEdit', function() {
                var currentContent = $(this).closest('.comment-section').find('.comment-content').text();
                var commentId = $(this).siblings('.comment-id').val();
                console.log("Comment ID:", commentId);
                currentCommentId=commentId;
                $('#content_Edit').val(currentContent);
                $('#replyFormEdit').show();
                $('#replyForm').hide();
            });

            $('#EditReply').click(function(e) {
                e.preventDefault();
                var postId = $('input[name="post_id_Edit"]').val();
                var updatedContent = $('#content_Edit').val();
                var commentId=currentCommentId;
                console.log(postId, updatedContent, commentId);
                $.ajax({
                    url: '/boardReply/edit',
                    type: 'POST',
                    data: {
                        post_id: postId,
                        comment_id:commentId,
                        content: updatedContent
                    },
                    success: function(response) {
                        alert('Comment updated successfully.');
                        getReply();
                        $('#replyFormEdit').hide();
                        $('#replyForm').show();
                    },
                    error: function(err) {
                        alert('Error updating comment.');
                        console.log(err);
                    }
                });
            });

            $("#replyForm").submit(function (e) {
                e.preventDefault();
                var params = $(this).serialize();
                $.ajax({
                    type: "POST",
                    url: "/boardReply/add",
                    data: params,
                    success: function (r) {
                        //console.log(r);
                        getReply();
                        $("#content").val("");

                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })
            })
            $(document).on('click', '#replyList input[value=Del]', function () {
                if (!confirm("정말 삭제하시겠습니까?")) {
                    return;
                }
                var replyNo = $(this).siblings('input[type="hidden"]').val();
                var postNo = ${bVO.post_id};
                $.ajax({
                    type: "POST",
                    url: "/boardReply/delete",
                    data: {replyNo: replyNo, postNo: postNo},
                    success: function (r) {
                        //console.log(r);
                        getReply();
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })

            });
            $(document).on('click', '#replyList input[value=Report]', function () {
                if (!confirm("정말 신고하시겠습니까?")) {
                    return;
                }
                var replyNo = $(this).siblings('.reply-comment-id').val();
                var commentUserId = $(this).siblings('.reply-writer').val();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.servletContext.contextPath}/boardReply/report",
                    data: {
                        id: commentUserId,
                        no: replyNo},
                    success: function (r) {
                        console.log(r);
                        if (r.result == true) {
                            console.log("success")
                        } else {
                            alert(r.msg);
                        }
                        getLike();

                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })

            })
            $(document).on('click', '#replyList input[value=Like]', function () {
                var replyNo = $(this).siblings('.reply-comment-id').val();
                console.log(replyNo);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.servletContext.contextPath}/boardReply/like",
                    data: {
                        no: replyNo},
                    success: function (r) {
                        console.log(r);
                        if (r.result == true) {
                            console.log("success");
                            alert(r.msg);
                            getReply();
                        } else {
                            alert(r.msg);
                            getReply();
                        }
                        getLike();

                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })

            })

            $("#likeButton").click(function () {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.servletContext.contextPath}/board/like/increase",
                    data: {no: ${bVO.post_id}, user_id: '${logId}'},
                    success: function (r) {
                        console.log(r);
                        if (r.result == true) {
                            alert(r.msg);
                            console.log("success")
                        } else {
                            alert(r.msg);
                        }
                        getLike();

                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                })
            });
            $("#report").click(function () {
                if (!confirm("신고하시겠습니까?")) {
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "${pageContext.servletContext.contextPath}/board/report",
                    data: {no: ${bVO.post_id}, user_id: '${bVO.user_id}'},
                    success: function (r) {
                        if (r.result == true) {
                            alert("신고했습니다.")
                        } else {
                            alert(r.msg);
                        }
                    }
                })

            });
            getReply();
            getLike();
        })

    </script>
<body>
<main>
    <div id="viewArea">
        <ul>
            <li>글번호 : ${bVO.post_id} &nbsp; 작성자 : ${bVO.user_id} &nbsp; 조회수 : ${bVO.views} &nbsp; 작성일
                : ${bVO.write_date}</li>
            <hr>
            <li><h4><b>제목 : ${bVO.title}</b></h4></li>
            <hr>
            <li>${bVO.content}</li>
        </ul>
    </div>
    <div>
        <button id="likeButton">추천</button>
        <div id="liked"></div>
        <button id="report">신고하기</button>
    </div>
    <br>
    <hr style="width: 1000px;">
    <div class="util">
        <button id="toList" class="btn btn-secondary">목록</button>
        <c:if test="${logId==bVO.user_id}">
            <button id="editPost" class="btn btn-warning">수정</button>
        </c:if>

        <c:if test="${logId==bVO.user_id}">
            <button id="deletePost" class="btn btn-warning">삭제</button>
        </c:if>
    </div>
    <hr style="width: 1000px;">
    <!-- 댓글 -->
    <div class="replyArea">
        <h5>댓글 목록</h5>
        <br>
        <ul id="replyList">
        </ul>
        <br>
        <c:if test="${'Y'.equals(logStatus)}">
            <h5>댓글 작성</h5>
            <br>
            <form method="post" id="replyForm">
                <!--  원글 글번호 -->
                <input type="hidden" name="post_id" value="${bVO.post_id}"/>
                <textarea name="content" id="content"></textarea>
                <!-- button은 form안에있을경우 input type submit과 동일 -->
                <div>
                    <button class="btn btn-warning" id="addReply">댓글등록</button>
                </div>
            </form>
        </c:if>

        <form method="post" id="replyFormEdit" style="display: none">
            <input type="hidden" name="post_id_Edit" value="${bVO.post_id}"/>
            <textarea name="content" id="content_Edit"></textarea>
            <div>
                <button class="btn btn-warning" id="EditReply">댓글등록</button>
            </div>
        </form>
    </div>
</main>
</body>

</html>