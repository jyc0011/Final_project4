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
				$('#submitButton').prop('disabled', true);

				// Enable the submit button only when user input is present
				$('#userAnswer').on('input', function() {
					if ($(this).val().trim() !== '') {
						$('#submitButton').prop('disabled', false);
					} else {
						$('#submitButton').prop('disabled', true);
					}
				});
		});
	</script>
</head>
<body>
<main>
	<h1>쉬움</h1>
	<hr />
	<b id="quiz_content">${quiz.quiz_content}</b>
	<form method="post" action="/quiz/checkAnswer">
		<input type="text" name="user_answer" placeholder="정답 입력" />
		<input type="hidden" name="quiz_id" value="${quiz.quiz_id}" />
		<input type="hidden" name="quiz_content" value="${quiz.quiz_content}" />
		<input type="hidden" name="level" value="${quiz.level}" />
		<input type="hidden" name="quiz_lang" value="${quiz.quiz_lang}" />
		<input type="submit" value="제출" />
	</form>
</main>
</body>
</html>
