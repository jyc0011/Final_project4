package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.QuizVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuizMapper {
    List<QuizVO> findQuiz(int level, String userId);
    List<String> findAnswersByQuizId(int quizId);
    boolean existsQuizInfo(int quizId,String userId);
    void insertQuizInfo(int quizId, String userId);
    void insertQuiz(QuizVO quizVO);
    void insertUserAnswerInfo(int quizId, String userId);
    void insertAnswer(QuizVO quizVO);
    List<String> findLangByQuizId(int quizId);
}