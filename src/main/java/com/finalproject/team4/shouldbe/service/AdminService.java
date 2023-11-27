package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.AdminChatVO;
import com.finalproject.team4.shouldbe.vo.AdminMemberVO;
import com.finalproject.team4.shouldbe.vo.AdminSuspendedVO;
import com.finalproject.team4.shouldbe.vo.AdminWithdrawnVO;

import java.util.List;

public interface AdminService {
    public List<AdminMemberVO> adminMemberList();
    public List<AdminSuspendedVO> adminSuspendedList();
    public List<AdminWithdrawnVO> adminWithdrawnList();
    public List<AdminChatVO> adminChatList();
}
