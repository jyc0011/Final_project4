package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardVO> boardPageList();

    int BoardInsert(BoardVO vo);

    List<BoardVO> BoardPageList(PagingVO pVO);

    int totalRecord(PagingVO pVO);

    BoardVO BoardSelect(int post_id);

    void hitCount(int post_id);

    int BoardUpdate(BoardVO vo);

    int BoardDelete(int post_id);

    void increaseLike(int post_id);
}
