package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.BoardMapper;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardMapper Mapper;

    @Override
    public int BoardInsert(BoardVO vo) {
        return Mapper.BoardInsert(vo);
    }

    @Override
    public List<BoardVO> BoardPageList(PagingVO pVO) {
        return Mapper.BoardPageList(pVO);
    }

    @Override
    public int totalRecord(PagingVO pVO) {
        return Mapper.totalRecord(pVO);
    }

    @Override
    public BoardVO BoardSelect(int post_id) {
        return Mapper.BoardSelect(post_id);
    }

    @Override
    public void hitCount(int post_id) {
        Mapper.hitCount(post_id);
    }

    @Override
    public int BoardUpdate(BoardVO vo) {
        return Mapper.BoardUpdate(vo);
    }

    @Override
    public int BoardDelete(int post_id) {
        return Mapper.BoardDelete(post_id);
    }

    /*@Override
    public void increaseLike(int post_id){
        Mapper.increaseLike(post_id);
    }*/
}
