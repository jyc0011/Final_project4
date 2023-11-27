package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.AdminChatVO;
import com.finalproject.team4.shouldbe.vo.AdminMemberVO;
import com.finalproject.team4.shouldbe.vo.AdminSuspendedVO;
import com.finalproject.team4.shouldbe.vo.AdminWithdrawnVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {
    public List<AdminMemberVO> adminMemberList();
    public List<AdminSuspendedVO> adminSuspendedList();
    public List<AdminWithdrawnVO> adminWithdrawnList();
    public List<AdminChatVO> adminChatList();



}
