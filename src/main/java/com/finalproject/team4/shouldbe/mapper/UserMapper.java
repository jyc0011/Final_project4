package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;

@Mapper
public interface UserMapper {
    int useridCheck(String userid);

    int useridInsert(UserVO vo);

    LoginVO userLoginCheck(String userid);

    String userFindId(String username, String userid);

    int userCheckId(String userid, String email);

    int userCheckEmail(String email);
    int userpwdUpdate(UserVO vo);

    Date getLastLogDate(String userid);

    void insertLog(String userid);
}
