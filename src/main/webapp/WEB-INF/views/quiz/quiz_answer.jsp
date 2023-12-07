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

        .quiz-container {
            width: 100%;
            max-width: 1200px;
            margin: auto;
            padding: 50px 15px;
            border-radius: 5px;
        }

        .quiz-lang , .quiz-content, .user-answer, .correct-answer, .result{
            margin-bottom: 20px;
        }

        .quiz-lang label, .quiz-content label, .user-answer label, .correct-answer label, .result label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .correct-answer {
            max-width: 350px;
            word-wrap: break-word;
        }

        .buttons {
            display: flex;
            justify-content: center;
        }

        .buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        .buttons button:hover {
            background-color: #48270c;
            color: #f9f9f9;
        }
    </style>
    <script>
        $(document).ready(function () {
            var level = ${quizVO.level};
            var levelDescription = "";
            switch (level) {
                case 1:
                    levelDescription = "쉬움";
                    break;
                case 2:
                    levelDescription = "중간";
                    break;
                case 3:
                    levelDescription = "어려움";
                    break;
                default:
                    levelDescription = "알 수 없음";
            }
            $('#level').text(levelDescription);
        });

        function saveQuiz() {
            var quizId =${quizVO.quiz_id};
            $.ajax({
                url: '/quiz/save',
                type: 'POST',
                data: {
                    quizId: quizId,
                },
                success: function () {
                    alert('정보가 성공적으로 저장되었습니다.');
                },
                error: function () {
                    alert("이미 저장된 내용입니다!");
                }
            });
        }

        function nextQuiz() {
            var level = '${quizVO.level}'; // JSP 변수에서 레벨 가져오기
            console.log(level)
            var url;
            if (level === '1') {
                url = '/quiz/easy';
            } else if (level === '2') {
                url = '/quiz/medium';
            } else if (level === '3') {
                url = '/quiz/hard';
            } else {
                url = '/quiz';
            }
            window.location.href = url;
        }
        function displayLanguage() {
            var quizLang = "${quizVO.quiz_lang}";
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
<main class="quiz-container">
    <h1 id="level" class="quiz-level">${quizVO.level}</h1>
    <hr/>
    <div class="quiz-lang">
        <label>퀴즈 언어</label>
        <p id="quizLang"><span id="language"></span></p>
    </div>
    <div class="quiz-content">
        <label>퀴즈 내용</label>
        <p id="quizContent">${quizVO.quiz_content}</p>
    </div>
    <div class="user-answer">
        <label>사용자 답변</label>
        <p id="userAnswer">${user_answer}</p>
    </div>
    <div class="correct-answer">
        <label>정답</label>
        <p id="correctAnswer">${quizVO.answer}</p>
    </div>
    <div class="result">
        <label>결과</label>
        <p id="result">${result == 'correct' ? '정답입니다!' : '틀렸습니다.'}</p>
    </div>
</main>
<div class="buttons">
    <button type="button" onclick="saveQuiz()">저장소에 저장</button>
    <hr/>
    <button type="button" onclick="nextQuiz()">다음 문제</button>
</div>
</body>


</html>