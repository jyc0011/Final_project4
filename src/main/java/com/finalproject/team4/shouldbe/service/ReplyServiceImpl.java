package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.ReplyMapper;
import com.finalproject.team4.shouldbe.mapper.UserMapper;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.ReplyVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    ReplyMapper mapper;



    @Override
    public List<ReplyVO> replyList(int post_id) {
        return mapper.replyList(post_id);
    }

    @Override
    public int addReply(ReplyVO rVO) {
        return mapper.addReply(rVO);
    }

    @Override
    public ReplyVO selectReply(int post_id, int comment_id) {
        return mapper.selectReply(post_id, comment_id);
    }

    @Override
    public int deleteReply(int post_id, int comment_id) {
        return mapper.deleteReply(post_id, comment_id);
    }
}
