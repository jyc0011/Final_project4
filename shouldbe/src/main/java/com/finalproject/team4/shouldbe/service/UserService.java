package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;

public interface UserService {
    public int useridCheck(String userid);
    public int useridInsert(UserVO vo);

    public LoginVO userLoginCheck(String userid);
}
