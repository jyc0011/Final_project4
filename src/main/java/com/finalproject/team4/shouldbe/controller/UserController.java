package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.EmailService;
import com.finalproject.team4.shouldbe.service.UserService;
import com.finalproject.team4.shouldbe.util.EncryptUtil;
import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import java.security.SecureRandom;
import java.time.LocalDate;

import static com.fasterxml.jackson.databind.type.LogicalType.DateTime;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    EmailService emailService;
    EncryptUtil encrypt = new EncryptUtil();

    @GetMapping("/login")
    public String login(HttpSession session) {
        if (session.getAttribute("logStatus") == "Y") {
            return "redirect:/";
        }
        return "login/login_form";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/create")
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

        //System.out.println(vo);

        int result = userService.useridInsert(vo);
        return "login/login_form";
    }

    @PostMapping("/idcheck")
    @ResponseBody
    public boolean idCheck(@RequestParam("userid") String userid) {
        int result = userService.useridCheck(userid);
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
        LoginVO vo = userService.userLoginCheck(userid);
        ModelAndView mav = new ModelAndView();
        if (vo == null) {//로그인 실패
            mav.addObject("result", "로그인 실패, 아이디를 확인해주세요!");
            mav.setViewName("login/login_form");
            return mav;
        } else if (encrypt.encrypt(userpwd, vo.getSalt()).equals(vo.getPassword())) {
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


    @GetMapping("/login/findid")
    public String find_id() {
        return "login/find_id";
    }

    @GetMapping("/login/findpwd")
    public String find_pwd() {
        return "login/find_pwd";
    }

    @PostMapping("/login/findidOk")
    @ResponseBody
    public String findidOk(@RequestParam("username") String username, @RequestParam("email") String email) { //ajax
        String result = userService.userFindId(username, email);
        if (result != null) return result;
        return "";
    }

    @PostMapping("/login/sendcode")
    @ResponseBody
    public boolean sendCode(@RequestParam("userid") String userid, @RequestParam("email") String email, HttpSession session) {


        int result = userService.userCheckId(userid, email);
        //System.out.println(result);
        if(result == 1){
            //email발송
            var authNum = emailService.sendAuthMail(email);
           // System.out.println(authNum);
            session.setAttribute("authNum", authNum);
            session.setAttribute("authTime", System.currentTimeMillis());

            return true;

        }

        return false;
    }
    @PostMapping("/login/verify")
    @ResponseBody
    public boolean verifyCode(@RequestParam("code") String code, @RequestParam("userid") String userid, @RequestParam("email") String email, HttpSession session) {
        var time = (long)session.getAttribute("authTime");
        if(System.currentTimeMillis() > time+1000*60*3){
            //System.out.println("시간초과");
            return false;
        }
        if(!code.equals(session.getAttribute("authNum"))){
            //System.out.println("번호미일치");
            return false;
        }
        //임시비밀번호 생성
        String newPass = emailService.sendNewPasswd(email);
        //Salt 생성
        var salt = encrypt.getSalt();
        //패스워드 해싱
        var encrypted = encrypt.encrypt(newPass, salt);
        UserVO vo = new UserVO();
        vo.setUserid(userid);
        vo.setSalt(salt);
        vo.setUserpwd(encrypted);
        int result = userService.userpwdUpdate(vo);

        return true;
    }
}
