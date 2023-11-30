package com.finalproject.team4.shouldbe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.finalproject.team4.shouldbe.vo.QuizVO;
import com.finalproject.team4.shouldbe.mapper.QuizMapper;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;

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
    public boolean saveQuiz(int quizId, String userId){
        boolean exists = QuizMapper.existsQuizInfo(quizId, userId);
        if (!exists) {
            QuizMapper.insertQuizInfo(quizId, userId);
            return true;
        }
        return false;
    }

    @Override
    public void saveQuizAnswer(int quizId, String userId, String correct){
            if(correct=="correct"){
                QuizMapper.insertUserAnswerInfo(quizId, userId,1);
            }
            else {
                QuizMapper.insertUserAnswerInfo(quizId, userId,0);
            }
    }

    @Override
    public String getCorrectAnswers(int quizId) {
        List<String> answers = QuizMapper.findAnswersByQuizId(quizId);
        return String.join(", ", answers);
    }

    @Override
    @Transactional
    public boolean createQuiz(QuizVO quizVO) {
        QuizMapper.insertQuiz(quizVO);
        QuizMapper.insertAnswer(quizVO);
        return true;
    }
}
