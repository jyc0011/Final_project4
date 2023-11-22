package com.finalproject.team4.shouldbe.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.finalproject.team4.shouldbe.vo.MypageVO;

@Mapper
public interface MypageMapper {
    public MypageVO mypage_info(String userid);
    public int mypage_edit(MypageVO vo);
}
