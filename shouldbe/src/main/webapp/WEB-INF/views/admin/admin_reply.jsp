<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>관리자 페이지 _ 댓글관리</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <style>
                .container {
                    display: flex;
                    flex-direction: row;
                    margin-top: 50px;
                }

                body {
                    width: 1200px;
                    display: flex;
                    flex-direction: row;
                }

                li {
                    list-style-type: none;
                }

                #navList>li {
                    width: 200px;
                    margin: 20px 100px;
                }

                main {
                    display: flex;
                    flex-direction: column;
                }

                #boardList {
                    width: 1100px;
                    text-align: center;
                }

                #boardList>li {
                    float: left;
                    height: 30px;
                    line-height: 30px;
                    border-bottom: 1px solid #ddd;
                    width: 120px;
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                }

                #boardList>li:nth-child(7n+3) {
                    width: 180px;
                }

                #boardList>li:nth-child(7n+4) {
                    width: 200px;
                }
            </style>
        </head>

        <body>
            <jsp:include page="${pageContext.servletContext.contextPath}/resources/header.jsp" />
            <div class="container">
                <nav>
                    <ul id="navList">
                        <li>대시보드</li>
                        <li>게시글관리</li>
                        <li>댓글관리</li>
                        <li>회원관리</li>
                        <li>퀴즈관리</li>
                        <li>채팅관리</li>
                    </ul>
                </nav>
                <main>
                    <div>
                        <input type="text" placeholder="닉네임 검색" style="width: 120px;">
                        <input type="button" value="검색" style="width: 80px;">
                    </div>

                    <ul id="boardList">
                        <li></li>
                        <li>게시판</li>
                        <li>글제목</li>
                        <li>댓글내용</li>
                        <li>작성자</li>
                        <li>신고횟수</li>
                        <li>신고사유</li>

                        <li><input type="checkbox"></li>
                        <li>자유게시판</li>
                        <li>글제목입니다</li>
                        <li>댓글내용입니다</li>
                        <li>userid</li>
                        <li>1</li>
                        <li>댓글도배</li>
                        <li><input type="checkbox"></li>
                        <li>자유게시판</li>
                        <li>글제목입니다</li>
                        <li>댓글내용입니다</li>
                        <li>userid</li>
                        <li>1</li>
                        <li>댓글도배</li>
                        <li><input type="checkbox"></li>
                        <li>자유게시판</li>
                        <li>글제목입니다</li>
                        <li>댓글내용입니다</li>
                        <li>userid</li>
                        <li>1</li>
                        <li>댓글도배</li>
                        <li><input type="checkbox"></li>
                        <li>자유게시판</li>
                        <li>글제목입니다</li>
                        <li>댓글내용입니다</li>
                        <li>userid</li>
                        <li>1</li>
                        <li>댓글도배</li>
                        <li><input type="checkbox"></li>
                        <li>자유게시판</li>
                        <li>글제목입니다</li>
                        <li>댓글내용입니다</li>
                        <li>userid</li>
                        <li>1</li>
                        <li>댓글도배</li>
                        <li><input type="checkbox"></li>
                        <li>자유게시판</li>
                        <li>글제목입니다</li>
                        <li>댓글내용입니다</li>
                        <li>userid</li>
                        <li>1</li>
                        <li>댓글도배</li>
                    </ul>
                    <input type="button" value="선택삭제" style="width: 80px;">
                </main>
            </div>
            <jsp:include page="${pageContext.servletContext.contextPath}/resources/footer.jsp" />
        </body>

        </html>