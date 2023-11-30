 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>should be</title>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
			<style>
				body {
					margin: 0 auto;
				}

				main {
					width: 1200px;
					display: flex;
					margin: 0 auto;
					flex-direction: column;
					justify-content: space-around;
					align-items: center;
					text-align: center;
				}


				.temp-login {
					width: 1200px;
					margin: 100px auto;
					display: flex;
					justify-content: space-around;
					align-items: center;
				}

				#main_img_box{
					width: 1200px;
					height: 400px;
					border: 1px solid #ddd;
				}
				#main_img{
					width: 100%;
					height: 100%;
					object-fit: cover;
					display: flex;
					justify-content: center;
					align-items: center;
				}

				#main_img_box figure img {
					opacity: 1;
					-webkit-transition: .3s ease-in-out;
					transition: .3s ease-in-out;
				}
				#main_img_box figure:hover img {
					opacity: .5;

				}

				/* 메인 이미지 시작*********************************************/
				.banner_img{
					display:inline-block;
					position: relative;

				}
				.banner_img:hover:after,
				.banner_img:hover > .hover_text
				{
					display:block;
				}
				.banner_img:after,.hover_text{
					display:none;
				}
				.banner_img:after{
					content:'';
					position: absolute;
					top: 0;
					right: 0;
					bottom: 0;
					left: 0;
					background: rgba(0, 0, 0, 0.3);
					z-index: 10;
				}
				.banner_img {
					overflow: hidden;
				}
				.banner_img img{
					width: 1200px;
					height: 400px;
				}
				.banner_img:hover img{
					transform: scale(1.2);
					transition: 1s;
				}
				.hover_text {
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate( -50%, -50% );
					color: #fff;
					z-index: 20;
					font-weight: 600;
					font-size: 40px;

				}
				/* 메인 이미지 끝*/

				/* 셀렉트 박스 시작********************************************/
				.select_box {
					width: 1200px;
					height: 400px;
					padding: 0.5em;
					background-color:  #fff;
					display: flex;
					flex-direction: row;
					justify-content: space-evenly;
				}

				.box {
					margin: auto 0 ;
					border: 3px solid white;
					border-radius: 50px;
					width: 240px;
					height: 240px;
					padding: 1em;
					font-size: 2em;
					background-color:#FFD954;/*FFD954 f2ab39*/
					color: white;
				}

				.select_box_img{
					width: 100%;
					height: 100%;
				}
				/* 셀렉트 박스 끝*/

				/* 유튜브 박스 시작********************************************/
				.youtube_box{
					width: 1200px;
					height: 500px;
					border: 10px solid #69491a;
					border-radius: 50px;
					display: flex;
				}
				.youtube_video{
					width: 67%;
					height: 100%;
				}
				.youtube_video iframe{
					/*margin: auto;*/
					width:100%;
					height:100%;/*780px  452px*/
					border-radius: 40px;
				}
				.youtube_link{
					width: 33%;
					height: 100%;
					border: 1px solid #ddd;
				}

				/* 유튜브 박스 끝*/

				/* 광고 이미지 시작********************************************/
				.main_ad_box img{
					width: 1200px;
					height: 600px;
				}
				/* 광고 이미지 끝*/

				.slide{
					margin-bottom: 30px;
				}
				#intro{
					display: flex;
					flex-direction: row;
					font-size: 2em;
					font-weight: bold;
					line-height: 200px;
				}
				#intro img{
					margin: 20px 10px;
				}
				#intro-box{
					margin-bottom: 30px;
				}

			</style>
		</head>

		<body>
			<main>
				<!--메인 이미지 시작------------------------------------------------------>
				<div class="banner_img"><!--a href="#;" -->
					<img src="/image/img_main_1.jpg" alt=" 배경">
					<p class="hover_text"></p>
					<p class="hover_text">
						소통과 학습<br/>
						쇼드비에 오신걸 환영합니다.
					</p>
				</div>
				<!--메인 이미지 끝-->

				<!--셀렉트 버튼 시작------------------------------------------------------>
				<div class="select_box">
					<a href="#;" class="box">
						<div class="">
							<img class="select_box_img" src="/image/img_selectbox_people.png">
						</div>
					</a>
					<a href="#;" class="box">
						<div class="">
							<img class="select_box_img" src="/image/img_selectbox_board.png">
						</div>
					</a>
					<a href="#;" class="box">
					<div class="">
						<img class="select_box_img" src="/image/img_selectbox_quiz.png">
					</div>
					</a>
					<a href="#;" class="box">
					<div class="">
						<img class="select_box_img" src="/image/img_selectbox_chat.png">
					</div>
					</a>
				</div>
				<!--셀렉트 버튼 끝-->

				<div id="intro-box">
					<div id="intro">
						<img src="../../image/main/chat.png">
						<p>실시간 채팅으로 원어민과 대화해요!</p>
					</div>
					<div id="intro">
						<p>다양한 언어를 배워봐요!</p>
						<img src="../../image/main/map.png">
					</div>
					<div id="intro">
						<img src="../../image/main/community.png">
						<p>다양한 사람들과 교류할 수 있어요!</p>
					</div>
				</div>

				<!--유튜브 박스 시작----------------------------------------------------->
				<div class="youtube_box">
					<div class="youtube_video"><!--1.7777배-->
						<iframe  src="https://www.youtube.com/embed/IcFD_MKHa7M?si=82yNyVvjhcA24jau" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					</div>
					<div class="youtube_link">
						<div>dsfd</div>
					</div>
				</div>
				<!--유튜브 박스 끝-->

				<!--광고 이미지 시작------------------------------------------------------>
				<a href="#;" class="main_ad_box">
					<img src="/image/img_main_ad2.jpg">
				</a>
				<a href="#;" class="main_ad_box">
					<img src="/image/img_main_ad.png" >
				</a>
				<!--광고 이미지 끝-->

				<!-- Carousel -->
				<div id="demo" class="carousel slide" data-bs-ride="carousel">

					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
					</div>

					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src=">../../image/banner/banner1.png" alt="banner1" class="d-block" style="width:100%">
						</div>
						<div class="carousel-item">
							<img src="../../image/banner/banner2.png" alt="banner2" class="d-block" style="width:100%">
						</div>
						<div class="carousel-item">
							<img src="../../image/banner/banner3.png" alt="banner3" class="d-block" style="width:100%">
						</div>
						<div class="carousel-item active">
							<img src="../../image/banner/banner4.png" alt="banner4" class="d-block" style="width:100%">
						</div>
						<div class="carousel-item">
							<img src="../../image/banner/banner5.png" alt="banner5" class="d-block" style="width:100%">
						</div>
					</div>

					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
				<div>


				<body>

				</body>

			</main>
			<div class="temp-login">
				<br />
				<p>현재 아이디 : ${logId} / 로그인 상태 : ${logStatus}</p>
			</div>


		</body>

		</html>