package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.*;

import java.util.List;

public interface AdminService {
    public List<AdminMemberVO> adminMemberList(PagingVO pvo);
    public List<AdminSuspendedVO> adminSuspendedList(PagingVO pvo);
    public int totalSuspendedMemberRecord();
    public List<AdminWithdrawnVO> adminWithdrawnList(PagingVO pvo);
    public List<AdminChatVO> adminChatList(PagingVO pvo);
    public int totalBoardRecord();
    public List<BoardVO> getBoardList_admin(PagingVO pvo);
    public int totalReplyRecord();
    public List<BoardReplyVO> getReplyList_admin(PagingVO pvo);
    public int totalMessageRecord();
    public List<MessageVO> getMessageList_admin(PagingVO pvo);
    public List<UserVO> getMemberList_admin(PagingVO pvo);
    public int totalMemberRecord();
    public int totalWithdrawnMemberRecord();
}
