<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        main {
            width: 1000px;
            margin: 0 auto;
        }

        #replyList > li {
            border-bottom: 1px solid #ddd;

        }

        /* 초기화 */
        body,
        ul,
        li {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        /* link초기화 */
        a:link,
        a:visited,
        a:hover,
        a:active {
            color: black;
            text-decoration: none;
        }

        #writeButton {
            text-align: center;
        }
    </style>
    <script>

    </script>

<body>
<main>
    ${vo.title}

    <h1>게시글 수정</h1>
    <c:if test="${vo.board_cat=='free'}">자유게시판</c:if>
    <c:if test="${vo.board_cat=='notice'}">공지사항</c:if>
    <c:if test="${vo.board_cat=='inquiries'}">문의게시판</c:if>
    <div class="mb-3">
        <!-- todo: 제목에 ",'등 처리 하는법, 내용 엔터처리 -->
        <label for="exampleFormControlInput1" class="form-label">제목</label>
        <input type="text" class="form-control" id="exampleFormControlInput1" value='${vo.title}'>
    </div>
    <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">내용</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10">${vo.content}</textarea>
    </div>
    <div id="writeButton">
        <button type="button" class="btn btn-secondary">취소</button>
        <button type="button" class="btn btn-warning">작성</button>
    </div>

</main>
</body>

</html>