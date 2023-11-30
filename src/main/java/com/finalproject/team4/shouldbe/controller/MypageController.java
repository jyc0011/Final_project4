package com.finalproject.team4.shouldbe.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import com.finalproject.team4.shouldbe.util.UriUtil;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.team4.shouldbe.service.MypageService;
import com.finalproject.team4.shouldbe.util.EncryptUtil;

@Controller
public class MypageController {
    @Autowired
    MypageService service;

    EncryptUtil encrypt = new EncryptUtil();

    @GetMapping("/mypage/change_user")
    public ModelAndView mypage_change_user(@SessionAttribute(name = "logId") String userid) {
        ModelAndView mav = new ModelAndView();

        MypageVO myvo = service.mypage_info(userid);
        System.out.println(myvo.toString());
        mav.addObject("myvo", myvo);
        mav.setViewName("mypage/change_user");
        return mav;
    }

    @PostMapping("/mypage/editProfileOk")
    public ModelAndView mypageEidt(MypageVO vo) {
        ModelAndView mav = new ModelAndView();
        System.out.println(vo.toString());

        int result = service.mypage_edit(vo);

        if (result > 0) {
            mav.setViewName("mypage/change_user");
        } else {
            mav.setViewName("mypage/mypage_editResult");
        }
        return mav;
    }

    @GetMapping("/mypage/friend_user")
    public ModelAndView mypage_friend_user() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/friend_user");
        return mav;
    }

    @GetMapping("/mypage/blackList")
    public String mypage_blacklist() {
        return "mypage/blacklist_user";
    }

    @GetMapping("/mypage/post_user")
    public ModelAndView mypage_post_user(@SessionAttribute(name = "logId") String user_id) {
        ModelAndView mav = new ModelAndView();
        List<BoardVO> list = service.mypage_post_board(user_id);

        mav.addObject("list", list);
        mav.setViewName("mypage/post_user");
        return mav;
    }

    @GetMapping("/mypage/post_user/reply")
    public ModelAndView mypage_post_user_reply(@SessionAttribute(name = "logId") String user_id) {
        ModelAndView mav = new ModelAndView();
        List<BoardReplyVO> list = service.mypage_post_board_reply(user_id);
        System.out.println(list.toString());

        mav.addObject("list", list);
        mav.setViewName("mypage/post_user_reply");
        return mav;
    }

    @GetMapping("/mypage/withdraw_user")
    public String mypage_withdraw_user() {
        return "mypage/withdraw_user";
    }

    @GetMapping("/mypage/save_user")
    public ModelAndView saveUser(HttpSession session, @RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("mypage/save_user");

        String userId = (String) session.getAttribute("logId");
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setPage(page);
        pvo.setTotalRecord(service.totalRecord(userId));
        List<SaveMessageVO> saveMessages = service.getSaveMessageList(pvo, userId);
        mav.addObject("saveMessages", saveMessages);
        mav.addObject("pVO", pvo);

        return mav;
    }

}