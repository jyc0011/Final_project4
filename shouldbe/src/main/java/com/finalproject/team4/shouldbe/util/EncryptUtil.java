package com.finalproject.team4.shouldbe.util;

import java.security.MessageDigest;
import java.security.SecureRandom;

public class EncryptUtil {

    public String encrypt(String plainText, String salt) {
        try {
            var salted = plainText+salt;
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salted.getBytes());

            StringBuilder builder = new StringBuilder();
            var encrypted = md.digest();
            for (byte b : encrypted) {
                // 바이트 값을 16진수 문자열로 변환하여 StringBuilder에 추가
                builder.append(String.format("%02x", b));
            }
            return builder.toString();
        } catch (Exception e) {

        }
        return null;
    }

    public String getSalt() {

        //1. Random, byte 객체 생성
        SecureRandom r = new SecureRandom();
        byte[] salt = new byte[32];

        //2. 난수 생성
        r.nextBytes(salt);

        //3. byte To String (10진수의 문자열로 변경)
        StringBuilder sb = new StringBuilder();
        for (byte b : salt) {
            sb.append(String.format("%02x", b));
        }
        ;

        return sb.toString();
    }

}
