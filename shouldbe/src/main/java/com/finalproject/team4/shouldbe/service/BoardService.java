package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import java.util.List;

public interface BoardService {
    public int BoardInsert(BoardVO vo);
    public List<BoardVO> BoardPageList(PagingVO pVO);
    public int totalRecord(PagingVO pVO);
    public BoardVO BoardSelect(int post_id);
    public void hitCount(int post_id);
    public int BoardUpdate(BoardVO vo);
    public int BoardDelete(int post_id);
}
