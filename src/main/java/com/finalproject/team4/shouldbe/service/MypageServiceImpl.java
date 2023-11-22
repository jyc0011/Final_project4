package com.finalproject.team4.shouldbe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.team4.shouldbe.mapper.MypageMapper;
import com.finalproject.team4.shouldbe.vo.MypageVO;

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
}
