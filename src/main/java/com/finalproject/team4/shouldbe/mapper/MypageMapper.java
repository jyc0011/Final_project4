package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MypageMapper {
    MypageVO mypage_info(String userid);

    int mypage_edit(MypageVO vo);

    List<BoardVO> mypage_post_board(String userid); // 글목록 보기

    List<BoardReplyVO> mypage_post_board_reply(String userid); // 댓글목록보기

    List<FriendVO> friendList(String followed_user_id);

    int friendDelete(String followed_user_id, String following_user_id);

    int countSaveMessages(String userid);

    List<SaveMessageVO> selectSaveMessages(@Param("pvo") PagingVO pvo, @Param("userid") String userid);
}