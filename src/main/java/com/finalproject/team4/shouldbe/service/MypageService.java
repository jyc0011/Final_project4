package com.finalproject.team4.shouldbe.service;

import java.util.List;

import com.finalproject.team4.shouldbe.vo.*;

public interface MypageService {
    public MypageVO mypage_info(String userid);
    public int mypage_edit(MypageVO vo);
    public List<BoardVO> mypage_post_board(String userid);
    public List<BoardReplyVO> mypage_post_board_reply(String userid);
    public List<SaveMessageVO> getSaveMessageList(PagingVO pvo, String userid);
    public int totalRecord(String userid);
    public List<FriendVO> friendList(String followed_user_id);
    public int friendDelete(String followed_user_id, String following_user_id);
}
