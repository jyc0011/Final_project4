package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.QuizMapper;
import com.finalproject.team4.shouldbe.vo.QuizVO;

import java.util.List;
import java.util.Map;

public interface QuizService {
    QuizVO selectRandomQuiz(String userId, int level);
    void saveQuizInfo(String quizContent, String userAnswer, List<String> correctAnswers, String result, String level, Integer quizId, String userId);
    Map<String, String> getQuizInfo();
    public List<String> getCorrectAnswers(int quizId);
    public void saveQuiz(int quizId, String userId);
    void QuizService(QuizMapper quizMapper);
    boolean createQuiz(QuizVO quizVO);
}
