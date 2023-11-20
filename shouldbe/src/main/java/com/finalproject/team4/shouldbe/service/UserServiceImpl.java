package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.UserMapper;
import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper mapper;
    @Override
    public int useridCheck(String userid) {
        return mapper.useridCheck(userid);
    }

    @Override
    public int useridInsert(UserVO vo) {
        return mapper.useridInsert(vo);
    }

    @Override
    public LoginVO userLoginCheck(String userid) {
        return mapper.userLoginCheck(userid);
    }
}
