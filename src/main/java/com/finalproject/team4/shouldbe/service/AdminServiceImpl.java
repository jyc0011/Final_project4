package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.AdminMapper;
import com.finalproject.team4.shouldbe.vo.AdminChatVO;
import com.finalproject.team4.shouldbe.vo.AdminMemberVO;
import com.finalproject.team4.shouldbe.vo.AdminSuspendedVO;
import com.finalproject.team4.shouldbe.vo.AdminWithdrawnVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    AdminMapper mapper;
    @Override
    public List<AdminMemberVO> adminMemberList(){
        return mapper.adminMemberList();
    }
    public List<AdminSuspendedVO> adminSuspendedList(){
        return mapper.adminSuspendedList();
    }
    public List<AdminWithdrawnVO> adminWithdrawnList(){
        return mapper.adminWithdrawnList();
    }
    public List<AdminChatVO> adminChatList(){
        return mapper.adminChatList();
    }
}
