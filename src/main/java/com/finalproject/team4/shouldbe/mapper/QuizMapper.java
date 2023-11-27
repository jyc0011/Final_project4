package com.finalproject.team4.shouldbe.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.finalproject.team4.shouldbe.vo.QuizVO;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface QuizMapper {
    List<QuizVO> findQuiz(@Param("level") int level);
    List<String> findAnswersByQuizId(int quizId);
    void insertQuizInfo(@Param("quiz_id") int quizId, @Param("user_id") String userId);
}