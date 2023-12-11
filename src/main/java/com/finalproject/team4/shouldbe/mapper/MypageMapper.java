package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MypageMapper {
    MypageVO mypage_info(String userid);

    int mypage_edit(MypageVO vo);

    List<BoardVO> mypage_post_board(@Param("pvo") PagingVO pvo, @Param("user_id") String user_id); // 글목록 보기

    int countBoard(String user_id);

    List<BoardReplyVO> mypage_post_board_reply(@Param("pvo") PagingVO pvo, @Param("user_id") String user_id); // 댓글목록보기

    int countReply(String user_id);

    List<FriendVO> friendList(@Param("pvo") PagingVO pvo, @Param("followed_user_id") String followed_user_id);

    int countfriendList(String user_id);

    int friendDelete(String followed_user_id, String following_user_id);

    List<BlockVO> blockList(@Param("pvo") PagingVO pvo, @Param("user_id") String user_id);

    int countblockList(String user_id);

    int block_id_unlock(String block_id, String user_id);

    int withdraw_user_date(String user_id);
    
    int withdraw_user(String user_id);

    int countSaveMessages(String userid);
    
    List<SaveMessageVO> selectSaveMessages(@Param("pvo") PagingVO pvo, @Param("userid") String userid);

    int change_profileimg(MypageVO vo);

    int change_basic_profileimg(MypageVO vo);

    List<SaveQuizVO> selectSaveQuiz(@Param("pvo") PagingVO pvo, @Param("userid") String userid);

    int countSaveQuiz(String userid);
}