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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <style>
        .container {
            width: 1200px;
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
            width: 450px;
            height: auto;
            margin: 20px;
            position: relative;
        }
        section > h2 {
            text-align: center;
        }
        main{
            height:1000px;
            margin: 50px auto;
        }
        #dashboard {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            align-content: space-around;
            margin-left: 20px;
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
            width: 200px;
        }
        #replyList > li:nth-child(3n+1) {
            width: 130px;
        }
        #replyList > li:nth-child(3n+2) {
            width: 175px;
        }
        #boardList > li:nth-child(-n+3), #replyList > li:nth-child(-n+3){
            font-weight: bold;
            font-size: 17px;
        }
        #chart, #dashboardTitle {
            text-align: center;
        }
        #dashboardTitle{
            margin-bottom: 50px;
        }
        #side_menu > li:nth-child(1){
            font-weight: bold;
            font-size: 18px;
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
                <div id="">
                    <canvas id="bar-chart-horizontal" width="450" height="200"></canvas>
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
                <h2>월별 방문자수</h2>
                <div id="chart">
                    <canvas id="line-chart" width="450" height="200"></canvas>
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
<script>
    new Chart(document.getElementById("bar-chart-horizontal"), {
        type: 'horizontalBar',
        data: {
            labels: ["Korean", "English", "Japanese"],
            datasets: [
                {
                    label: "preferred language",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#c45850"],
                    data: [1278,1607,934]
                }
            ]
        },
        options: {
            legend: { display: false },
            title: {
                display: false,
                text: 'preferred language'
            }
        }
    });

    new Chart(document.getElementById("line-chart"), {
        type: 'line',
        data: {
            labels: [1,2,3,4,5,6,7,8,9,10],
            datasets: [{
                data: [186,214,406,606,907,1111,1133,1221,1333,1878],
                label: "Korean",
                borderColor: "#3e95cd",
                fill: false
            }, {
                data: [282,350,411,502,735,1109,1507,1802,2000,2267],
                label: "English",
                borderColor: "#8e5ea2",
                fill: false
            }, {
                data: [168,170,178,190,263,376,508,647,875,1134],
                label: "Japanese",
                borderColor: "#c45850",
                fill: false
            }
            ]
        },
        options: {
            title: {
                display: false,
                text: 'visitor'
            }
        }
    });
</script>
</body>

</html>