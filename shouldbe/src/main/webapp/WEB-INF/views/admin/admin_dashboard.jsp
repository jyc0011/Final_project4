<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>관리자 페이지 _ 대시보드</title>
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

                li {
                    list-style-type: none;
                }

                nav {
                    width: 130px;
                }

                #navList>li {
                    width: 100px;
                    margin: 20px 50px 0 0;
                }

                section {
                    width: 500px;
                    height: 400px;
                    position: relative;
                }

                section>h2 {
                    text-align: center;
                }

                main {
                    width: 1200px;
                    display: flex;
                    flex-direction: row;
                    flex-wrap: wrap;
                    align-content: space-around;
                }

                #boardList>li,
                #replyList>li {
                    float: left;
                    height: 30px;
                    line-height: 30px;
                    border-bottom: 1px solid #ddd;
                    width: 100px;
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                }

                #boardList>li:nth-child(3n+2) {
                    width: 220px;
                }

                #replyList>li:nth-child(3n+1) {
                    width: 145px;
                }

                #replyList>li:nth-child(3n+2) {
                    width: 175px;
                }

                #chart {
                    text-align: center;
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
                    <section id="preferred">
                        <h2>선호언어</h2>
                        <div id="chart">
                            막대그래프
                        </div>
                    </section>
                    <section id="recent-board">
                        <h2>최신게시글</h2>
                        <ul id="boardList">
                            <li>게시판</li>
                            <li>글제목</li>
                            <li>작성자</li>

                            <li>자유게시판</li>
                            <li>글제목입니다</li>
                            <li>userid</li>
                            <li>자유게시판</li>
                            <li>글제목입니다</li>
                            <li>userid</li>
                            <li>자유게시판</li>
                            <li>글제목입니다</li>
                            <li>userid</li>
                            <li>자유게시판</li>
                            <li>글제목입니다</li>
                            <li>userid</li>
                            <li>자유게시판</li>
                            <li>글제목입니다</li>
                            <li>userid</li>
                        </ul>
                    </section>
                    <section id="visitor">
                        <h2>방문자수</h2>
                        <div id="chart">
                            선그래프
                        </div>
                    </section>
                    <section id="recent-reply">
                        <h2>최신댓글</h2>
                        <ul id="replyList">
                            <li>글제목</li>
                            <li>댓글내용</li>
                            <li>작성자</li>

                            <li>글제목입니다</li>
                            <li>댓글내용입니다</li>
                            <li>userid</li>
                            <li>글제목입니다</li>
                            <li>댓글내용입니다</li>
                            <li>userid</li>
                            <li>글제목입니다</li>
                            <li>댓글내용입니다</li>
                            <li>userid</li>
                            <li>글제목입니다</li>
                            <li>댓글내용입니다</li>
                            <li>userid</li>
                            <li>글제목입니다</li>
                            <li>댓글내용입니다</li>
                            <li>userid</li>
                        </ul>
                    </section>
                </main>
            </div>
            <jsp:include page="${pageContext.servletContext.contextPath}/resources/footer.jsp" />
        </body>

        </html>