package com.finalproject.team4.shouldbe.mapper;

import java.util.List;

import com.finalproject.team4.shouldbe.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MypageMapper {
    public MypageVO mypage_info(String userid);
    public int mypage_edit(MypageVO vo);
    public List<BoardVO> mypage_post_board(String userid); // 글목록 보기
    public List<BoardReplyVO> mypage_post_board_reply(String userid); // 댓글목록보기
    public List<FriendVO> friendList(String followed_user_id);
    public FriendVO friendprofile(String following_user_id);
    public int countSaveMessages(String userid);
    public List<SaveMessageVO> selectSaveMessages(@Param("pvo") PagingVO pvo, @Param("userid") String userid);
}