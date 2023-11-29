package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import java.util.List;

public interface BoardService {
    public int boardInsert(BoardVO vo);
    public List<BoardVO> boardPageList(PagingVO pVO);
    public int totalRecord(PagingVO pVO);
    public BoardVO boardSelect(int post_id);
    public void hitCount(int post_id);
    public int boardUpdate(BoardVO vo);
    public int boardDelete(int post_id);
}
