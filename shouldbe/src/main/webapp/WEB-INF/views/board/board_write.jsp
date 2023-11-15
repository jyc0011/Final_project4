<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<style>
    main{
        width: 1000px;
        margin: 0 auto;
    }

    #replyArea{
        padding:10px 0px;
    }
    #coment{
        width:600px; height: 81px;
    }
    #replyList>li{
        border-bottom:1px solid #ddd;

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

    /* header 메뉴 */
    .topMenu{
        height: 40px;
        background-color: #002B5B;
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
</style>
<script>

</script>
<main>
    <h1>글 내용 보기</h1>
    <button type="button" class="btn btn-primary">Primary</button>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Email address</label>
        <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
    </div>
    <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
    </div>
    <div>
        <!-- 현재글쓴이와 로그인 아이디가 같을 때만 수정 삭제 가능 -->
        <c:if test="${vo.userid == logId}">
            <a href="/campus/board/edit?no=${vo.no}">수정</a>
            <a href="javascript:boardDel()">삭제</a>
        </c:if>
    </div>

    <!-- 댓글 -->
    <div id="replyArea">
        <!-- 로그인 상태일 때 댓글쓰기 -->
        <c:if test="${logStatus=='Y'}">
            <form method="post" id="replyForm">
                <!--  원글 글번호 -->
                <input type="hidden" name="no" value="${vo.no}"/>
                <textarea name="coment" id="coment"></textarea>
                <!-- button은 form안에있을경우 input type submit과 동일 -->
                <button>댓글등록</button>
            </form>
        </c:if>
        <!-- 댓글목록 -->
        <div style="background-color:#FFF3FE">댓글 목록</div>
        <ul id="replyList">
            <li>
                <div>
                    <b>goguma</b>(2023-10-10 12:12:23)
                    <input type="button" value="Edit"/>
                    <input type="button" value="Del"/>
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
                    <input type="button" value="Edit"/>
                    <input type="button" value="Del"/>
                    <p>댓글 공부중55555.5.5</p>
                </div>
            </li>
        </ul>
    </div>

</main>