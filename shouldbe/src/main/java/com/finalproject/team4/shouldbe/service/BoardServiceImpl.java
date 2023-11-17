package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.BoardMapper;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{
    @Autowired
    BoardMapper mapper;
    @Override
    public List<BoardVO> boardPageList() {
        return mapper.boardPageList();
    }
}
