package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.vo.QuizVO;

public interface QuizService {
    QuizVO selectRandomQuiz(String userId, int level);

    String getCorrectAnswers(int quizId);

    boolean saveQuiz(int quizId, String userId);

    void createQuiz(QuizVO quizVO);

    void saveQuizAnswer(int quizId, String userId, String correct);
}
