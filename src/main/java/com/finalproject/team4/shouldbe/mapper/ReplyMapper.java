package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.BoardReplyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {

    public List<BoardReplyVO> replyList(int post_id);
    public int addReply(BoardReplyVO rVO);
    public BoardReplyVO selectReply(int post_id, int comment_id);
    public int deleteReply(int post_id, int comment_id);
    public int report(int comment_id, String user_id);
    public int like(int comment_id, String user_id);
}
