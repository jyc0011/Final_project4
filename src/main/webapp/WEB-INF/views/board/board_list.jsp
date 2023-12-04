<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>게시판 글 목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        #wrapper {
            max-width: 1200px;
            margin: auto;
            display: flex;
        }
        .container {
            width: 1200px;
            display: flex;
            flex-direction: row;
        }
        main{
            width: 80%;
            padding: 20px;
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
            overflow: hidden;
        }

        #boardList .page > ul {
            margin: 30px 0;
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
            white-space: nowrap;

            /* 줄바꾸지 않음 */
            overflow: hidden;

            /* 넘친 데이터 숨기기*/
            text-overflow: ellipsis;

            /* 넘친 데이터 ...표  */
        }

        .page {
            text-align: center;
            height: 35px;
            width: 300px;
            margin: 5px auto;
        }

        .page > ul {
            padding-top: 5px;
            display: table;
            text-align: center;
            margin: 0 auto;
        }

        .page li {
            float: left;
            padding: 5px;
            line-height: 20px;
        }

        .search {
            text-align: center;
        }

        #sidebar {
            padding: 20px;
            width: 20%;
            height: 100vh;
            border-right: 1px solid #ccc;
        }
        .sidebar-menu {
            list-style-type: none;
            padding: 0;
        }

        .sidebar-menu > li a {
            text-decoration: none;
            color: black;
            display: block;
            padding: 10px;
            transition: all 0.3s;
        }

        .sidebar-menu li a:hover {
            background-color: #ddd;
        }
        .active {
            background-color: #ffe3a0;
            color: white;
        }

        #boardList li:nth-child(-n+5){
            font-weight: bold;
        }
        #boardList li:nth-child(2), #boardList li:nth-child(n+4):nth-child(-n+5){
            text-align: center;
        }
        #boardList>li:nth-child(5n+4), #boardList>li:nth-child(5n+5){
            text-align: center;
        }
        #writeBtn{
            margin: 10px 0;
        }
        #search-select{
            width: auto;
            height: 38px;
            margin-right: 20px;
        }
        #searchForm{
            height: 50px;
            text-align: center;
            justify-content: center;
            margin: 20px 0;
        }
        #search-div{
            width: 400px;
        }
    </style>
    <script>
        window.onload = function () {
            var pVO = "${pVO}";
            console.log(pVO);
        }
    </script>
</head>

