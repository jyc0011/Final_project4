package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.BoardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    public List<BoardVO> boardPageList();
}
