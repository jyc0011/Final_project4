package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import com.finalproject.team4.shouldbe.vo.BoardReplyVO;

import java.util.List;

public interface ReplyService {

    public List<BoardReplyVO> replyList(int post_id);
    public int addReply(BoardReplyVO rVO);
    public BoardReplyVO selectReply(int post_id, int comment_id);
    public int deleteReply(int post_id, int comment_id);
}
