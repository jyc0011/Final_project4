<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>비밀번호 찾기</title>
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
            display: flex;
            padding: 100px 0;
            align-items: center;
            flex-direction: column;
        }

        #find_pwd_form > h1 {
            text-align: center;
        }

        li {
            list-style-type: none;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .submitBtn {
            background-color: #FFB300;
            border: none;
            color: white;
            width: 400px;
        }

        .inputs {
            width: 400px;
            height: 40px;
            line-height: 40px;
            margin: 5px 0;
        }

        .input-container {
            position: relative;
            margin-bottom: 25px;
        }

        .input-container label {
            position: absolute;
            top: 0;
            left: 0;
            font-size: 16px;
            pointer-event: none;
            transition: all 0.5s ease-in-out;
        }

        .input-container input {
            border: 0;
            border-bottom: 1px solid #555;
            background: transparent;
            width: 100%;
            padding: 8px 0 5px 0;
            font-size: 16px;
        }

        .input-container input:focus {
            border: none;
            outline: none;
            border-bottom: 1px solid #e74c3c;
        }

        .btn {
            color: #fff;
            outline: none;
            border: 0;
            padding: 10px 20px;
            text-transform: uppercase;
            margin-top: 30px;
            border-radius: 2px;
            cursor: pointer;
            position: relative;
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
        .input-container input:valid ~ label {
            top: -12px;
            font-size: 12px;

        }
    </style>
    <script>
        $(function () {
            $("#find").click(function () {
                event.preventDefault();

                var userid = $("#userid").val();
                var email = $("#email").val();
                $.ajax({
                    type: "POST",
                    url: "/login/sendcode",
                    data: {userid: userid, email: email},
                    success: function (r) {
                        console.log(r);
                        if (r == true) {
                            $("#verification").show();
                            $("#result").text("이메일이 발송되었습니다,");

                        } else {
                            $("#verification").hide();
                            $("#result").text("존재하지 않는 아이디 혹은 이메일입니다.");

                        }
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                });
            });

            $("#verifybtn").click(function () {
                event.preventDefault();

                var userid = $("#userid").val();
                var code = $("#code").val();
                var email = $("#email").val();
                $.ajax({
                    type: "POST",
                    url: "/login/verify",
                    data: {userid: userid, code: code, email: email},
                    success: function (r) {
                        console.log(r);
                        if (r == true) {

                            alert("변경된 비밀번호가 이메일로 발송되었습니다");
                            location.href = '/';
                        } else {
                            alert("오류!")
                        }


                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                });
            })
        });


    </script>
</head>
<body>
<main>
    <form method="post" id=find_pwd_form>
        <div class="input-container">
            <input type="text" name="userid" id="userid" class="inputs" required=""/>
            <label>아이디</label>
        </div>
        <div class="input-container">
            <input type="text" name="email" id="email" class="inputs" required=""/>
            <label>이메일</label>
        </div>
        <button type="submit" name="find" id="find" class="btn btn-warning submitBtn">인증번호 보내기</button>

        <div id="result" style="text-align: center; color: darkred; margin-top: 5px"></div>
        <div id="verification" style="display: none; margin-top: 20px">
            <div class="input-container">
                <input type="text" name="code" id="code" class="inputs" required=""/>
                <label>인증번호 입력</label>
            </div>
            <input type="submit" id="verifybtn" class="btn btn-warning submitBtn"/>
        </div>
    </form>
</main>
</body>
</html>
