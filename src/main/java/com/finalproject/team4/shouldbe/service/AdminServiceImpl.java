package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.AdminMapper;
import com.finalproject.team4.shouldbe.vo.*;
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
    @Override
    public List<AdminSuspendedVO> adminSuspendedList(){
        return mapper.adminSuspendedList();
    }
    @Override
    public List<AdminWithdrawnVO> adminWithdrawnList(){
        return mapper.adminWithdrawnList();
    }
    @Override
    public List<AdminChatVO> adminChatList(){
        return mapper.adminChatList();
    }
    @Override
    public int totalBoardRecord(){
        return mapper.countBoard();
    }
    @Override
    public List<BoardVO> getSaveMessageList(PagingVO pvo){
        return mapper.selectBoard(pvo);
    }
}
