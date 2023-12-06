package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.AdminService;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    AdminService service;

    @GetMapping("/suspend")
    public ModelAndView suspend(String user_id) {
        ModelAndView mav = new ModelAndView();
        System.out.println(user_id);
        int result = service.suspendInsert(user_id);
        mav.setViewName("admin/admin_dashboard");
        return mav;
    }

    @GetMapping("/boardDelete")
    public ModelAndView boardDelete(int post_id) {
        ModelAndView mav = new ModelAndView();
        System.out.println(post_id);
        int result = service.postsDelete(post_id);
        mav.setViewName("admin/admin_dashboard");
        return mav;
    }

    @GetMapping("/admin")
    public String admin() {
        return "admin/admin_dashboard";
    }

    @GetMapping("/admin/reply")
    public ModelAndView admin_reply(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("admin/admin_reply");
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalReplyRecord());
        List<BoardReplyVO> board = service.getReplyList_admin(pvo);
        mav.addObject("board", board);
        mav.addObject("pVO", pvo);
        return mav;
    }

    @GetMapping("/admin/board")
    public ModelAndView admin_board(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("admin/admin_board");
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalBoardRecord());
        List<BoardVO> board = service.getBoardList_admin(pvo);
        mav.addObject("board", board);
        mav.addObject("pVO", pvo);
        return mav;
    }

    @GetMapping("/admin/member/management")
    public ModelAndView GoMember_management(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalMemberRecord());
        List<AdminMemberVO> amlist = service.adminMemberList(pvo);
        mav.addObject("amlist", amlist);
        List<UserVO> message = service.getMemberList_admin(pvo);
        mav.addObject("message", message);
        mav.addObject("pVO", pvo);
        mav.setViewName("management/member_management");
        return mav;
    }

    @GetMapping("/admin/suspended/management")
    public ModelAndView GoSuspended_management(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalSuspendedMemberRecord());
        List<AdminSuspendedVO> aslist = service.adminSuspendedList(pvo);
        mav.addObject("aslist", aslist);
        mav.addObject("pVO", pvo);
        mav.setViewName("management/suspended_management");
        return mav;
    }

    @GetMapping("/admin/withdrawn/management")
    public ModelAndView GoWithdrawn_management(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalWithdrawnMemberRecord());
        List<AdminWithdrawnVO> awlist = service.adminWithdrawnList(pvo);
        mav.addObject("awlist", awlist);
        mav.addObject("pVO", pvo);
        mav.setViewName("management/withdrawn_management");
        return mav;
    }

    @GetMapping("/admin/chat/management")
    public ModelAndView GoChat_management(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();

        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalMessageRecord());
        List<AdminChatVO> aclist = service.adminChatList(pvo);
        mav.addObject("aclist", aclist);
        mav.addObject("pVO", pvo);
        mav.setViewName("management/chat_management");
        return mav;
    }


    @GetMapping("/admin/quiz/list")
    public ModelAndView GoQuiz_list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("quiz_management/quiz_list");
        List<QuizVO> quizlist1 = service.quizlist(1);
        List<QuizVO> quizlist2 = service.quizlist(2);
        List<QuizVO> quizlist3 = service.quizlist(3);
        //System.out.println(quizlist1.toString());
        mav.addObject("quizlist1", quizlist1);
        mav.addObject("quizlist2", quizlist2);
        mav.addObject("quizlist3", quizlist3);
        return mav;
    }

    @GetMapping("/admin/quiz/reg_manager")
    public String GoQuiz_reg_manager() {
        return "quiz_management/quiz_reg_manager";
    }

    @GetMapping("/admin/quiz/reg_user")
    public String GoQuiz_reg_user() {
        return "quiz_management/quiz_reg_user";
    }

    @GetMapping("/admin/quiz_edit")
    public ModelAndView GoQuiz_edit(int quiz_id) {
        ModelAndView mav = new ModelAndView();
        List<QuizVO> editlist = service.editlist(quiz_id);
        System.out.println(editlist.toString());
        mav.addObject("editlist", editlist);
        mav.setViewName("quiz_management/quiz_edit");
        return mav;
    }
}