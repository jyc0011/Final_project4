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
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif; /* 폰트 설정 */
        }

        main {
            width: 80%;
            max-width: 1200px;
            margin: 50px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .form input[type="text"] {
            width: 60%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .form input[type="submit"] {
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .form input[type="submit"]:hover {
            background-color: #ffe3a0;
        }

        #answer_lang {
            word-wrap: break-word;
            max-width: 100%;
            margin-top: 10px;
            text-align: center;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#submitButton').prop('disabled', true);
            console.log("quiz.answer_lang:", "${quiz.answer_lang}");
            // Enable the submit button only when user input is present
            $('#userAnswer').on('input', function () {
                if ($(this).val().trim() !== '') {
                    $('#submitButton').prop('disabled', false);
                } else {
                    $('#submitButton').prop('disabled', true);
                }
            });

            displayLanguage();
            displayAnswerLang();
        });
        function displayLanguage() {
            var quizLang = "${quiz.quiz_lang}";
            var languageName = "";

            switch(quizLang) {
                case "ko":
                    languageName = "한국어";
                    break;
                case "en":
                    languageName = "English";
                    break;
                case "ja":
                    languageName = "日本語";
                    break;
                case "zh-CN":
                    languageName = "简体中文";
                    break;
                case "zh-TW":
                    languageName = "繁體中文";
                    break;
                case "vi":
                    languageName = "Tiếng Việt";
                    break;
                case "th":
                    languageName = "แบบไทย";
                    break;
                case "id":
                    languageName = "Indonésia";
                    break;
                case "fr":
                    languageName = "Français";
                    break;
                case "es":
                    languageName = "Español";
                    break;
                case "ru":
                    languageName = "Русский";
                    break;
                case "de":
                    languageName = "Deutsch";
                    break;
                case "it":
                    languageName = "Italiano";
                    break;
                default:
                    languageName = "알 수 없는 언어";
            }
            document.getElementById("language").innerText = languageName;
        }

        function displayAnswerLang() {
            var ansLang = "${quiz.answer_lang}".replace(/[\[\]]/g, '').split(",").map(function(lang) {
                return lang.trim(); // 공백 제거
            });
            console.log(ansLang);
            var fullNames = ansLang.map(getLanguageFullName).join(', ');
            document.getElementById('answer_lang').innerText = fullNames;
        }


        function getLanguageFullName(langCode) {
            var langNames = {
                'ko': '한국어',
                'en':'English',
                'ja': '日本語',
                'zh_TW':'繁體中文',
                'zh-CN':'简体中文',
                'vi':'Tiếng Việt',
                'th':'แบบไทย',
                'id':'Indonésia',
                'fr':'Français',
                'es':'Español',
                'ru':'Русский',
                'de':'Deutsch',
                'it':'Italiano'
            };

            return langNames[langCode] || langCode;
        }
    </script>
</head>

<body>
<main>
    <h1>어려움 : <span id="language"></span></h1>
    <h3>정답 언어 : <span id="answer_lang"></span></h3>
    <hr/>
    <div class="form">
        <b id="quiz_content">${quiz.quiz_content}</b>
        <form method="post" action="/quiz/checkAnswer">
            <input type="text" name="user_answer" placeholder="정답 입력"/>
            <input type="hidden" name="quiz_id" value="${quiz.quiz_id}"/>
            <input type="hidden" name="quiz_content" value="${quiz.quiz_content}"/>
            <input type="hidden" name="level" value="${quiz.level}"/>
            <input type="hidden" name="quiz_lang" value="${quiz.quiz_lang}"/>
            <input type="submit" value="제출"/>
        </form>
    </div>
</main>
</body>
</html>