<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Quiz App</title>
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
			// Fetching the quiz
			$.ajax({
				url: '/quiz/easy/problem',
				type: 'GET',
				dataType: 'json',
				success: function(response) {
					$('#quiz_content').text(response.question);
					$('#quiz_answer').val(response.answer);
				},
				error: function(xhr, status, error) {
					console.log("Error: " + error);
				}
			});

				// Initially disable the submit button
				$('#submitButton').prop('disabled', true);

				// Enable the submit button only when user input is present
				$('#userAnswer').on('input', function() {
					if ($(this).val().trim() !== '') {
						$('#submitButton').prop('disabled', false);
					} else {
						$('#submitButton').prop('disabled', true);
					}
				});

			$('#submitButton').on('click', function() {
				const userAnswer = $('#userAnswer').val();
				const correctAnswer = $('#quiz_answer').val();
				const quizContent = $('#quiz_content').val();
				$.ajax({
					url: '/quiz/checkAnswer',
					type: 'POST',
					data: {
						quizContent: quizContent,
						userAnswer: userAnswer,
						correctAnswer: correctAnswer
					},
					success: function(response) {
						window.location.href = '/quiz/quiz_answer';
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
	<h1>쉬움</h1>
	<hr />
	<b id="quiz_content">퀴즈 내용</b>
	<form method="post" action="#">
		<input type="text" id="userAnswer" placeholder="정답 입력" />
		<input type="button" id="submitButton" value="제출" />
	</form>
	<input type="hidden" id="quiz_answer" />
</main>
</body>
</html>
