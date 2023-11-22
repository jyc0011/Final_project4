package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.QuizVO;
import java.util.Map;

public interface QuizService {
    QuizVO selectRandomQuiz(String userId, int level);
    void saveQuizInfo(String quizContent, String userAnswer, String correctAnswer, String result);
    Map<String, String> getQuizInfo();
}
