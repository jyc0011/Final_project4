package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.AdminService;
import com.finalproject.team4.shouldbe.vo.*;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    AdminService service;

    //대시보드======================================================
    @GetMapping("/admin")
    public String admin() {
        return "admin/admin_dashboard";
    }

    //현재 회원 관리
    @GetMapping("/admin/member/management")
    public ModelAndView GoMember_management(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalMemberRecord());
        List<AdminMemberVO> amlist = service.adminMemberList(pvo);
        mav.addObject("amlist", amlist);
        for(int i=0;i<amlist.size();i++){
            String user_id=amlist.get(i).getUser_id();
            amlist.get(i).setPosts_count(service.postsCount(user_id));
            amlist.get(i).setComments_count(service.commentsCount(user_id));
        }
        //List<UserVO> message = service.getMemberList_admin(pvo);
        //mav.addObject("message", message);
        mav.addObject("pVO", pvo);
        mav.setViewName("management/member_management");
        return mav;
    }

    //정지회원관리======================================================
    @GetMapping("/admin/suspended/management")
    public ModelAndView GoSuspended_management(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalSuspendedMemberRecord());
        List<AdminSuspendedVO> aslist = service.adminSuspendedList(pvo);
        for(int i=0;i<aslist.size();i++){
            String user_id=aslist.get(i).getUser_id();
            AdminSuspendedVO userVO=service.getUserVO(user_id);
            System.out.println("a "+userVO.getUser_name());
            aslist.get(i).setProfile_img(userVO.getProfile_img());
            aslist.get(i).setUser_name(userVO.getUser_name());
            aslist.get(i).setCount_report(userVO.getCount_report());
            aslist.get(i).setPosts_count(service.postsCount(user_id));
            aslist.get(i).setComments_count(service.commentsCount(user_id));
        }
        mav.addObject("aslist", aslist);
        mav.addObject("pVO", pvo);
        mav.setViewName("management/suspended_management");
        return mav;
    }
    //정지회원관리_정지버튼
    @GetMapping("/suspend")
    public ModelAndView suspend(String user_id) {
        ModelAndView mav = new ModelAndView();
        System.out.println(user_id);
        int result = service.suspendInsert(user_id);
        mav.setViewName("redirect:/admin/member/management");
        return mav;
    }
    //정지회원관리_정지해제버튼
    @GetMapping("/suspendDelete")
    public ModelAndView suspendDelete(int suspended_id) {
        ModelAndView mav = new ModelAndView();
        System.out.println(suspended_id);
        int result = service.suspendDelete(suspended_id);
        mav.setViewName("redirect:/admin/suspended/management");
        return mav;
    }

    //탈퇴회원관리======================================================
    @GetMapping("/admin/withdrawn/management")
    public ModelAndView GoWithdrawn_management(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalWithdrawnMemberRecord());
        List<AdminWithdrawnVO> awlist = service.adminWithdrawnList(pvo);

        for(int i=0;i<awlist.size();i++){
            String user_id=awlist.get(i).getUser_id();
            AdminWithdrawnVO userVO= service.adminWithdrawnListUsers(user_id);
            awlist.get(i).setProfile_img(userVO.getProfile_img());
            awlist.get(i).setUser_name(userVO.getUser_name());
            awlist.get(i).setCount_report(userVO.getCount_report());
            awlist.get(i).setTime(userVO.getTime());
            awlist.get(i).setPosts_count(service.postsCount(user_id));
            awlist.get(i).setComments_count(service.commentsCount(user_id));
        }
        mav.addObject("awlist", awlist);
        mav.addObject("pVO", pvo);
        mav.setViewName("management/withdrawn_management");
        return mav;
    }

    //게시글관리======================================================
    @GetMapping("/admin/board")
    public ModelAndView admin_board(@RequestParam(required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView();
        PagingVO pvo = new PagingVO();
        pvo.setOnePageRecord(10);
        pvo.setNowPage(page);
        pvo.setTotalRecord(service.totalBoardRecord());

        //List<BoardVO> board = service.getBoardReportList(pvo);
        //getBoardList_admin   getBoardReportList
        List<BoardReportVO> board = service.getBoardReportList(pvo);
        System.out.println(board);


        for(int i=0;i<board.size();i++){
            int post_id=board.get(i).getPost_id();
            BoardReportVO postsVO=service.getPostsVO(post_id);

            board.get(i).setTitle(postsVO.getTitle());
            board.get(i).setContent (postsVO.getContent());
            board.get(i).setBoard_cat (postsVO.getBoard_cat());


        }
        mav.addObject("board", board);
        mav.addObject("pVO", pvo);
        mav.setViewName("admin/admin_board");
        return mav;
    }
    //게시글관리_보드삭제 버튼
    @GetMapping("/boardDelete")
    public ModelAndView boardDelete(int post_id) {
        ModelAndView mav = new ModelAndView();
        System.out.println(post_id);
        int result = service.postsDelete(post_id);
        mav.setViewName("admin/admin_dashboard");
        return mav;
    }

    //댓글관리======================================================
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

    //퀴즈관리======================================================
    @GetMapping("/admin/quiz/list")
    public ModelAndView GoQuiz_list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("quiz_management/quiz_list");
        List<QuizVO> quizlist1=service.quizlist(1);
        List<QuizVO> quizlist2=service.quizlist(2);
        List<QuizVO> quizlist3=service.quizlist(3);
        //System.out.println(quizlist1.toString());
        mav.addObject("quizlist1", quizlist1);
        mav.addObject("quizlist2", quizlist2);
        mav.addObject("quizlist3", quizlist3);
        return mav;
    }
    //퀴즈관리_퀴즈등록페이지버튼
    @GetMapping("/admin/quiz/reg_manager")
    public String GoQuiz_reg_manager() {
        return "quiz_management/quiz_reg_manager";
    }
    //퀴즈관리_퀴즈등록버튼
    @PostMapping("/quiz/reg")
    public ModelAndView QuizReg(String quiz_content, String answer, int level){
        ModelAndView mav= new ModelAndView();
        int quizInsertResult=service.quizInsert(quiz_content,level);
        int quiz_id=service.selectQuizId(quiz_content);
        int answerInsertResult=service.answerInsert(quiz_id,answer);
        // System.out.println(quiz_content+" "+level);
        mav.setViewName("quiz_management/quiz_list");
        return mav;
    }
    //퀴즈관리_유저퀴즈등록버튼
    @GetMapping("/admin/quiz/reg_user")
    public String GoQuiz_reg_user() {
        return "quiz_management/quiz_reg_user";
    }
    //퀴즈관리_등록된 퀴즈 리스트
    @GetMapping("/admin/quiz_edit")
    public ModelAndView GoQuiz_edit(int quiz_id) {
        ModelAndView mav = new ModelAndView();
        List<QuizVO> editlist=service.editlist(quiz_id);
        System.out.println(editlist.toString());
        mav.addObject("editlist", editlist);
        mav.setViewName("quiz_management/quiz_edit");
        return mav;
    }

    //채팅관리======================================================
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














}