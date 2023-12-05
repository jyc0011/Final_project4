package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.QuizMapper;
import com.finalproject.team4.shouldbe.vo.QuizVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Random;

@Service
public class QuizServiceImpl implements QuizService {

    @Autowired
    private QuizMapper QuizMapper;

    @Override
    public QuizVO selectRandomQuiz(String userId, int level) {
        List<QuizVO> quizzes = QuizMapper.findQuiz(level);
        if (quizzes.isEmpty()) {
            return null;
        }
        return quizzes.get(new Random().nextInt(quizzes.size()));
    }

    @Override
    public boolean saveQuiz(int quizId, String userId) {
        boolean exists = QuizMapper.existsQuizInfo(quizId, userId);
        if (!exists) {
            QuizMapper.insertQuizInfo(quizId, userId);
            return true;
        }
        return false;
    }

    @Override
    public void saveQuizAnswer(int quizId, String userId, String correct) {
        if (correct.equals("correct")) {
            QuizMapper.insertUserAnswerInfo(quizId, userId, 1);
        } else {
            QuizMapper.insertUserAnswerInfo(quizId, userId, 0);
        }
    }

    @Override
    public String getCorrectAnswers(int quizId) {
        List<String> answers = QuizMapper.findAnswersByQuizId(quizId);
        return String.join(", ", answers);
    }

    @Override
    @Transactional
    public void createQuiz(QuizVO quizVO) {
        QuizMapper.insertQuiz(quizVO);
        QuizMapper.insertAnswer(quizVO);
    }
}
