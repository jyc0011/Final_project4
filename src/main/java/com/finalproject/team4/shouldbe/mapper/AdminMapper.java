package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {
    public List<AdminMemberVO> adminMemberList(@Param("pvo") PagingVO pvo);
    public List<AdminSuspendedVO> adminSuspendedList(@Param("pvo") PagingVO pvo);
    public List<AdminWithdrawnVO> adminWithdrawnList(@Param("pvo") PagingVO pvo);
    public List<AdminChatVO> adminChatList(@Param("pvo") PagingVO pvo);
    public int countBoard();
    public List<BoardVO> selectBoard (@Param("pvo") PagingVO pvo);
    public int countBoardReply();
    public List<BoardReplyVO> selectBoardReply(@Param("pvo") PagingVO pvo);
    public List<MessageVO> selectMessage(@Param("pvo") PagingVO pvo);
    public int countMessage();
    public int countMember();
    public List<UserVO> selectMember(@Param("pvo") PagingVO pvo);
    public int countSuspendedMember();

    public int countWithdrawnMember();
}
