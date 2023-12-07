package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.AdminMapper;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper mapper;


    //대시보드
    //현재회원관리=====================================================
    @Override
    public int totalMemberRecord() {
        return mapper.countMember();
    }
    @Override
    public List<AdminMemberVO> adminMemberList(PagingVO pvo) {
        return mapper.adminMemberList(pvo);
    }
    @Override
    public int postsCount(String user_id){return mapper.postsCount(user_id);}
    @Override
    public int commentsCount(String user_id){return mapper.postsCount(user_id);}


    //정지회원관리======================================================
    @Override
    public int totalSuspendedMemberRecord() {
        return mapper.countSuspendedMember();
    }
    @Override
    public List<AdminMemberVO> adminSuspendedList(PagingVO pvo) {
        return mapper.adminSuspendedList(pvo);
    }
    @Override
    public AdminMemberVO getUserVO(String user_id){return mapper.getUserVO(user_id);}


    //정지회원관리_정지버튼======================================================
    @Override
    public int suspendInsert(String user_id){return mapper.suspendInsert(user_id);}
    //정지회원관리_정지해제버튼
    @Override
    public int suspendDelete(int suspended_id){return mapper.suspendDelete(suspended_id);}


    //탈퇴회원관리======================================================
    @Override
    public int totalWithdrawnMemberRecord() {
        return mapper.countWithdrawnMember();
    }
    @Override
    public List<AdminMemberVO> adminWithdrawnList(PagingVO pvo) {
        return mapper.adminWithdrawnList(pvo);
    }
    public AdminMemberVO adminWithdrawnListUsers(String user_id){return mapper.adminWithdrawnListUsers(user_id);}


    //게시글관리======================================================
    @Override
    public int totalBoardRecord() {
        return mapper.countBoard();
    }
    @Override
    public List<BoardReportVO> getBoardReportList(PagingVO pvo){return mapper.getBoardReportList(pvo);}
    @Override
    public BoardReportVO getPostsVO( int post_id){return mapper.getPostsVO(post_id);}

    //게시글관리_보드삭제 버튼
    @Override
    public int postsDelete(int post_id){return mapper.postsDelete(post_id);}


    //댓글관리======================================================
    @Override
    public int totalReplyRecord() {
        return mapper.countBoardReply();
    }
    @Override
    public List<BoardReplyVO> getReplyList_admin(PagingVO pvo) {
        return mapper.selectBoardReply(pvo);
    }


    //퀴즈관리======================================================
    @Override
    public List<QuizVO> quizlist(int level){return mapper.quizlist(level);}


    //퀴즈관리_퀴즈등록페이지버튼======================================================
    @Override
    public int quizInsert(String quiz_content,int level){return mapper.quizInsert(quiz_content,level);}
    @Override
    public int selectQuizId(String quiz_content){return mapper.selectQuizId(quiz_content);}
    @Override
    public  int answerInsert(int quiz_id, String answer){return mapper.answerInsert(quiz_id,answer);}



    //퀴즈관리_유저퀴즈등록버튼======================================================
    //퀴즈관리_등록된 퀴즈 리스트======================================================
    @Override
    public List<QuizVO> editlist(int quiz_id){return mapper.editlist(quiz_id);}


    //채팅관리======================================================
    @Override
    public int totalMessageRecord() {
        return mapper.countMessage();
    }
    @Override
    public List<AdminChatVO> adminChatList(PagingVO pvo) {
        return mapper.adminChatList(pvo);
    }





   /* @Override
   public List<BoardVO> getBoardList_admin(PagingVO pvo) {
        return mapper.selectBoard(pvo);
    }
        @Override
    public List<MessageVO> getMessageList_admin(PagingVO pvo) {
        return mapper.selectMessage(pvo);
    }



    @Override
    public List<UserVO> getMemberList_admin(PagingVO pvo) {
        return mapper.selectMember(pvo);
    }

    */






}
