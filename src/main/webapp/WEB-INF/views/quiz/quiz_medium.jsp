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
            margin: 100px auto;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#submitButton').prop('disabled', true);

            // Enable the submit button only when user input is present
            $('#userAnswer').on('input', function () {
                if ($(this).val().trim() !== '') {
                    $('#submitButton').prop('disabled', false);
                } else {
                    $('#submitButton').prop('disabled', true);
                }
            });
        });
        function displayLanguage() {
            var quizLang = "${quiz.quiz_lang}";
            var languageName = "";
            switch(quizLang) {
                case "ko":
                    languageName = "한국어";
                    break;
                case "en":
                    languageName = "영어";
                    break;
                case "jp":
                    languageName = "일본어";
                    break;
                case "zh-CN":
                    languageName = "중국어 간체";
                    break;
                case "zh-TW":
                    languageName = "중국어 번체";
                    break;
                case "vi":
                    languageName = "베트남어";
                    break;
                case "th":
                    languageName = "태국어";
                    break;
                case "id":
                    languageName = "인도네시아어";
                    break;
                case "fr":
                    languageName = "프랑스어";
                    break;
                case "es":
                    languageName = "스페인어";
                    break;
                case "ru":
                    languageName = "러시아어";
                    break;
                case "de":
                    languageName = "독일어";
                    break;
                case "it":
                    languageName = "이탈리아어";
                    break;
                default:
                    languageName = "알 수 없는 언어";
            }
            document.getElementById("language").innerText = languageName;
        }
        window.onload = displayLanguage;
    </script>
</head>

<body>
<main>
    <h1>중간 : <span id="language"></span></h1>
    <hr/>
    <b id="quiz_content">${quiz.quiz_content}</b>
    <form method="post" action="/quiz/checkAnswer">
        <input type="text" name="user_answer" placeholder="정답 입력"/>
        <input type="hidden" name="quiz_id" value="${quiz.quiz_id}"/>
        <input type="hidden" name="quiz_content" value="${quiz.quiz_content}"/>
        <input type="hidden" name="level" value="${quiz.level}"/>
        <input type="hidden" name="quiz_lang" value="${quiz.quiz_lang}"/>
        <input type="submit" value="제출"/>
    </form>
</main>
</body>

</html>