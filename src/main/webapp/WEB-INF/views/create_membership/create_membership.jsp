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
            margin: 70px auto 30px;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            flex-direction: column;
        }

        .box {
            display: flex;
            margin-top: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        #create_Form > ul > li {
            list-style-type: none;
        }


        #username, #userid, #userpwd, #userpwdCheck, #email, #authenticate {
            width: 400px;
            height: 40px;
            margin: 5px auto;
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
            margin: 0 20px;
            width: 90px;
        }

        #nationselcet {
            margin: 20px auto;
        }

        .lang {
            margin: 10px auto;
        }
        .input-container{
            position:relative;
            margin-top:25px;
        }
        .input-container:nth-child(1) {
            margin-top: 0;
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
            padding: 8px 0 5px 0;
            font-size: 16px;
        }

        .input-container input:focus {
            border: none;
            outline: none;
            border-bottom: 1px solid #e74c3c;
        }
        .submitBtn{
            color:#fff;
            outline: none;
            border: 0;
            padding: 10px 20px;
            text-transform: uppercase;
            margin-top: 20px;
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

        .submitBtn {
            background-color: #FFB300;
            border: none;
            color: white;
        }

        input[type=checkbox], input[type=radio] {
            margin: 0 0 0 20px;
            padding: 0;
        }

        select::-ms-expand {
            display: none;
        }

        .select {
            -o-appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            width: 130px;
            height: 38px;
            background: url("../../../image/select.png")no-repeat center right;
            padding: 5px 30px 5px 20px;
            border-radius: 4px;
            outline: 0 none;
            border: 1px solid #6c757d;
            cursor: pointer;
        }
        .select option{
            background: #FFD954;
            padding: 3px 0;
        }

        #termsCheck {
            margin-top: 30px;
        }

        .col-sm-10{
            margin-left: 20px;
        }
        .btn-outline-secondary{
            width: 130px;
            margin:  5px 10px 0 0;
        }
    </style>
    <script>
        $(document).ready(function () {
            var result = "${result}";
            if (result != "") {
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
                            $("#emailCheckDiv").css('display', '');
                            // $("#authenticate").css('display', '');
                            // $("#checkcode").css('display', '');
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

                var terms1Checked = document.getElementById('terms1').checked;
                var terms2Checked = document.getElementById('terms2').checked;
                if (!terms1Checked || !terms2Checked) {
                    alert("약관에 동의하세요.");
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
    <div class="box">
        <form method="post" action="/createOk" id="create_Form">
            <div class="input-container">
                <input type="text" name="username" id="username" required=""/>
                <label>이름</label>
            </div>
            <div class="input-container">
                <input type="text" name="userid" id="userid" required=""/>
                <label>아이디</label>
                <input type="hidden" id="isIdChecked" value="N">
                <input type="button" value="아이디체크" id="idcheck" class="btn btn-warning submitBtn"
                       style="border-bottom: none"/>
            </div>
            <div class="input-container">
                <input type="password" name="userpwd" id="userpwd" onchange="checkpwd()" required=""/>
                <label>비밀번호</label>
            </div>
            <div class="input-container">
                <input type="password" name="userpwdCheck" id="userpwdCheck" onchange="checkpwd()" required=""/>
                <label>비밀번호 확인</label>
            </div>
            <div><span id="passwordCheckOk"></span></div>
            <div class="input-container">
                <input type="text" name="email" id="email" required=""/>
                <label>이메일</label>
                <input type="button" value="인증발송" id="sendcode" class="btn btn-warning submitBtn"
                       style="border-bottom: none"/>
            </div>
            <div class="input-container" id="emailCheckDiv" style="display: none;">
                <input type="text" id="authenticate" name="authenticate" required=""/>
                <label>인증번호</label>
                <input type="button" value="인증하기" id="checkcode" class="btn btn-warning submitBtn"
                       style="border-bottom: none"/>
            </div>
            <div id="checkbox-div">
                <div>
                    <label style="margin: 20px 0 5px 0">사용언어</label>
                </div>
                <div>
                    <input type="checkbox" class="lang" name="lang" value="ko"/>
                    <lebel>한국어</lebel>
                </div>
                <div>
                    <input type="checkbox" class="lang" name="lang" value="jp"/>
                    <lebel>일본어</lebel>
                </div>
                <div>
                    <input type="checkbox" class="lang" name="lang" value="en"/>
                    <lebel>영어</lebel>
                </div>
            </div>
            <div>
                <div style="margin:17px 0 5px">
                    <lebel>국적</lebel>
                </div>
                <select name="nation" id="nation" class="select" style="margin-left: 20px">
                    <option disabled selected>국적</option>
                    <option value="kor">한국</option>
                    <option value="us">미국</option>
                    <option value="jpn">일본</option>
                </select>
            </div>
            <div>
                <div style="margin-top: 17px">
                    <label>성별</label>
                </div>
                <div class="col-sm-10">
                    <input type="radio" class="btn-check sex" name="options-outlined sex" id="secondary-outlined-0" autocomplete="off" checked>
                    <label class="btn btn-outline-secondary" for="secondary-outlined-0" value="0">남자</label>

                    <input type="radio" class="btn-check sex" name="options-outlined sex" id="secondary-outlined-1" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="secondary-outlined-1" value="1">여자</label>
                </div>
            </div>
            <div id="termsCheck">
                <div>
                    <label style="cursor: pointer"><input type="checkbox" id="terms1" style="margin-right: 5px; cursor: pointer"/>이용약관 동의<strong>(필수)</strong></label>
                </div>
                <div>
                    <label style="cursor: pointer"><input type="checkbox" id="terms2" style="margin-right: 5px; cursor: pointer"/>개인정보 수집 동의<strong>(필수)</strong></label>
                </div>
            </div>
            <ul>
                <li><input type="submit" value="가입하기" id="join" class="btn btn-warning submitBtn"/></li>
                <li><input type="button" value="취소" id="cancel" class="btn btn-warning submitBtn"/></li>
            </ul>
        </form>
    </div>
</main>
</body>
</html>