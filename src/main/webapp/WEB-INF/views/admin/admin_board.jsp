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
            padding: 98px 10px 0;
            width: 150px;
            height: 1000px;
            list-style-type: none;
            border-right: 1px solid #ddd;
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
            width: 900px;
            height: auto;
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
            height: 50px;
            line-height: 50px;
            text-align: center;
        }

        .board_list td {
            padding: 0 10px;
            height: 75px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: center;
        }
        .board_list th:nth-child(6n+1), .board_list td:nth-child(6n+1) {
            width: 100px;
        }
        .board_list th:nth-child(6n+2), .board_list td:nth-child(6n+2) {
            width: 260px;
        }
        .board_list th:nth-child(6n+3), .board_list td:nth-child(6n+3) {
            width: 70px;
        }

        .board_list th:nth-child(6n+4), .board_list td:nth-child(6n+4) {
            width: 80px;
        }

        .board_list th:nth-child(6n+5), .board_list td:nth-child(6n+5) {
            width: 100px;
        }

        .board_list th:nth-child(6n+6), .board_list td:nth-child(6n+6) {
            width: 140px;
        }

        #list_content {
            border-bottom: 1px solid #ddd;
        }

        #side_menu li a.active{
            background-color: #333333;
            color: white;
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

        .management_list>td{
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
            <li><a href="${pageContext.servletContext.contextPath}/admin/board" class="active">게시글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/reply">댓글관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/quiz/list">퀴즈관리</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/admin/chat/management">채팅관리</a></li>
        </ul>
    </nav>
    <main>
        <h1 id="boardListTitle">게시글 관리</h1>
        <br>
        <div class="col-sm-12" id="boardList">
            <table id="example" class="display" style="width:100%">
                <thead id="list_head">
                <tr class="board_list">
                    <th class="board">게시판</th>
                    <th class="board_title">글제목</th>
                    <th class="user_id">작성자</th>
                    <th class="report_count">신고일</th>
                    <th class="report_reason">계정정지</th>
                    <th class="del_button">신고 취소</th>
                </tr>
                </thead>
                <tbody id="list_content">
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
                                <c:otherwise>
                                    자유 게시판
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="board_title"><a href="${pageContext.servletContext.contextPath}/board/notice/view?no=${bVO.post_id}">${bVO.title}</a></td>
                        <td class="user_id">${bVO.user_id}</td>
                        <td class="report_count">${bVO.report_time}</td>
                        <td class="suspend_button">
                            <a href="#layer-popup" class="btn-open" title="">
                                <input id="btn_postid" name="post_id" type="hidden" value="${bVO.post_id}">
                                <input id="btn_userid" name="user_id" type="hidden" value="${bVO.user_id}">
                                <input type="button" value="계정정지" class="btn btn-dark suspend_btn">
                            </a>
                        </td>
                        <td class="del_button">
                            <a href="${pageContext.servletContext.contextPath}/boardDelete?post_report_id=${bVO.post_report_id}">
                                <!---->
                                <input type="button" value="신고 취소" class="btn btn-dark">
                            </a>
                        </td>
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
                                <li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath}/admin/board?page=${pVO.nowPage - 1}"><
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
                                <li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath}/admin/board?page=${pVO.nowPage + 1}">>
                                </a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <div class="layer-popup" id="layer-popup">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="${pageContext.servletContext.contextPath}/suspend/board">
                    <div class="mb-3 mt-3">
                        <input type="hidden" id="form_postid" name="post_id" value="">
                        <input type="hidden" id="form_userid" name="user_id" value="">
                        <label class="form-label">정지 시간:</label>
                        <!--<input type="text" value="" class="form-control" name="time" id="time" placeholder="Enter email">-->
                        <select id="time" name="time">
                            <option value="1">1일</option>
                            <option value="3">3일</option>
                            <option value="7">7일</option>
                            <option value="15">15일</option>
                            <option value="30">30일</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">정지 사유:</label>
                        <input type="text" class="form-control"name="reason" id="form_reason" placeholder="사유를 입력해주세요" >
                    </div>
                    <button type="submit" class="btn btn-primary">정지</button>
                    <button type="button" class="btn btn-primary" onclick="dialogCancel()">취소</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).on("click", ".btn-open", function (e){
            var target = $(this).attr("href");
            var pid=$(this).children("#btn_postid").val();
            var uid=$(this).children("#btn_userid").val();
            $(target).addClass("show");
            $("#form_userid").attr("value",uid);
            $("#form_postid").attr("value",pid);
        });

        // 외부영역 클릭 시 팝업 닫기
        $(document).mouseup(function (e){
            var LayerPopup = $(".layer-popup");
            if(LayerPopup.has(e.target).length === 0){
                LayerPopup.removeClass("show");
            }
        });

        function dialogCancel(){
            var LayerPopup = $(".layer-popup");
            LayerPopup.removeClass("show");
        }
    </script>
    <style>
        .layer-popup {
            display: none;
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 100;
        }

        .layer-popup.show {
            display: block;
        }

        .modal-dialog {
            width: 500px;
            margin: 40px auto;
            background-color: #fff;
        }

        .modal-content {
            padding:10px 15px;
            text-align: center;
        }
    </style>


</div>
</body>

</html>