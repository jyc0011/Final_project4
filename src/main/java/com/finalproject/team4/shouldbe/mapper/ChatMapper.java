package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.MessageVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMapper {
    void insertMessage(MessageVO message);
}
