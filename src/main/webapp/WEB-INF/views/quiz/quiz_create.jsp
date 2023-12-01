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
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;

        }

        .form-group {
            display: flex;
            justify-content: space-between;
            align-content: space-around;
            margin-bottom: 15px;
            width: 50%;
        }

        .form-group input[type="text"],
        .form-group input[type="submit"] {
            flex: 1;
            margin-right: 10px;
        }

        .form-group input[type="submit"] {
            flex: 0 0 100px;
            margin-right: 0;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        select, input[type="text"] {
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#quiz_lang').change(function () {
                var selectedLanguage = $(this).val();
                $('#quiz_content').val(''); // 언어가 변경될 때마다 내용 초기화
                $('#warning-message').hide(); // 메시지 숨기기

                $('#quiz_content').on('input', function () {
                    var value = $(this).val();
                    var isValid = true;

                    if (selectedLanguage === 'ko' && /[^ㄱ-ㅎㅏ-ㅣ가-힣\s]/.test(value)) {
                        isValid = false;
                    } else if (selectedLanguage === 'en' && /[^a-zA-Z\s]/.test(value)) {
                        isValid = false;
                    } else if (selectedLanguage === 'jp' && /[^ぁ-ゔゞァ-ヺー龰\s]/.test(value)) {
                        isValid = false;
                    }

                    if (!isValid) {
                        $('#warning-message').show();
                    } else {
                        $('#warning-message').hide();
                    }
                });
            });
            $('#submitButton').prop('disabled', true);

            $('#answer, #quiz_content').on('input', function () {
                var isAnswerFilled = $('#answer').val().trim() !== '';
                var isContentFilled = $('#quiz_content').val().trim() !== '';
                $('#submitButton').prop('disabled', !(isAnswerFilled && isContentFilled));
            });

            $('#quiz_createForm').on('submit', function (e) {
                e.preventDefault();
                var formData = {
                    quiz_lang: $('#quiz_lang').val(),
                    level: $('#level').val(),
                    answer: $('#answer').val(),
                    quiz_content: $('#quiz_content').val()
                };

                $.ajax({
                    url: '/quiz/createOk',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(formData),
                    success: function () {
                        // 성공 처리
                        $('#answer').val('');
                        $('#quiz_content').val('');
                        $('#quiz_lang').val('ko');
                        $('#level').val('1');
                        alert("성공");
                    },
                    error: function () {
                        alert("실패");
                    }
                });
            });
        });
    </script>


</head>

<body>
<main>
    <h1>퀴즈 등록하기</h1>
    <form method="post" action="/quiz_createOk" id="quiz_createForm">
        <div class="form-group">
            <label for="quiz_lang">문제의 언어:</label>
            <select id="quiz_lang">
                <option value="ko">한국어</option>
                <option value="en">영어</option>
                <option value="jp">일본어</option>
            </select>
        </div>

        <div class="form-group">
            <label for="level">퀴즈 난이도:</label>
            <select id="level">
                <option value="1">쉬움</option>
                <option value="2">중간</option>
                <option value="3">어려움</option>
            </select>
        </div>
        <div id="warning-message" style="display: none; color: red;">잘못된 입력입니다. 언어에 맞는 문자를 입력해주세요.</div>
        <div class="form-group">
            <input type="text" id="quiz_content" placeholder="문제"/>
            <input type="text" id="answer" placeholder="정답"/>
            <input type="submit" value="제출"/>
        </div>
    </form>
</main>
</body>

</html>