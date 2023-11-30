package com.finalproject.team4.shouldbe.service;

import java.util.List;

import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.team4.shouldbe.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService{
    @Autowired
    MypageMapper mapper;

    @Override
    public MypageVO mypage_info(String Userid) {
        return mapper.mypage_info(Userid);
    }

    @Override
    public int mypage_edit(MypageVO vo) {
        return mapper.mypage_edit(vo);
    }

    @Override
    public List<BoardVO> mypage_post_board(String userid) {
        return mapper.mypage_post_board(userid);
    }

    @Override
    public List<BoardReplyVO> mypage_post_board_reply(String userid) {
        return mapper.mypage_post_board_reply(userid);
    }

    @Override
    public int totalRecord(String userid) {
        return mapper.countSaveMessages(userid);
    }

    @Override
    public List<SaveMessageVO> getSaveMessageList(PagingVO pvo,String userid) {
        return mapper.selectSaveMessages(pvo, userid);
    }

    @Override
    public List<FriendVO> friendList(String followed_user_id) {
        return mapper.friendList(followed_user_id);
    }

    @Override
    public int friendDelete(String followed_user_id, String following_user_id) {
        return mapper.friendDelete(followed_user_id, following_user_id);
    }
}