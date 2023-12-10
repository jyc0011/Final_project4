package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.ReplyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {

    public List<ReplyVO> replyList(int post_id);
    public int addReply(ReplyVO rVO);
    public ReplyVO selectReply(int post_id, int comment_id);
    public int deleteReply(int post_id, int comment_id);
}
