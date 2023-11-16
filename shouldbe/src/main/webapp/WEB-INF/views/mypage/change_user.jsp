<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>회원정보수정</title>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <style>
                #wrapper {
                    max-width: 1200px;
                    margin: auto;
                    display: flex;
                }

                #sidebar {
                    padding: 20px;
                    width: 20%;
                    height: 100vh;
                    border-right: 1px solid #ccc;
                }

                #content {
                    padding: 20px;
                    width: 80%;
                }

                .sidebar-menu {
                    list-style-type: none;
                    padding: 0;
                }

                .sidebar-menu li a {
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
            </style>
        </head>

        <body>
            <div id="wrapper" class="container-fluid">
                <div id="sidebar">
                    <br/>
                    <ul class="sidebar-menu">
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/change_user" class="active">회원정보 수정</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/post_user">작성한글</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/friend_user">친구관리</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/withdraw_user">탈퇴하기</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/mypage/save_user">저장소</a></li>
                    </ul>
                </div>
                <div id="content" class="col-10">
                    <h2 class="mb-4">회원정보수정</h2>

                    <div class="text-center mb-3">
                        <img src="path_to_your_image.jpg" class="rounded-circle" alt="Profile Image"
                            style="width: 150px; height: 150px; object-fit: cover;">
                    </div>

                    <div class="text-center">
                        <button type="button" class="btn btn-primary me-2">이미지 변경</button>
                        <button type="button" class="btn btn-secondary">기본 이미지로 변경</button>
                    </div>

                    <form>
                        <div class="row mb-3 mt-3">
                            <label for="userid" class="col-sm-2 col-form-label">아이디</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="userid" placeholder="Enter userid"
                                    name="userid">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                                    name="pwd">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="pwd-confirm" class="col-sm-2 col-form-label">비밀번호확인</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="pwd-confirm"
                                    placeholder="Confirm password" name="pwd-confirm">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="language" class="col-sm-2 col-form-label">사용가능언어</label>
                            <div class="col-sm-10">
                                <select class="form-select" id="language" name="language">
                                    <option value="ko">한국어</option>
                                    <option value="en">English</option>
                                    <option value="jp">日本語</option>
                                    <!-- Other language options -->
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="intro" class="col-sm-2 col-form-label">자기소개</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="intro" placeholder="Write introduction"
                                    name="intro">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10 offset-sm-2">
                                <button type="submit" class="btn btn-primary">수정하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </body>
        </html>