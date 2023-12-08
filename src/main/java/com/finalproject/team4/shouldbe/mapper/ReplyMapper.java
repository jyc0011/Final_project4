package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.ReplyVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {

    public ReplyVO replySelect(int post_id);

}
