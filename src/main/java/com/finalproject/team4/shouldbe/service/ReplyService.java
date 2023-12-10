package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import com.finalproject.team4.shouldbe.vo.ReplyVO;

import java.util.List;

public interface ReplyService {

    public List<ReplyVO> replyList(int post_id);
    public int addReply(ReplyVO rVO);
    public ReplyVO selectReply(int post_id, int comment_id);
    public int deleteReply(int post_id, int comment_id);
}
