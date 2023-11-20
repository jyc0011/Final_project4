package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.UserService;
import com.finalproject.team4.shouldbe.util.EncryptUtil;
import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    UserService service;
    EncryptUtil encrypt = new EncryptUtil();

    @GetMapping("/login")
    public String login(HttpSession session) {
        if (session.getAttribute("logStatus") == "Y") {
            return "redirect:/";
        }
        return "login/login_form";
    }

    @GetMapping("/login/find_id")
    public String find_id() {
        return "login/find_id";
    }

    @GetMapping("/login/find_pwd")
    public String find_pwd() {
        return "login/find_pwd";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/create_membership")
    public String create_membership() {
        return "create_membership/create_membership";
    }

    @PostMapping("/createOk")
    public String createOk(UserVO vo) {

        //Salt 생성
        var salt = encrypt.getSalt();
        //패스워드 해싱
        var encrypted = encrypt.encrypt(vo.getUserpwd(), salt);

        //Salt, 패스워드 set
        vo.setUserpwd(encrypted);
        vo.setSalt(salt);

        System.out.println(vo);

        int result = service.useridInsert(vo);
        return "login/login_form";
    }

    @PostMapping("/idcheck")
    @ResponseBody
    public boolean idCheck(@RequestParam("userid") String userid) {
        int result = service.useridCheck(userid);
        if (result == 0) {
            //중복x
            return true;
        } else {
            //중복
            return false;
        }

    }

    @PostMapping("/loginOk")
    public ModelAndView loginOk(HttpSession session, @RequestParam("userid") String userid, @RequestParam("userpwd") String userpwd) {
        LoginVO vo = service.userLoginCheck(userid);
        ModelAndView mav = new ModelAndView();
        if (vo == null) {//로그인 실패
            mav.addObject("result", "로그인 실패, 아이디를 확인해주세요!");
            mav.setViewName("login/login_form");
            return mav;
        }else if(encrypt.encrypt(userpwd, vo.getSalt()).equals(vo.getPassword())) {
            session.setAttribute("logStatus", "Y");
            session.setAttribute("logName", vo.getUser_name());
            session.setAttribute("logId", userid);
            mav.setViewName("redirect:/");
            return mav;
        }

        mav.addObject("result", "로그인 실패, 비밀번호를 확인해주세요!");
        mav.setViewName("login/login_form");
        return mav;

    }
}
