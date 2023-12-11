package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.*;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MypageService {
    MypageVO mypage_info(String userid);

    int mypage_edit(MypageVO vo);

    List<BoardVO> mypage_post_board(PagingVO pvo, String userid);

    int countBoard(String user_id);

    List<BoardReplyVO> mypage_post_board_reply(PagingVO pvo, String userid);

    int countReply(String user_id);

    List<SaveMessageVO> getSaveMessageList(PagingVO pvo, String userid);
    
    int totalRecord(String userid);
    
    List<FriendVO> friendList(PagingVO pvo, String followed_user_id);

    int countfriendList(String user_id);
    
    int friendDelete(String followed_user_id, String following_user_id);
    
    List<BlockVO> blockList(PagingVO pvo, String user_id);

    int countblockList(String user_id);

    int block_id_unlock(String block_id, String user_id);

    int withdraw_user_date(String user_id);

    int withdraw_user(String user_id);


    int change_profileimg(MypageVO vo);

    int change_basic_profileimg(MypageVO vo);

    List<SaveQuizVO> selectSaveQuiz(PagingVO pvo, String userid);

    int countSaveQuiz(String userid);
}
