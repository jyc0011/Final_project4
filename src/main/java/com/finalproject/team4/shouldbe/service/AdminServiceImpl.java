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


    @Override
    public List<QuizVO> editlist(int quiz_id) {
        return mapper.editlist(quiz_id);
    }

    @Override
    public List<QuizVO> quizlist(int level) {
        return mapper.quizlist(level);
    }

    @Override
    public int postsDelete(int post_id) {
        return mapper.postsDelete(post_id);
    }

    @Override
    public int suspendInsert(String user_id) {
        return mapper.suspendInsert(user_id);
    }

    @Override
    public List<AdminMemberVO> adminMemberList(PagingVO pvo) {
        return mapper.adminMemberList(pvo);
    }

    @Override
    public List<AdminSuspendedVO> adminSuspendedList(PagingVO pvo) {
        return mapper.adminSuspendedList(pvo);
    }

    @Override
    public int totalSuspendedMemberRecord() {
        return mapper.countSuspendedMember();
    }

    @Override
    public List<AdminWithdrawnVO> adminWithdrawnList(PagingVO pvo) {
        return mapper.adminWithdrawnList(pvo);
    }

    @Override
    public int totalWithdrawnMemberRecord() {
        return mapper.countWithdrawnMember();
    }

    @Override
    public List<AdminChatVO> adminChatList(PagingVO pvo) {
        return mapper.adminChatList(pvo);
    }

    @Override
    public int totalBoardRecord() {
        return mapper.countBoard();
    }

    @Override
    public List<BoardVO> getBoardList_admin(PagingVO pvo) {
        return mapper.selectBoard(pvo);
    }

    @Override
    public int totalReplyRecord() {
        return mapper.countBoardReply();
    }

    @Override
    public List<BoardReplyVO> getReplyList_admin(PagingVO pvo) {
        return mapper.selectBoardReply(pvo);
    }

    @Override
    public int totalMessageRecord() {
        return mapper.countMessage();
    }

    @Override
    public List<MessageVO> getMessageList_admin(PagingVO pvo) {
        return mapper.selectMessage(pvo);
    }

    @Override
    public int totalMemberRecord() {
        return mapper.countMember();
    }

    @Override
    public List<UserVO> getMemberList_admin(PagingVO pvo) {
        return mapper.selectMember(pvo);
    }
}
