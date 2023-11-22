package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    public int useridCheck(String userid);
    public int useridInsert(UserVO vo);
    public LoginVO userLoginCheck(String userid);
}
