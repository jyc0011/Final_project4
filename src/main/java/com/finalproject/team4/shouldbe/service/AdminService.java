package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.*;

import java.util.List;

public interface AdminService {
    public List<AdminMemberVO> adminMemberList();
    public List<AdminSuspendedVO> adminSuspendedList();
    public List<AdminWithdrawnVO> adminWithdrawnList();
    public List<AdminChatVO> adminChatList();
    int totalBoardRecord();
    public List<BoardVO> getSaveMessageList(PagingVO pvo);
}
