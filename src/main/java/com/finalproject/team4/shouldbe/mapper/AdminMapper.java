package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {
    List<AdminMemberVO> adminMemberList(@Param("pvo") PagingVO pvo);

    List<AdminSuspendedVO> adminSuspendedList(@Param("pvo") PagingVO pvo);

    List<AdminWithdrawnVO> adminWithdrawnList(@Param("pvo") PagingVO pvo);

    List<AdminChatVO> adminChatList(@Param("pvo") PagingVO pvo);

    int countBoard();

    List<BoardVO> selectBoard(@Param("pvo") PagingVO pvo);

    int countBoardReply();

    List<BoardReplyVO> selectBoardReply(@Param("pvo") PagingVO pvo);

    List<MessageVO> selectMessage(@Param("pvo") PagingVO pvo);

    int countMessage();

    int countMember();

    List<UserVO> selectMember(@Param("pvo") PagingVO pvo);

    int countSuspendedMember();

    int countWithdrawnMember();
}
