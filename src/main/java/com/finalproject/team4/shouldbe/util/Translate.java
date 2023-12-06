package com.finalproject.team4.shouldbe.util;

import org.json.JSONObject;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class Translate {

    public static String detect_lang(String args) {
        String clientId = "nog9s0ode5";
        String clientSecret = "39Yp4760xFWOZHLRydX9CAda4oMahQNE98bru3uE";
        try {
            String query = URLEncoder.encode(args, StandardCharsets.UTF_8);
            String apiURL = "https://naveropenapi.apigw.ntruss.com/langs/v1/dect";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            String postParams = "query=" + query;
            con.setDoOutput(true);

            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.writeBytes(postParams);
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == 200) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
                    String inputLine;
                    StringBuffer response = new StringBuffer();
                    while ((inputLine = br.readLine()) != null) {
                        response.append(inputLine);
                    }
                    JSONObject jsonResponse = new JSONObject(response.toString());
                    return jsonResponse.getString("langCode"); // JSON에서 langCode 값 추출
                }
            } else {
                System.out.println("Error response code: " + responseCode);
                return "error";
            }
        } catch (Exception e) {
            System.out.println("Exception in detect_lang: " + e.getMessage());
            return "error";
        }
    }

    public static String translate_content(String sourceLang, String targetLang, String text) {
        String clientId = "nog9s0ode5";
        String clientSecret = "39Yp4760xFWOZHLRydX9CAda4oMahQNE98bru3uE";
        try {
            String encodedText = URLEncoder.encode(text, StandardCharsets.UTF_8);
            String apiURL = "https://naveropenapi.apigw.ntruss.com/nmt/v1/translation";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            String postParams = "source=" + sourceLang + "&target=" + targetLang + "&text=" + encodedText;
            con.setDoOutput(true);

            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.writeBytes(postParams);
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == 200) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
                    String inputLine;
                    StringBuffer response = new StringBuffer();
                    while ((inputLine = br.readLine()) != null) {
                        response.append(inputLine);
                    }
                    JSONObject jsonResponse = new JSONObject(response.toString());
                    return jsonResponse.getJSONObject("message").getJSONObject("result").getString("translatedText");
                }
            } else {
                // 오류 응답 로깅
                try (BufferedReader br = new BufferedReader(new InputStreamReader(con.getErrorStream()))) {
                    String inputLine;
                    StringBuffer response = new StringBuffer();
                    while ((inputLine = br.readLine()) != null) {
                        response.append(inputLine);
                    }
                    System.out.println("Error response: " + response);
                }
                System.out.println("Response Code: " + responseCode);
                return "error";
            }
        } catch (Exception e) {
            System.out.println("Error in translate_content: " + e.getMessage());
            return "error";
        }
    }

    public static boolean isDirectTrans(String sourceLang, String targetLang) {
        Map<String, List<String>> pairs = new HashMap<>();
        // 한국어(ko) ↔ 다른 언어들
        pairs.put("ko", Arrays.asList("en", "ja", "zh-CN", "zh-TW", "vi", "th", "id", "fr", "es", "ru", "de", "it"));
        // 영어(en) ↔ 다른 언어들
        pairs.put("en", Arrays.asList("ja", "zh-CN", "zh-TW", "vi", "th", "id", "fr"));
        // 일본어(ja) ↔ 다른 언어들
        pairs.put("ja", Arrays.asList("zh-CN", "zh-TW", "vi", "th", "id", "fr"));
        // 중국어 간체(zh-CN) ↔ 중국어 번체(zh-TW)
        pairs.put("zh-CN", Arrays.asList("zh-TW"));
        pairs.put("zh-TW", Arrays.asList("zh-CN"));

        boolean directFromStoT = pairs.containsKey(sourceLang) && pairs.get(sourceLang).contains(targetLang);
        boolean directFromTtoS = pairs.containsKey(targetLang) && pairs.get(targetLang).contains(sourceLang);

        return directFromStoT || directFromTtoS;
    }

}
