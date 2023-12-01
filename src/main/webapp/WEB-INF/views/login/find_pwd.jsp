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
            height: 600px;
            margin: 30px auto;
            display: flex;
            justify-content: space-evenly;
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

        .submitbtn {
            background-color: #FFB300;
            border: none;
            color: white;
            width: 400px;
            height: 40px;
            line-height: 40px;
        }

        .inputs {
            width: 400px;
            height: 40px;
            line-height: 40px;
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
        <h1>비밀번호 찾기</h1>
        <ul>
            <li><label>아이디</label></li>
            <li><input type="text" name="userid" id="userid" class="inputs" placeholder="아이디를 입력해주세요."/></li>
            <li><label>이메일</label></li>
            <li><input type="text" name="email" id="email" class="inputs" placeholder="이메일을 입력해주세요."/></li>
            <li style="margin-bottom: 50px"><input type="submit" name="find" id="find" value="인증번호 보내기"
                                                   class="submitbtn"/></li>

        </ul>
        <div id="result" style="text-align: center"></div>
        <div id="verification" style="display: none">
            <ul>
                <li><label>인증번호 입력</label></li>
                <li><input type="text" name="code" id="code" class="inputs"/></li>
                <li><input type="submit" id="verifybtn" class="submitbtn"/></li>
            </ul>
        </div>
    </form>
</main>
</body>
</html>
