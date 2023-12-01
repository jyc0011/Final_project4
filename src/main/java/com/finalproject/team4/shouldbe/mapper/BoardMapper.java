package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    public int boardInsert(BoardVO vo);

    public List<BoardVO> boardPageList(PagingVO pVO);

	public int totalRecord(PagingVO pVO);

	public BoardVO boardSelect(int post_id);

	public void viewCount(int post_id);

	public int boardUpdate(BoardVO vo);

	public int boardDelete(int post_id);

	public void increaseLike(int post_id);
}
