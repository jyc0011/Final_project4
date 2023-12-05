package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.MypageService;
import com.finalproject.team4.shouldbe.util.EncryptUtil;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MypageController {
    @Autowired
    MypageService service;

    EncryptUtil encrypt = new EncryptUtil();

    // 마이페이지 프로필
    @GetMapping("/mypage/change_user")
    public ModelAndView mypage_change_user(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        if (session.getAttribute("logStatus") != "Y") {
            mav.setViewName("redirect:/login");
            return mav;
        }
        String userid=(String) session.getAttribute("logId");
        MypageVO myvo = service.mypage_info(userid);
        System.out.println(myvo.toString());
        mav.addObject("myvo", myvo);
        mav.setViewName("mypage/change_user");

        return mav;
    }

    // 프로필 수정
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

    // 친구목록
    @GetMapping("/mypage/friend_user")
    public ModelAndView mypage_friend_user(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String followed_user_id = (String) session.getAttribute("logId");

        List<FriendVO> flist = service.friendList(followed_user_id);

        mav.addObject("flist", flist);
        mav.setViewName("mypage/friend_user");
        return mav;
    }

    // 친구삭제
    @GetMapping("/mypage/deletefriend")
    @ResponseBody
    public String friendDelete(String followed_user_id, String following_user_id) {
        return service.friendDelete(followed_user_id, following_user_id) + "";
    }

    // 차단목록
    @GetMapping("/mypage/blackList")
    public String mypage_blacklist() {
        return "mypage/blacklist_user";
    }

    // 게시글
    @GetMapping("/mypage/post_user")
    public ModelAndView mypage_post_user(@SessionAttribute(name = "logId") String user_id) {
        ModelAndView mav = new ModelAndView();
        List<BoardVO> list = service.mypage_post_board(user_id);

        mav.addObject("list", list);
        mav.setViewName("mypage/post_user");
        return mav;
    }

    // 댓글
    @GetMapping("/mypage/post_user/reply")
    public ModelAndView mypage_post_user_reply(@SessionAttribute(name = "logId") String user_id) {
        ModelAndView mav = new ModelAndView();
        List<BoardReplyVO> list = service.mypage_post_board_reply(user_id);

        mav.addObject("list", list);
        mav.setViewName("mypage/post_user_reply");
        return mav;
    }

    // 회원탈퇴
    @GetMapping("/mypage/withdraw_user")
    public String mypage_withdraw_user() {

        return "mypage/withdraw_user";
    }

    // 저장소
    @GetMapping("/mypage/save_user")
    public ModelAndView saveUser(HttpSession session, @RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("mypage/save_user");

        String userId = (String) session.getAttribute("logId");
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalRecord(userId));
        List<SaveMessageVO> saveMessages = service.getSaveMessageList(pvo, userId);
        mav.addObject("saveMessages", saveMessages);
        mav.addObject("pVO", pvo);

        return mav;
    }
}