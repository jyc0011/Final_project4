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
            background-color: #f9f9f9;
        }

        .quiz-content, .user-answer, .correct-answer, .result {
            margin-bottom: 20px;
        }

        .quiz-content label, .user-answer label, .correct-answer label, .result label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
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
            console.log('${quizInfo}');
        });

        function saveQuiz() {
            // Save button click event
            $('input[type="button"]').on('click', function () {
                var quizId = '${quizInfo.quiz_id}';
                var userId = '${quizInfo.user_id}';
                $.ajax({
                    url: '/quiz/save',
                    type: 'POST',
                    data: {
                        quiz_id: quizId,
                        user_id: userId
                    },
                    success: function (response) {
                        alert('정보가 성공적으로 저장되었습니다.');
                    },
                    error: function (xhr, status, error) {
                        console.log("Error: " + error);
                    }
                });
            });
        }

        function nextQuiz() {
            var level = '${quizInfo.level}'; // JSP 변수에서 레벨 가져오기
            var url;
            if (level === '쉬움') {
                url = '/quiz/easy';
            } else if (level === '중간') {
                url = '/quiz/medium';
            } else if (level === '어려움') {
                url = '/quiz/hard';
            } else {
                url = '/quiz';
            }
            window.location.href = url;
        }
    </script>


</head>

<body>
<main class="quiz-container">
    <h1 id="level" class="quiz-level">난이도: ${quizInfo.level}</h1>
    <hr/>
    <div class="quiz-content">
        <label>퀴즈 내용:</label>
        <p id="quizContent">${quizInfo.quizContent}</p>
    </div>
    <div class="user-answer">
        <label>사용자 답변:</label>
        <p id="userAnswer">${quizInfo.userAnswer}</p>
    </div>
    <div class="correct-answer">
        <label>정답:</label>
        <p id="correctAnswer">${quizInfo.correctAnswer}</p>
    </div>
    <div class="result">
        <label>결과:</label>
        <p id="result">${quizInfo.result == 'correct' ? '정답입니다!' : '틀렸습니다.'}</p>
    </div>
</main>
<div class="buttons">
    <button type="button" onclick="saveQuiz()">저장소에 저장</button>
    <hr/>
    <button type="button" onclick="nextQuiz()">다음 문제</button>
</div>
</body>


</html>