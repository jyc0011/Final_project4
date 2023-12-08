<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        main {
            width: 1000px;
            margin: 0 auto;
        }

        /* 초기화 */
        body,
        ul,
        li {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        #writeButton {
            text-align: center;
        }
    </style>
    <script>
        window.onload = function () {
            document.getElementById("cancelBtn").onclick = function () {
                window.history.back();
            }
        }
    </script>
</head>

<body>
<main>
    <br>
    <h2>게시글 작성 :
    <c:if test="${category=='free'}">자유게시판</c:if>
    <c:if test="${category=='notice'}">공지사항</c:if>
    <c:if test="${category=='inquiries'}">문의게시판</c:if>
    </h2>
    <br>
    <form method="post"
          action="${pageContext.servletContext.contextPath}/board/${category}/writeOk">
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> 제목</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요." name="title">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="10"
                      placeholder="내용을 입력하세요." name="content"></textarea>
        </div>
        <div id="writeButton">
            <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
            <button type="submit" class="btn btn-warning">작성</button>
        </div>
    </form>

</main>
</body>

</html>