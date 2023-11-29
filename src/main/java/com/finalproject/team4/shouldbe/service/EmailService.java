package com.finalproject.team4.shouldbe.service;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.security.SecureRandom;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class EmailService {
    private final JavaMailSender javaMailSender;

    public String sendAuthMail(String email) {
        String authNum = createCode();

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setTo(email);
        simpleMailMessage.setSubject("ShouldBe 인증메일입니다.");
        //simpleMailMessage.setFrom("abc@bcd.com");
        simpleMailMessage.setText("인증번호는 : " + authNum);

        try {
            javaMailSender.send(simpleMailMessage);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        return authNum;

    }
    public String sendNewPasswd(String email){
        String authNum = createCode();

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setTo(email);
        simpleMailMessage.setSubject("ShouldBe 새로운 비밀번호 입니다..");
        //simpleMailMessage.setFrom("abc@bcd.com");
        simpleMailMessage.setText("비밀번호는 : " + authNum);

        try {
            javaMailSender.send(simpleMailMessage);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        return authNum;
    }

    // 인증번호 및 임시 비밀번호 생성 메서드
    public String createCode() {
        StringBuilder key = new StringBuilder();
        try {
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");

            for (int i = 0; i < 8; i++) {
                key.append(random.nextInt(10));
            }
        } catch (Exception e) {

        }
        return key.toString();
    }
}
