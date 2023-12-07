package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.*;

import java.util.List;

public interface AdminService {
    //대시보드=====================================================
    //현재회원관리=====================================================
    int totalMemberRecord();
    List<AdminMemberVO> adminMemberList(PagingVO pvo);
    int postsCount(String user_id);
    int commentsCount(String user_id);

    //정지회원관리======================================================
    int totalSuspendedMemberRecord();
    List<AdminSuspendedVO> adminSuspendedList(PagingVO pvo);
    AdminSuspendedVO getUserVO(String user_id);

    //정지회원관리_정지버튼
    int suspendInsert(String user_id);
    //정지회원관리_정지해제버튼
    int suspendDelete(int suspended_id);

    //탈퇴회원관리======================================================
    int totalWithdrawnMemberRecord();
    List<AdminWithdrawnVO> adminWithdrawnList(PagingVO pvo);
    AdminWithdrawnVO adminWithdrawnListUsers(String user_id);

    //게시글관리======================================================
    int totalBoardRecord();
    List<BoardReportVO> getBoardReportList(PagingVO pvo);
    BoardReportVO getPostsVO( int post_id);
    //게시글관리_보드삭제 버튼
    int postsDelete(int post_id);
    //댓글관리======================================================
    int totalReplyRecord();
    List<BoardReplyVO> getReplyList_admin(PagingVO pvo);
    //퀴즈관리======================================================
    List<QuizVO> quizlist(int level);
    //퀴즈관리_퀴즈등록페이지버튼
    int quizInsert(String quiz_content,int level);
    int selectQuizId(String quiz_content);
    int answerInsert(int quiz_id, String answer);
    //퀴즈관리_유저퀴즈등록버튼
    //퀴즈관리_등록된 퀴즈 리스트
    List<QuizVO> editlist(int quiz_id);
    //채팅관리======================================================
    int totalMessageRecord();
    List<AdminChatVO> adminChatList(PagingVO pvo);



    //List<BoardVO> getBoardList_admin(PagingVO pvo);
    //List<MessageVO> getMessageList_admin(PagingVO pvo);
    //List<UserVO> getMemberList_admin(PagingVO pvo);




}
