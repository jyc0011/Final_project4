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
        $(document).ready(function() {
            // Fetching the quiz info
            $.ajax({
                url: '/quiz/easy/answer',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    $('#quizContent').text(response.quizContent);
                    $('#userAnswer').text(response.userAnswer);
                    $('#correctAnswer').text(response.correctAnswer);
                    $('#result').text(response.result == 'correct' ? '정답입니다!' : '틀렸습니다.');
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                }
            });
        });

        $(document).ready(function() {
            // Save button click event
            $('input[type="button"]').on('click', function() {
                var quizContent = $('#quizContent').text();
                var correctAnswer = $('#correctAnswer').text();
                $.ajax({
                    url: '/quiz/save',
                    type: 'POST',
                    data: {
                        quizContent: quizContent,
                        correctAnswer: correctAnswer
                    },
                    success: function(response) {
                        alert('정보가 성공적으로 저장되었습니다.');
                    },
                    error: function(xhr, status, error) {
                        console.log("Error: " + error);
                    }
                });
            });
        });
    </script>


</head>

<body>
<main>
    <h1>중간</h1>
    <hr />
    <h2>1/10</h2>
    <div id="quizContent">퀴즈내용</div>
    <div id="userAnswer">사용자 답변</div>
    <div id="correctAnswer">정답</div>
    <div id="result">정답여부</div>
    <form method="post" action="#">
        <input type="button" value="저장" />
    </form>
</main>
</body>


</html>