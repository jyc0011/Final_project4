<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <style>
                .banner {
                    width: 1200px;
                    margin: 0 auto;
                    position: relative;
                    height: 200px;
                }

                .logo-area {
                    text-align: center;
                    position: absolute;
                    width: 100%;
                    top: 50%;
                    transform: translateY(-50%);
                }

                .login {
                    position: absolute;
                    right: 0;
                    top: 50%;
                    transform: translateY(-50%);
                }

                .nav {
                    display: flex;
                    justify-content: space-around;
                    align-items: center;
                    text-align: center;
                    max-width: 1200px;
                    margin: 0 auto;
                }

                .dropdown {
                    position: relative;
                    display: inline-block;
                    text-align: center;
                }

                .dropbtn {
                    padding: 16px;
                    font-size: 16px;
                    border: none;
                    cursor: pointer;
                    text-decoration: none;
                    color: black;
                }

                .dropdown-content {
                    display: none;
                    position: absolute;
                    background-color: #f9f9f9;
                    min-width: 160px;
                    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                    z-index: 1;
                    left: 50%;
                    transform: translateX(-50%);
                }

                .dropdown-content a {
                    color: black;
                    padding: 12px 16px;
                    text-decoration: none;
                    display: block;
                }

                .dropdown-content a:hover {
                    background-color: #f1f1f1;
                }

                .dropdown:hover .dropdown-content {
                    display: block;
                }

                .category {
                    display: flex;
                    justify-content: space-around;
                    text-align: center;
                }

                .category .dropdown {
                    margin: 0 50px;
                }

                .banner::after {
                    content: "";
                    display: table;
                    clear: both;
                }
            </style>

        </head>
        <script>
            $('.dropbtn').on('mouseover', function () {
                $(this).next('.dropdown-content').show();
            });

            $('.dropdown').on('mouseleave', function () {
                $(this).find('.dropdown-content').hide();
            });

        </script>
        <!-- 로고, 로그인,로그아웃, 마이페이지, 유저아이콘 -->
        <div class="banner">
            <div class="logo-area">
                <a href="${pageContext.servletContext.contextPath}/"><img
                        src="${pageContext.servletContext.contextPath}/image/logo.png" class="logo"></a>
                <!-- 로고 이미지 -->
            </div>
            <div class="login">
                <c:if test="${LogStatus=='Y'}">
                    <a href="${pageContext.servletContext.contextPath}/Mypage?id=${LogId}"> <!-- 마이페이지 -->
                        <img src="" class="user-icon" id="user-icon" style="border-radius: 50%;" /></a>
                    <!--유저로고-->
                    <a href="${pageContext.servletContext.contextPath}/logout" class="login-button">로그아웃</a>
                </c:if>
                <c:if test="${LogStatus!='Y'}">
                    <a href="${pageContext.servletContext.contextPath}/login" class="login-button">로그인</a>
                </c:if>
            </div>
        </div>

        <div class="nav">
            <div class="category">
                <!-- 마이페이지 Dropdown -->
                <div class="dropdown">
                    <a href="${pageContext.servletContext.contextPath}/mypage/change_user" class="dropbtn">마이페이지</a>
                    <c:if test="${LogStatus=='Y'}">
                        <div class="dropdown-content">
                            <a href="${pageContext.servletContext.contextPath}/mypage/change_user">회원정보 수정</a>
                            <a href="${pageContext.servletContext.contextPath}/mypage/post_user">작성한 글</a>
                            <a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구관리</a>
                            <a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user">탈퇴하기</a>
                            <a href="${pageContext.servletContext.contextPath}/mypage/save_user">저장소</a>
                        </div>
                    </c:if>
                </div>

                <!-- 게시판 Dropdown -->
                <div class="dropdown">
                    <a href="#" class="dropbtn">게시판</a>
                    <div class="dropdown-content">
                        <a href="${pageContext.servletContext.contextPath}/board">공지사항</a>
                        <a href="${pageContext.servletContext.contextPath}/board/free">자유게시판</a>
                        <a href="${pageContext.servletContext.contextPath}/board/resources">자료게시판</a>
                        <a href="${pageContext.servletContext.contextPath}/board/inquiries">문의 게시판</a>
                    </div>
                </div>

                <!-- 퀴즈 Dropdown -->
                <div class="dropdown">
                    <a href="/quiz/main" class="dropbtn">퀴즈</a>
                    <div class="dropdown-content">
                        <a href="${pageContext.servletContext.contextPath}/quiz/main">퀴즈</a>
                        <a href="${pageContext.servletContext.contextPath}/quiz/create">퀴즈 등록하기</a>
                    </div>
                </div>

                <!-- 채팅 Dropdown -->
                <div class="dropdown">
                    <a href="#" class="dropbtn">채팅</a>
                    <div class="dropdown-content">
                        <a href="${pageContext.servletContext.contextPath}/Chat/list">채팅</a>
                        <a href="${pageContext.servletContext.contextPath}/Chat/partners">채팅 파트너</a>
                    </div>
                </div>
            </div>
        </div>
        <hr style="margin-bottom: 0px;">

        </html>