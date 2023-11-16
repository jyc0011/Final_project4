package com.finalproject.team4.shouldbe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
    @GetMapping("/mypage/change_user")
    public String mypage_change_user() {
        return "mypage/change_user";
    }

    @GetMapping("/mypage/friend_user")
    public String mypage_friend_user() {
        return "mypage/friend_user";
    }

    @GetMapping("/mypage/post_user")
    public String mypage_post_user() {
        return "mypage/post_user";
    }

    @GetMapping("/mypage/save_user")
    public String mypage_save_user() {
        return "mypage/save_user";
    }

    @GetMapping("/mypage/withdraw_user")
    public String mypage_withdraw_user() {
        return "mypage/withdraw_user";
    }
}
