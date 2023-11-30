package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;

public interface UserService {
    int useridCheck(String userid);

    int useridInsert(UserVO vo);

    LoginVO userLoginCheck(String userid);

    String userFindId(String username, String userid);

    int userCheckId(String userid, String email);

    int userpwdUpdate(UserVO vo);
}
