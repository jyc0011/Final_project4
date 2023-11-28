<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 _ 게시글관리</title>
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
        main {
            width: 1200px;
            height:1000px;
            margin: 50px auto;
            display: flex;
            flex-direction: column;
        }
        #boardListTitle{
            text-align: center;
        }

        #list_head{
            border-top: 4px solid #000;
            border-bottom: 4px solid #000;
        }
        #list_head>th{
            font-weight: bold;
        }
        .board_list th{
            width:120px;
            height:40px;
            line-height: 40px;
            text-align: center;
        }
        .board_list td{
            padding: 0 10px;
            width: 120px;
            max-width: 120px;
            height:100px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: center;
        }
        .board_list th:nth-child(7n+3), .board_list td:nth-child(7n+3){
            width: 260px;
            max-width: 260px;
        }
        #list_content{
            border-bottom: 1px solid #ddd;
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
            <h1 id="boardListTitle">게시글 관리</h1>
            <div class="input-group mb-3" id="searchNickname" style="width: 250px;">
                <input type="text" class="form-control" placeholder="닉네임 검색">
                <button class="btn btn-dark" type="submit">검색</button>
            </div>

            <div class="col-sm-12" id="boardList">
                <table id="example" class="display" style="width:100%">
                    <thead id="list_head">
                        <tr class="board_list">
                            <th class="board">게시판</th>
                            <th class="board_title">글제목</th>
                            <th class="content">글내용</th>
                            <th class="user_id">작성자</th>
                            <th class="report_count">신고횟수</th>
                            <th class="report_reason">신고사유</th>
                            <th class="del_button"></th>
                        </tr>
                    </thead>
                    <tbody id = "list_content">
                        <tr class="board_list">
                            <td class="board">자유게시판</td>
                            <td class="board_title">글제목입니다</td>
                            <td class="content">글내용입니다</td>
                            <td class="user_id">userid</td>
                            <td class="report_count">1</td>
                            <td class="report_reason">부적절한 게시글</td>
                            <td class="del_button"><input type="button" value="게시글삭제" class="btn btn-dark"></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </main>
    </div>
</body>

</html>