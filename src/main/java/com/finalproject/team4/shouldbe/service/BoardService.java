package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;

import java.util.List;

public interface BoardService {
    int BoardInsert(BoardVO vo);

    List<BoardVO> BoardPageList(PagingVO pVO);

    int totalRecord(PagingVO pVO);

    BoardVO BoardSelect(int post_id);

    void hitCount(int post_id);

    int BoardUpdate(BoardVO vo);

    int BoardDelete(int post_id);
}
