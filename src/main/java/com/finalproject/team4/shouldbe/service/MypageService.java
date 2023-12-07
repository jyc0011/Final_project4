package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.*;

import java.util.List;

public interface MypageService {
    MypageVO mypage_info(String userid);

    int mypage_edit(MypageVO vo);

    List<BoardVO> mypage_post_board(String userid);

    List<BoardReplyVO> mypage_post_board_reply(String userid);

    List<SaveMessageVO> getSaveMessageList(PagingVO pvo, String userid);

    int totalRecord(String userid);

    List<FriendVO> friendList(String followed_user_id);

    int friendDelete(String followed_user_id, String following_user_id);

    List<BlockVO> blockList(String user_id);

    int block_id_unlock(String block_id, String user_id);

    int withdraw_user_date(String user_id);

    int withdraw_user(String user_id);

    int change_profileimg(MypageVO vo);

    int change_basic_profileimg(MypageVO vo);
}
