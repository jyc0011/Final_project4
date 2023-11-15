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
        main{
            width:1000px;
            margin: 0 auto;
        }
        /* 초기화 */
        body, ul, li {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        /* link초기화 */
        a:link, a:visited, a:hover, a:active {
            color: black;
            text-decoration: none;
        }

        /* header */
        header>div {
            height: 100px;
            width: 1000px;
            line-height: 100px;
            font-size: 50px;
            background-color: #EBE5D9;
            color: #577D86;
            text-align:center;
            margin:0 auto;
        }

        .topMenu>ul{
            height:40px;
            margin:0 auto;
            width:1000px;
        }

        .topMenu li{
            float:left;
            padding: 0px 30px;
            height: 40px;
            line-height:40px;

        }
        .topMenu a:link, .topMenu a:visited{
            color: white;
        }
        .topMenu a:hover{
            color:yellow;
        }

        footer{
            height:80px;
            line-height:80px;
            text-align:center;
            background-color:#ddd;
            margin:10px 0;
        }
        #boardTop > div {
            float: left;
            width: 50%;
        }

        #boardTop {
            height: 50px;
        }

        #boardTop > div:last-of-type {
            text-align: right;
        }

        #boardList {
            overflow: auto;
        }

        #boardList .page > ul {
            margin: 30px 0px 0px;
            overflow: auto;
        }

        #boardList > li {
            float: left;
            height: 40px;
            line-height: 40px;
            border-bottom: 1px solid #ddd;
            width: 10%;
        }

        #boardList > li:nth-child(5n+2) {
            width: 60%;
            /* 내용이 길면 ...으로 제목 겹침 방 */
            white-space: nowrap; /* 줄바꾸지 않음 */
            overflow: hidden; /* 넘친 데이터 숨기기*/
            text-overflow: ellipsis; /* 넘친 데이터 ...표  */
        }

        .page {
            text-align: center;
            height: 40px;
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .page li {
            float: left;
            height: 40px;
            line-height: 40px;
            padding: 10px;
        }

        .search {
            text-align: center;
        }
    </style>
</head>
<body>
<main>
    <h1>게시판목록</h1>
    <div>
        <a href="">글쓰기</a>
    </div>

    <div id="boardTop">
        <div>총 레코드 수 : 9999개</div>
        <div>현재 페이지 : 1/100</div>
    </div>
    <ul id="boardList">
        <li>번호</li>
        <li>제목</li>
        <li>글쓴이</li>
        <li>조회수</li>
        <li>등록일</li>
        <!-- 임시데이터 -->
        <li>10</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>9</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>8</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>7</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>6</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>5</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>4</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>3</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
        <li>2</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>

        <li>1</li>
        <li><a href="">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>



    </ul>
    <div class="page">
        <ul>
            <!-- 페이지 수 -->
            <li>prev</li>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>next</li>
        </ul>
    </div>
    <div class="search">
        <form method="get" action="" onsubmit="">
            <select name="searchKey">
                <option value="subject">제목</option>
                <option value="content">글내용</option>
                <option value="userid">글쓴이</option>
            </select>
            <input type="text" name="searchWord" id="searchWord">
            <button type="button" class="btn btn-secondary">검색</button>

        </form>
    </div>
</main>
</body>
</html>