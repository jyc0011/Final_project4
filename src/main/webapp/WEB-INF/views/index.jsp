<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- JQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>STS4에서 스프링부트 실행하기</h1>
<p>${data}</p>
<ol>
    <li><a href="test">API 테스트</a></li>
    <hr/>

    <li><a href="cfr_recognition">CFR : 얼굴감지(눈, 코, 입, 얼굴 방향 등 ......)</a></li>
    <li><a href="cfr_celebrity">CFR : 유명인 얼굴인식</a></li>
    <li><a href="csr_speechToText">CSR : stt(Speech To Text) : 음성을 텍스트로 변환</a></li>
    <li><a href="csr_stt_record">CSR : stt(Speech To Text) : 음성을 텍스트로 변환(녹음버전)</a></li>
    <li><a href="sentiment">Sentiment : 감정분석</a></li>
    <li><a href="summary">Summary : 문서요약</a></li>
    <li><a href="voice">Voice : stt -> 텍스트를 음성파일로 변환</a></li>
    <li><a href="ocr">OCR : 문서나 이미지의 텍스트를 추출하여 데이터화 함</a></li>
    <li><a href="captchaImage">Captcha : image</a></li>
    <li><a href="captchaAudio">Captcha : Audio</a></li>
    <li><a href="searchTrend">SearchTrend : 네이버 검색결과 통계</a></li>
    <li><a href="chatbot">Chatbot : 누구나 만들 수 있는 빠르고 정확한 챗봇</a></li>
</ol>
</body>
</html>