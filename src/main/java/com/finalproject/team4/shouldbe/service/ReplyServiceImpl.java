package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.ReplyMapper;
import com.finalproject.team4.shouldbe.mapper.UserMapper;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.LoginVO;
import com.finalproject.team4.shouldbe.vo.ReplyVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    ReplyMapper mapper;


    @Override
    public ReplyVO replySelect(int post_id) {
        return mapper.replySelect(post_id);
    }
}
