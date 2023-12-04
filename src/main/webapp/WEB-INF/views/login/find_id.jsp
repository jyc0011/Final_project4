<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Insert title here</title>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
			<style>
				body {
					margin: 0 auto;
				}

				main {
					width: 1200px;
					margin: 0 auto;
					padding: 100px 0;
					display: flex;
					justify-content: center;
					justify-items: center;
					flex-direction: column;
					align-items: center;
				}

				#find_id_form>h1 {
					text-align: center;
				}

				#find_id_form>ul>li {
					list-style-type: none;
					margin-top: 5px;
					margin-bottom: 5px;
				}

				.submitBtn {
					background-color: #FFB300;
					border: none;
					color: white;
					margin-top: 30px;
					margin-bottom: 10px;
				}

				#find {
					width: 400px;
				}

				#username,
				#email {
					width: 400px;
					height: 40px;
					line-height: 40px;
					margin-top: 5px;
					margin-bottom: 5px;
				}

				#finded{
					width: 600px;
					height : 50px;
					display: none;
				}
				#finded>p {
					text-align: center;
				}

				#back,
				#find_pwd {
					float: right;
					margin: 20px 10px;
				}

				.input-container{
					position:relative;
					margin-bottom:25px;
				}
				.input-container label{
					position:absolute;
					top:0px;
					left:0px;
					font-size:16px;
					pointer-event:none;
					transition: all 0.5s ease-in-out;
				}
				.input-container input{
					border:0;
					border-bottom:1px solid #555;
					background:transparent;
					width:100%;
					padding:8px 0 5px 0;
					font-size:16px;
				}
				.input-container input:focus{
					border:none;
					outline:none;
					border-bottom:1px solid #e74c3c;
				}
				.btn{
					color:#fff;
					outline: none;
					border: 0;
					color: #fff;
					padding:10px 20px;
					text-transform:uppercase;
					margin-top:30px;
					border-radius:2px;
					cursor:pointer;
					position:relative;
				}
				/*.btn:after{
                    content:"";
                    position:absolute;
                    background:rgba(0,0,0,0.50);
                    top:0;
                    right:0;
                    width:100%;
                    height:100%;
                }*/
				.input-container input:focus ~ label,
				.input-container input:valid ~ label{
					top:-12px;
					font-size:12px;

				}
			</style>
			<script>
				$(function () {
					$("#find_pwd").on('click', function () {
						location.href = "/login/findpwd";
					});
					$("#back").on('click', function () {
						location.href = "/login";
					});
					$("#find").click(function () {
						event.preventDefault();
						var username = $("#username").val();
						var email = $("#email").val();
						$.ajax({
							type : "POST",
							url : "/login/findidOk",
							data : {username : username,email : email},
							success : function(r){
								console.log(r);
								if(r == "") {
									$("#finded").css('display', 'block');
									$("#find_pwd").css('display', 'none');
									$("#result").text("아이디를 찾을 수 없습니다.");
								}else{
									$("#finded").css('display', 'block');
									$("#find_pwd").css('display', 'block');
									$("#result").text("아이디는 " + r + " 입니다.");

								}


							},
							error : function(e){
								console.log(e.responseText);
							}

						});

					});


				});
			</script>
		</head>

		<body>
			<main>
				<form method="post" id="find_id_form">
					<div class="input-container">
						<input type="text" name="username" id="username" required=""/>
						<label>이름</label>
					</div>
					<div class="input-container">
						<input type="text" name="email" id="email" required=""/>
						<label>이메일</label>
					</div>
					<button type="submit" name="find" id="find" class="btn btn-warning submitBtn">아이디 찾기</button>
				</form>
				<div id="finded">
					<hr />
					<p id="result"></p>
					<input type="button" value="뒤로가기" class="submitBtn" id="back" />
					<input type="button" value="비밀번호찾기" class="submitBtn" id="find_pwd" />
				</div>
			</main>
		</body>

		</html>