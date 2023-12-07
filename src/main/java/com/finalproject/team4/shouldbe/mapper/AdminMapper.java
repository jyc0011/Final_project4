package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {
    //대시보드=====================================================
    //현재회원관리=====================================================
    int countMember();
    List<AdminMemberVO> adminMemberList(@Param("pvo") PagingVO pvo);
    int postsCount(String user_id);


    //정지회원관리======================================================
    int countSuspendedMember();
    List<AdminSuspendedVO> adminSuspendedList(@Param("pvo") PagingVO pvo);
    AdminSuspendedVO getUserVO(String user_id);


    //정지회원관리_정지버튼======================================================
    int suspendInsert(String user_id);
    //정지회원관리_정지해제버튼
    int suspendDelete(int suspended_id);


    //탈퇴회원관리======================================================
    int countWithdrawnMember();
    List<AdminWithdrawnVO> adminWithdrawnList(@Param("pvo") PagingVO pvo);
    AdminWithdrawnVO adminWithdrawnListUsers(String user_id);


    //게시글관리======================================================
    int countBoard();
    List<BoardReportVO> getBoardReportList(@Param("pvo") PagingVO pvo);
    BoardReportVO getPostsVO( int post_id);


    //게시글관리_보드삭제 버튼======================================================
    int postsDelete(int post_id);


    //댓글관리======================================================
    int countBoardReply();
    List<BoardReplyVO> selectBoardReply(@Param("pvo") PagingVO pvo);


    //퀴즈관리======================================================
    List<QuizVO> quizlist(int level);


    //퀴즈관리_퀴즈등록페이지버튼======================================================
    int quizInsert(String quiz_content,int level);
    int selectQuizId(String quiz_content);
    int answerInsert(int quiz_id,String answer);


    //퀴즈관리_유저퀴즈등록버튼======================================================
    //퀴즈관리_등록된 퀴즈 리스트======================================================
    List<QuizVO> editlist(int quiz_id);


    //채팅관리======================================================
    int countMessage();
    List<AdminChatVO> adminChatList(@Param("pvo") PagingVO pvo);


    /*
    int commentsCount(String user_id);
    List<BoardVO> selectBoard(@Param("pvo") PagingVO pvo);
    List<MessageVO> selectMessage(@Param("pvo") PagingVO pvo);
    List<UserVO> selectMember(@Param("pvo") PagingVO pvo);
    */





}
