package com.finalproject.team4.shouldbe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalproject.team4.shouldbe.vo.BoardReplyVO;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.MypageVO;

@Mapper
public interface MypageMapper {
    public MypageVO mypage_info(String userid);
    public int mypage_edit(MypageVO vo);
    public List<BoardVO> mypage_post_board(String userid); // 글목록 보기
    public List<BoardReplyVO> mypage_post_board_reply(String userid); // 댓글목록보기
}
