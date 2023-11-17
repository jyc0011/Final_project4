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
        main {
            width: 1000px;
            margin: 0 auto;
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

        .topMenu > ul {
            height: 40px;
            margin: 0 auto;
            width: 1000px;
        }

        .topMenu li {
            float: left;
            padding: 0px 30px;
            height: 40px;
            line-height: 40px;

        }

        .topMenu a:link,
        .topMenu a:visited {
            color: white;
        }

        .topMenu a:hover {
            color: yellow;
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
            white-space: nowrap;
            /* 줄바꾸지 않음 */
            overflow: hidden;
            /* 넘친 데이터 숨기기*/
            text-overflow: ellipsis;
            /* 넘친 데이터 ...표  */
        }

        .page {
            text-align: center;
            height: 50px;
            width: 300px;
            margin: 0 auto;
        }

        .page > ul {
            display: table;
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

        #sideMenu {
            list-style-type: none;
            padding: 0px;
            margin: 0px;
            width: 100px;
            height: 100%;
            overflow: auto;
            position: absolute;
        }

        #sideMenu > li a {
            text-decoration: none;
            padding: 10px;
            display: block;
            color: #000;
            font-weight: bold;
        }

        #sideMenu > li a:hover {
            background: #333;
            color: #fff;
        }

        #sideMenu > li a.current {
            background: #333;
            color: #fff;
        }
    </style>
</head>

<ul id="sideMenu">
    <li><a href="#" class="current">공지사항</a></li>
    <li><a href="#">자유게시판</a></li>
    <li><a href="#">문의게시판</a></li>
</ul>

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
        <li><a href="${pageContext.servletContext.contextPath}/board/view">제목입니다</a></li>
        <li>작성자</li>
        <li>0</li>
        <li>2023-11-13</li>
    </ul>
    <!-- 페이지 박스-->
    <div class="page">
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
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
                           class="inboard-search" placeholder="게시판 내 검색">
                    <input type="submit" value="search" class="post-button" id="search-button">
                </form>
                <c:if test="${LogStatus=='Y'}">
                    <a href="${pageContext.servletContext.contextPath}/board/write">
                        <input type="button" value="글 작성" class="post-button" id="write-button">
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    <c:url var="prevUrl" value="/board/list">
        <c:param name="nowPage" value="${pVO.nowPage-1}"/>
        <c:param name="searchKey" value="${pVO.searchKey}"/>
        <c:param name="searchWord" value="${pVO.searchWord}"/>
        <c:param name="category" value="${pVO.category}"/>
        <c:param name="postSort" value="${pVO.postSort}"/>
    </c:url>

    <c:url var="nextUrl" value="/board/list">
        <c:param name="nowPage" value="${pVO.nowPage+1}"/>
        <c:param name="searchKey" value="${pVO.searchKey}"/>
        <c:param name="searchWord" value="${pVO.searchWord}"/>
        <c:param name="category" value="${pVO.category}"/>
        <c:param name="postSort" value="${pVO.postSort}"/>
    </c:url>
    <div class="paging">
        <ul>
            <!-- prev 페이지 -->
            <c:choose>
                <c:when test="${pVO.nowPage == 1}">
                    <li>prev</li>
                </c:when>
                <c:otherwise>
                    <li><a href="${prevUrl}">prev</a></li>
                </c:otherwise>
            </c:choose>

            <!-- 번호 페이지 -->
            <c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount - 1}"
                       step="1">
                <c:if test="${p <= pVO.totalPage}">
                    <c:url var="pageNumUrl" value="/board/list">
                        <c:param name="nowPage" value="${p}"/>
                        <c:param name="searchKey" value="${pVO.searchKey}"/>
                        <c:param name="searchWord" value="${pVO.searchWord}"/>
                        <c:param name="category" value="${pVO.category}"/>
                        <c:param name="postSort" value="${pVO.postSort}"/>
                    </c:url>
                    <c:choose>
                        <c:when test="${p == pVO.nowPage}">
                            <li class="paging-button active">${p}</li>
                        </c:when>
                        <c:otherwise>
                            <li class="paging-button">
                                <a href="${pageNumUrl}">${p}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </c:forEach>
            <!-- next 페이지 -->
            <c:choose>
                <c:when test="${pVO.nowPage < pVO.totalPage}">
                    <li><a href="${nextUrl}">next</a></li>
                </c:when>
                <c:otherwise>
                    <li>next</li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</main>
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