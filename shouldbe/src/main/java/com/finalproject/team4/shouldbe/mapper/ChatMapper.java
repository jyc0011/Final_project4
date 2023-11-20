package com.finalproject.team4.shouldbe.mapper;
import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ChatMapper {

	String hasRoom(@Param("roomOwnerId") String roomOwnerId, @Param("chat_memberId") String chat_memberId);

}
