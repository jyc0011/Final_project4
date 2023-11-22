package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.MypageVO;

public interface MypageService {
    public MypageVO mypage_info(String userid);
    public int mypage_edit(MypageVO vo);
}