<body>
    <div id="wrapper" class="container">
        <nav id="sidebar">
            <br/>
            <ul class="sidebar-menu">
                <li><a href="${pageContext.servletContext.contextPath}/board/notice"
                       <c:if test="${pVO.board_cat=='notice'}">class="current active"</c:if>>공지사항</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/board/free"
                       <c:if test="${pVO.board_cat=='free'}">class="current active"</c:if>>자유게시판</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/board/inquiries"
                       <c:if test="${pVO.board_cat=='inquiries'}">class="current active"</c:if>>문의게시판</a></li>
            </ul>
        </nav>
        <main>
            <h1>게시판목록</h1>
            <div id="boardTop">
                <div>총 레코드 수 : ${pVO.totalRecord}</div>
                <div>현재 페이지 : 1/${pVO.totalPage}</div>
            </div>
            <ul id="boardList">
                <li>글번호</li>
                <li>제목</li>
                <li>작성자</li>
                <li>조회수</li>
                <li>작성일</li>
                <!-- 데이터 표시 -->
                <c:forEach var="bVO" items="${list}">
                    <li>${bVO.post_id}</li>
                    <c:url var="viewUrl" value="${pageContext.servletContext.contextPath}/board/${pVO.board_cat}/view">
                        <c:param name="no" value="${bVO.post_id}"/>
                        <c:param name="searchKey" value="${pVO.searchKey}"/>
                        <c:param name="searchWord" value="${pVO.searchWord}"/>
                    </c:url>
                    <li><a href="${viewUrl}">${bVO.title}</a></li>
                    <li>${bVO.user_id}</li>
                    <li>${bVO.views}</li>
                    <li>${bVO.write_date}</li>
                </c:forEach>
            </ul>
            <div style="float:right">
                <c:if test="${'Y'.equals(logStatus)}">
                    <input type="button" value="글 작성" class="post-button" id="write-button"
                           onclick="location.href='${pageContext.servletContext.contextPath}/board/${pVO.board_cat}/write'">
                </c:if>
            </div>
            <!-- 페이지 박스-->
            <!-- todo: 페이지 인식해서 보이게 -->
            <div class="page">
                <ul>
                    <!-- prev 페이지 -->
                    <c:url var="prevUrl" value="${pageContext.servletContext.contextPath}/board/${pVO.board_cat}">
                        <c:param name="nowPage" value="${pVO.nowPage-1}"/>
                        <c:if test="${pVO.searchWord!=null}">
                            <c:param name="searchKey" value="${pVO.searchKey}"/>
                            <c:param name="searchWord" value="${pVO.searchWord}"/>
                        </c:if>
                    </c:url>
                    <c:choose>
                        <c:when test="${pVO.nowPage == 1}">
                            <li style="color: #ddd">prev</li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${prevUrl}">prev</a></li>
                        </c:otherwise>
                    </c:choose>
                    <!-- 페이지 번호 -->
                    <c:forEach var="cnt" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
                        <c:if test="${cnt<=pVO.totalPage}">
                            <!-- 페이지번호가 마지막 페이지보다 작거나 같을때만 번호 출력 -->
                            <c:if test="${cnt==pVO.nowPage }">
                                <!-- 현재 보고있는 페이지 -->
                                <li style="background-color: #ddd">${cnt}</li>
                            </c:if>
                            <!-- 현재 보고있는 페이지가 아닐경우 -->
                            <c:if test="${cnt!=pVO.nowPage}">
                                <c:url var="pageUrl"
                                       value="${pageContext.servletContext.contextPath}/board/${pVO.board_cat}/view">
                                    <c:param name="nowPage" value="${cnt}"/>
                                    <c:if test="${pVO.searchWord!=null}">
                                        <c:param name="searchKey" value="${pVO.searchKey}"/>
                                        <c:param name="searchWord" value="${pVO.searchWord}"/>
                                    </c:if>
                                </c:url>
                                <li>
                                    <a href="${pageContext.servletContext.contextPath}/board/${pVO.board_cat}?nowPage=${cnt}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${cnt}</a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                    <!-- next 페이지 -->
                    <c:url var="nextUrl" value="${pageContext.servletContext.contextPath}/board/${pVO.board_cat}">
                        <c:param name="nowPage" value="${pVO.nowPage+1}"/>
                        <c:if test="${pVO.searchWord!=null}">
                            <c:param name="searchKey" value="${pVO.searchKey}"/>
                            <c:param name="searchWord" value="${pVO.searchWord}"/>
                        </c:if>
                    </c:url>
                    <c:choose>
                        <c:when test="${pVO.nowPage == pVO.totalPage}">
                            <li style="color:#ddd">next</li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${nextUrl}">next</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <!-- 검색박스 -->
            <div class="post-end-line">
                <div class="inboard-search-area">
                    <div class="search flex-container"> <!-- Add a class to make this a flex container -->
                        <form method="get" action="${pageContext.servletContext.contextPath}/board/list"
                              onsubmit="return searchCheck()">
                            <select name="searchKey">
                                <option value="title" ${pVO.searchKey=='title' ? 'selected' : '' }>제목</option>
                                <option value="content" ${pVO.searchKey=='content' ? 'selected' : '' }>글내용
                                </option>
                                <option value="userid" ${pVO.searchKey=='userid' ? 'selected' : '' }>글쓴이
                                </option>
                            </select>
                            <input type="search" name="searchWord" id="inboard-search" value="${pVO.searchWord}"
                                   class="inboard-search" placeholder="게시판 내 검색"/>
                            <input type="submit" value="search" class="post-button" id="search-button"/>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>

</html>

<script>
    function searchCheck() {
        let searchWord = $("#inboard-search").val();
        if (searchWord === "") {
            alert("검색어를 입력해주세요");
            return false;
        }
        return true;
    }

    function updateURL() {
        const selectedValue = document.getElementById("post-sort-select").value;
        const currentURL = window.location.href;
        const newURL = currentURL + (currentURL.includes("?") ? "&" : "?") + "postSort=" + selectedValue;
        window.location.href = newURL;
    }

    function constructUrl() {
        let currentParams = new URLSearchParams(window.location.search);

        let category = $("#second-cat").val();
        let postSort = $("#post-sort-select").val();
        let searchWord = $("#inboard-search").val();

        if (category || category != "0") {
            currentParams.set('category', category);
        }
        if (postSort) {
            currentParams.set('postSort', postSort);
        } else {
            currentParams.set('postSort', "1");
        }
        /*if(searchWord){
            currentParams.set('searchWord', encodeURIComponent(searchWord));
        }*/

        let url = "${pageContext.servletContext.contextPath}/AuthCommunity/list";
        url += "?" + currentParams.toString();

        return url;
    }

    // 페이지가 로드되면 현재 URL의 값을 사용하여 드롭다운 값을 설정합니다.
    $(document).ready(function () {
        let params = new URLSearchParams(window.location.search);

        if (params.has('category')) {
            $('#second-cat').val(params.get('category'));
        }
        if (params.has('postSort')) {
            $('#post-sort-select').val(params.get('postSort'));
        }
    });

    $("#second-cat, #post-sort-select").change(function () {
        window.location.href = constructUrl();
    });

</script>