package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {
    public List<AdminMemberVO> adminMemberList();
    public List<AdminSuspendedVO> adminSuspendedList();
    public List<AdminWithdrawnVO> adminWithdrawnList();
    public List<AdminChatVO> adminChatList();
    public int countBoard();
    public List<BoardVO> selectBoard (@Param("pvo") PagingVO pvo);
}
