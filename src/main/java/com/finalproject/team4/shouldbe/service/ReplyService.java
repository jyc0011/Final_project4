package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import com.finalproject.team4.shouldbe.vo.ReplyVO;

import java.util.List;

public interface ReplyService {

    public ReplyVO replySelect(int post_id);
}
