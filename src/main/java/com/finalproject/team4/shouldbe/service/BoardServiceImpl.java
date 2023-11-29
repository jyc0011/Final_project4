package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.BoardMapper;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Provider;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    BoardMapper Mapper;


    @Override
    public int boardInsert(BoardVO vo) {
        return Mapper.boardInsert(vo);
    }

    @Override
    public List<BoardVO> boardPageList(PagingVO pVO) {
        return Mapper.boardPageList(pVO);
    }

    @Override
    public int totalRecord(PagingVO pVO) {
        return Mapper.totalRecord(pVO);
    }

    @Override
    public BoardVO boardSelect(int post_id) {
        return Mapper.boardSelect(post_id);
    }

    @Override
    public void hitCount(int post_id) {
        Mapper.hitCount(post_id);
    }

    @Override
    public int boardUpdate(BoardVO vo) {
        return Mapper.boardUpdate(vo);
    }

    @Override
    public int boardDelete(int post_id) {
        return Mapper.boardDelete(post_id);
    }

    /*@Override
    public void increaseLike(int post_id){
        Mapper.increaseLike(post_id);
    }*/
}
