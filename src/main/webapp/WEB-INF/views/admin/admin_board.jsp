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
            width: 1200px;
            display: flex;
            flex-direction: row;
        }

        #side_menu {
            padding: 98px 0 0 0;
            width: 150px;
            height: 1000px;
            list-style-type: none;
        }

        #side_menu > li > a {
            text-decoration: none;
            color: black;
            display: block;
            padding: 10px;
        }

        #side_menu li a:hover {
            background-color: #ddd;
        }

        main {
            width: 100%;
            height: 1000px;
            margin: 50px auto;
            display: flex;
            flex-direction: column;
        }

        #boardListTitle {
            text-align: center;
        }

        #list_head {
            border-top: 4px solid #000;
            border-bottom: 4px solid #000;
        }

        #list_head > th {
            font-weight: bold;
        }

        .board_list th {
            width: 130px;
            height: 40px;
            line-height: 40px;
            text-align: center;
        }

        .board_list td {
            padding: 0 10px;
            width: 130px;
            max-width: 120px;
            height: 100px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: center;
        }

        .board_list th:nth-child(7n+3), .board_list td:nth-child(7n+3) {
            width: 230px;
            max-width: 260px;
        }

        .board_list th:nth-child(7n+4), .board_list td:nth-child(7n+4) {
            width: 100px;
        }

        .board_list th:nth-child(7n+5), .board_list td:nth-child(7n+5) {
            width: 100px;
        }

        .board_list th:nth-child(7n+6), .board_list td:nth-child(7n+6) {
            width: 140px;
        }

        #list_content {
            border-bottom: 1px solid #ddd;
        }

        #side_menu > li:nth-child(5) {
            font-weight: bold;
            font-size: 18px;
        }

        .pagination {
            justify-content: center;
        }

        .pagination .page-link {
            color: black;
            text-decoration: none;
            background-color: transparent;
        }

        /* Style for the active page link */
        .pagination .page-link.active {
            background-color: #ffe3a0;
            color: black;
        }

        .management_list>td{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            margin: 80px ;
            padding:10px;
        }

        .board_title> a{
            text-decoration: none;
            color: black;
            display: block;
            padding: 10px;
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
                <tbody id="list_content">
                <tr class="board_list">
                    <td class="board">자유게시판</td>
                    <td class="board_title">글제목입니다</td>
                    <td class="content">글내용입니다</td>
                    <td class="user_id">userid</td>
                    <td class="report_count">1</td>
                    <td class="report_reason">부적절한 게시글</td>
                    <td class="del_button"><input type="button" value="게시글삭제" class="btn btn-dark"></td>
                </tr>
                <c:forEach var="bVO" items="${board}">
                    <tr class="management_list">
                        <td class="board">
                            <c:choose>
                                <c:when test="${bVO.board_cat=='notice'}">
                                    정보 게시판
                                </c:when>
                                <c:when test="${bVO.board_cat=='resources'}">
                                    자료 게시판
                                </c:when>
                            </c:choose>
                        </td>
                        <td class="board_title"><a href="/board/notice/view?no=${bVO.post_id}">${bVO.title}</a></td>
                        <td class="content">${bVO.content}</td>
                        <td class="user_id">${bVO.user_id}</td>
                        <td class="report_count">${bVO.report_time}</td>
                        <td class="report_reason">${bVO.board_cat}</td>
                        <td class="del_button"><a
                                href="${pageContext.servletContext.contextPath}/boardDelete?post_id=${bVO.post_id}"><input
                                type="button" value="게시글삭제" class="btn btn-dark"></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <div class="pagination-container" style="margin: 0 auto; margin-top: 20px; width: fit-content">
                <div class="pagination" style="display: flex">
                    <div class="paging">
                        <ul class="pagination justify-content-center d-flex">
                            <c:if test="${pVO.nowPage > 1}">
                                <li class="page-item"><a class="page-link" href="'?page=${pVO.nowPage - 1}'"><
                                </a></li>
                            </c:if>
                            <c:forEach var="i" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount - 1}">
                                <c:if test="${i <= pVO.totalPage}">
                                    <c:choose>
                                        <c:when test="${i != pVO.nowPage}">
                                            <li class="page-item"><a class="page-link" href='?page=${i}'>${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link active" href="">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pVO.nowPage < pVO.totalPage}">
                                <li class="page-item"><a class="page-link" href="'?page=${pVO.nowPage + 1}'">>
                                </a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>

</html>