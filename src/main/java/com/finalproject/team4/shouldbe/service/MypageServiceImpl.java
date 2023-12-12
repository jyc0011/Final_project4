package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.MypageMapper;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MypageServiceImpl implements MypageService {
    @Autowired
    MypageMapper mapper;

    @Override
    public FriendVO selectChatId(String followed_userid, String following_user_id){return mapper.selectChatId(followed_userid,following_user_id);}
    @Override
    public MypageVO mypage_info(String Userid) {
        return mapper.mypage_info(Userid);
    }

    @Override
    public int mypage_edit(MypageVO vo) {
        return mapper.mypage_edit(vo);
    }

    @Override
    public List<BoardVO> mypage_post_board(PagingVO pvo, String userid) {
        return mapper.mypage_post_board(pvo, userid);
    }

    @Override
    public List<BoardReplyVO> mypage_post_board_reply(PagingVO pvo, String userid) {
        return mapper.mypage_post_board_reply(pvo, userid);
    }

    @Override
    public int totalRecord(String userid) {
        return mapper.countSaveMessages(userid);
    }

    @Override
    public List<SaveMessageVO> getSaveMessageList(PagingVO pvo, String userid) {
        return mapper.selectSaveMessages(pvo, userid);
    }

    @Override
    public List<FriendVO> friendList(PagingVO pvo, String followed_user_id) {
        return mapper.friendList(pvo, followed_user_id);
    }

    @Override
    public int friendDelete(String followed_user_id, String following_user_id) {
        return mapper.friendDelete(followed_user_id, following_user_id);
    }

    @Override
    public List<BlockVO> blockList(PagingVO pvo, String user_id) {
        return mapper.blockList(pvo, user_id);
    }

    @Override
    public int block_id_unlock(String block_id, String user_id) {
        return mapper.block_id_unlock(block_id, user_id);
    }

    @Override
    public int withdraw_user_date(String user_id) {
        return mapper.withdraw_user_date(user_id);
    }

    @Override
    public int withdraw_user(String user_id) {
        return mapper.withdraw_user(user_id);
    }

    @Override
    public int change_profileimg(MypageVO vo) {
        return mapper.change_profileimg(vo);
    }

    @Override
    public int change_basic_profileimg(MypageVO vo) {
       return mapper.change_basic_profileimg(vo);
    }

    @Override
    public List<SaveQuizVO> selectSaveQuiz(PagingVO pvo, String userid) {
        return mapper.selectSaveQuiz(pvo, userid);
    }

    @Override
    public int countSaveQuiz(String userid) {
        return mapper.countSaveQuiz(userid);
    }

    @Override
    public int countBoard(String user_id) {
        return mapper.countBoard(user_id);
    }

    @Override
    public int countReply(String user_id) {
        return mapper.countReply(user_id);
    }

    @Override
    public int countfriendList(String user_id) {
        return mapper.countfriendList(user_id);
    }

    @Override
    public int countblockList(String user_id) {
        return mapper.countblockList(user_id);
    }
    @Override
    public boolean deleteSavedQuiz(int quizId, String userId) {
        return mapper.deleteQuiz(quizId, userId) > 0;
    }
    @Override
    public boolean deleteSavedMsg(int msgId, String userId) {
        return mapper.deleteMsg(msgId, userId) > 0;
    }
}