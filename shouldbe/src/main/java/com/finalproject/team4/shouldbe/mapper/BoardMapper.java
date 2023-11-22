package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    public List<BoardVO> boardPageList();

    public int BoardInsert(BoardVO vo);

    public List<BoardVO> BoardPageList(PagingVO pVO);

	public int totalRecord(PagingVO pVO);

	public BoardVO BoardSelect(int post_id);

	public void hitCount(int post_id);

	public int BoardUpdate(BoardVO vo);

	public int BoardDelete(int post_id);

	public void increaseLike(int post_id);
}
