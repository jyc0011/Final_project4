package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.UserMapper;
import com.finalproject.team4.shouldbe.util.DayUtil;
import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

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

    @Override
    public String userFindId(String username, String userid) {
        return mapper.userFindId(username, userid);
    }

    @Override
    public int userCheckId(String userid, String email) {
        return mapper.userCheckId(userid, email);
    }

    @Override
    public int userCheckEmail(String email) {
        return mapper.userCheckEmail(email);
    }

    @Override
    public int userpwdUpdate(UserVO vo) {
        return mapper.userpwdUpdate(vo);
    }

    @Override // 오늘 로그인 했는지 안 했는지 하는거
    public void logUser(String userid){
        Date lastLog = mapper.getLastLogDate(userid);
        if (lastLog == null || !DayUtil.isSameDay(lastLog, new Date())) {
            mapper.insertLog(userid);
        }
    }
}
