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
        }
        #side_menu{
            padding:98px 0 0 0;
            width:150px;
            height:1000px;
            list-style-type: none;
        }
        #side_menu>li>a{
            text-decoration: none;
            color: black;
            display: block;
            padding: 10px;
        }
        #side_menu li a:hover{
            background-color: #ddd;
        }
        section {
            width: 40%;
            height: auto;
            margin: 0 0 20px 80px;
            position: relative;
        }
        section > h2 {
            text-align: center;
        }
        main{
            width: 1200px;
            height:1000px;
            margin: 50px auto;
        }
        #dashboard {
            width: 1200px;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            align-content: space-around;
        }
        #boardList > li,
        #replyList > li {
            float: left;
            height: 30px;
            line-height: 30px;
            border-bottom: 1px solid #ddd;
            width: 100px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        #boardList > li:nth-child(3n+2) {
            width: 220px;
        }
        #replyList > li:nth-child(3n+1) {
            width: 145px;
        }
        #replyList > li:nth-child(3n+2) {
            width: 175px;
        }
        #chart, #dashboardTitle {
            text-align: center;
        }
        #dashboardTitle{
            margin-bottom: 100px;
        }
    </style>
</head>

<body>
<div class="container">
    <nav>
        <ul id="side_menu">
            <li><a href="${pageContext.servletContext.contextPath}/admin">대시보드</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/member/management">현재회원관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/suspended/management">정지회원관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/withdrawn/management">탈퇴회원관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/board">게시글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/reply">댓글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/quiz/list">퀴즈관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/chat/management">채팅관리</a></li>
        </ul>
    </nav>
    <main>
        <h1 id="dashboardTitle">대시보드</h1>
        <div id="dashboard">
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
        </div>
    </main>
</div>
</body>

</html>