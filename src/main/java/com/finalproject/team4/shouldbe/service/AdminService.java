package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.*;

import java.util.List;

public interface AdminService {
    List<AdminMemberVO> adminMemberList(PagingVO pvo);

    List<AdminSuspendedVO> adminSuspendedList(PagingVO pvo);

    int totalSuspendedMemberRecord();

    List<AdminWithdrawnVO> adminWithdrawnList(PagingVO pvo);

    List<AdminChatVO> adminChatList(PagingVO pvo);

    int totalBoardRecord();

    List<BoardVO> getBoardList_admin(PagingVO pvo);

    int totalReplyRecord();

    List<BoardReplyVO> getReplyList_admin(PagingVO pvo);

    int totalMessageRecord();

    List<MessageVO> getMessageList_admin(PagingVO pvo);

    List<UserVO> getMemberList_admin(PagingVO pvo);

    int totalMemberRecord();

    int totalWithdrawnMemberRecord();
}
