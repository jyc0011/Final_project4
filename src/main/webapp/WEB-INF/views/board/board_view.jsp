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
                    width: 1000px;
                    margin: 0 auto;
                }

                #viewArea {
                    height: 500px;
                }

                hr {
                    width: 60%;
                }

                #replyArea {
                    padding: 10px 0px;
                }

                #coment {
                    width: 600px;
                    height: 81px;
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

            </style>
            <script>
            </script>
        <body>
            <main>
                <div id="viewArea">
                    <h1>글 내용 보기</h1>

                    <ul>
                        <li>번호 : ${vo.post_id}, 글쓴이 : ${vo.user_id} , 조회수 : ${vo.views}, 작성일 : ${vo.write_date}</li>
                        <li>제목 : ${vo.title}</li>
                        <li>${vo.content}</li>
                    </ul>
                </div>
                <hr>
                <div>
                    목록
                    <!-- 현재글쓴이와 로그인 아이디가 같을 때만 수정 삭제 가능 -->
                    <a href="">수정</a>
                    <a href="">삭제</a>
                </div>
                <hr>
                <div>
                    목록
                    <!-- 현재글쓴이와 로그인 아이디가 같을 때만 수정 삭제 가능 -->
                    <a href="">수정</a>
                    <a href="">삭제</a>
                </div>

                <!-- 댓글 -->
                <div id="replyArea">
                    <!-- 로그인 상태일 때 댓글쓰기 -->
                    <form method="post" id="replyForm">
                        <!--  원글 글번호 -->
                        <input type="hidden" name="no" value="${vo.post_id}" />
                        <textarea name="coment" id="coment"></textarea>
                        <!-- button은 form안에있을경우 input type submit과 동일 -->
                        <button>댓글등록</button>
                    </form>
                    <!-- 댓글목록 -->
                    <div>댓글 목록</div>
                    <ul id="replyList">
                        <li>
                            <div>
                                <b>goguma</b>(2023-10-10 12:12:23)
                                <input type="button" value="Edit" />
                                <input type="button" value="Del" />
                                <p>댓글 공부중</p>
                            </div>
                        </li>
                        <li>
                            <div>
                                <b>goguma</b>(2023-10-10 12:12:23)
                                <p>댓글 공부중..33333..</p>
                            </div>
                        </li>
                        <li>
                            <div>
                                <b>goguma</b>(2023-10-10 12:12:23)
                                <input type="button" value="Edit" />
                                <input type="button" value="Del" />
                                <p>댓글 공부중55555.5.5</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </main>
        </body>

        </html>