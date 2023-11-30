package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.QuizMapper;
import com.finalproject.team4.shouldbe.vo.QuizVO;

import java.util.List;
import java.util.Map;

public interface QuizService {
    QuizVO selectRandomQuiz(String userId, int level);
    String getCorrectAnswers(int quizId);
    boolean saveQuiz(int quizId, String userId);
    boolean createQuiz(QuizVO quizVO);
    void saveQuizAnswer(int quizId, String userId, String correct);
}
