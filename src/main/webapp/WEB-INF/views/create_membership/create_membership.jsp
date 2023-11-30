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
            height: 800px;
            margin: 30px auto;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            flex-direction: column;
        }

        h1 {
            text-align: center;
            margin: 50px;
        }

        #create_Form > ul > li {
            list-style-type: none;
        }

        .submitbtn {
            background-color: #FFB300;
            border: none;
            color: white;
        }

        #username, #userid, #userpwd, #userpwdCheck, #email, #authenticate {
            width: 400px;
            height: 40px;
            margin: 15px auto;
        }

        #join, #cancel {
            float: left;
            width: 100px;
            height: 40px;
            margin: 40px auto;
        }

        #create_Form {
            margin-left: 100px;
        }

        #join {
            margin-right: 200px;
        }

        #checkcode, #idcheck, #sendcode {
            margin: 20px;
        }

        #nationselcet {
            margin: 20px auto;
        }

        .lang {
            margin: 10px auto;
        }
    </style>
    <script>
        $(document).ready(function () {
            var result = "${result}";
            if ( result != "") {
                alert(result);
            }
        })
        var emailAuth = false;

        function checkpwd() {
            if (document.getElementById("userpwd").value != "" && document.getElementById("userpwdCheck").value != "") {
                if (document.getElementById("userpwd").value == document.getElementById("userpwdCheck").value) {
                    document.getElementById("passwordCheckOk").innerHTML = "비밀번호가 일치합니다.";
                    document.getElementById("passwordCheckOk").style.color = "blue";
                    return true;
                } else {
                    document.getElementById("passwordCheckOk").innerHTML = "비밀번호가 일치하지 않습니다.";
                    document.getElementById("passwordCheckOk").style.color = "red";
                    return false;
                }
            }
        }

        function isCheckedId() {
            if (document.getElementById("isIdChecked").value == "Y") {
                return true;
            }
            return false;
        }

        function isCheckedEmail() {
            if (emailAuth) {
                return true;
            }
            return false;

        }

        $(function () {

            //아이디 변경시 다시 중복검사
            $("#userid").keyup(function () {
                $("#isIdChecked").val("N");
            });
            $("#sendcode").on('click', function () {

                var email = $("#email").val();
                $.ajax({
                    type: "POST",
                    url: "/create/sendcode",
                    data: {email: email},
                    success: function (r) {
                        if (r) {
                            alert("이메일이 전송되었습니다.");
                            $("#authenticate").css('display', '');
                            $("#checkcode").css('display', '');
                        } else {
                            alert("이메일 발송 오류");
                        }
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                });
            });
            $("#checkcode").click(function () {
                var code = $("#authenticate").val();
                $.ajax({
                    type: "POST",
                    url: "/create/verify",
                    data: {code: code},
                    success: function (r) {
                        if (r) {
                            alert("인증되었습니다!");
                            emailAuth = true;

                            //$("#authenticate").css('', '');
                            //$("#checkcode").css('display', '');
                        } else {
                            alert("인증코드가 일치하지 않습니다!");
                        }
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                });
            });

            $("#idcheck").click(function () {
                var userid = $("#userid").val();
                if (userid == "") {
                    alert("아이디를 입력해주세요")
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "/idcheck",
                    data: {userid: userid},
                    success: function (r) {
                        if (r) {
                            alert("사용 가능한 아이디입니다.");
                            $("#isIdChecked").val("Y");
                        } else {
                            alert("사용 불가능한 아이디입니다.");
                            $("#isIdChecked").val("N");
                        }
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }

                });
            });

            $("#create_Form").submit(function () {
                if (!isCheckedId()) {
                    alert("아이디 중복 검사를 해주세요");
                    return false;
                }
                if (!checkpwd()) {//여러가지 체크들
                    alert("비밀번호가 일치하지 않습니다.");
                    return false;
                }
                if (!isCheckedEmail()) {
					alert("이메일 인증을 진행해주세요!");
                    return false;
                }
                //todo : 나머지 폼 검사(이름, 이메일, 국적, 성별, 언어 최소요구사항)

                return true;

            })
        });

    </script>
</head>
<body>
<main>
    <h1>회원가입</h1>
    <form method="post" action="/createOk" id="create_Form">
        <ul>
            <li><label>이름</label></li>
            <li><input type="text" id="username" name="username"/></li>
            <li><label>아이디</label></li>
            <li>
                <input type="text" id="userid" name="userid"/>
                <input type="hidden" id="isIdChecked" value="N">
                <input type="button" value="아이디체크" id="idcheck" class="submitbtn"/>
            </li>
            <li><label>비밀번호</label></li>
            <li><input type="password" id="userpwd" name="userpwd" onchange="checkpwd()"/></li>
            <li><label>비밀번호 확인</label></li>
            <li><input type="password" id="userpwdCheck" name="userpwdCheck" onchange="checkpwd()"/></li>
            <li><span id="passwordCheckOk"></span></li>
            <li><label>이메일</label></li>
            <li>
                <input type="text" id="email" name="email"/>
                <input type="button" value="인증발송" id="sendcode" class="submitbtn"/>
            </li>
            <li>
                <input type="text" id="authenticate" name="authenticate" style="display: none;"/>
                <input type="button" value="인증하기" id="checkcode" class="submitbtn" style="display: none;"/>
            </li>
            <li><label>사용언어</label></li>
            <li>
                한국어 <input type="checkbox" class="lang" name="lang" value="ko"/>
                일본어 <input type="checkbox" class="lang" name="lang" value="jp"/>
                영어 <input type="checkbox" class="lang" name="lang" value="en"/>
            </li>
            <li><label style="float: left; margin: 20px auto; margin-right: 10px;">국적</label></li>
            <li id="nationselcet">
                <select id="nation" name="nation">
                    <option value="kor">한국</option>
                    <option value="us">미국</option>
                    <option value="jpn">일본</option>
                </select>
            </li>
            <li><label style="float: left; margin-right: 10px;">성별</label></li>
            <li>
                남자 <input type="radio" class="sex" name="sex" value="0"/>
                여자 <input type="radio" class="sex" name="sex" value="1"/>
            </li>
            <li><input type="submit" value="가입하기" id="join" class="submitbtn"/></li>
            <li><input type="button" value="취소" id="cancel" class="submitbtn"/></li>
        </ul>
    </form>
</main>
</body>
</html>