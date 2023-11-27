package com.finalproject.team4.shouldbe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.finalproject.team4.shouldbe.vo.QuizVO;
import com.finalproject.team4.shouldbe.mapper.QuizMapper;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    @Autowired
    private HttpServletRequest request;

    @Override
    public void saveQuizInfo(String quizContent, String userAnswer, List<String> correctAnswers, String result, String level, Integer quizId, String userId) {
        HttpSession session = request.getSession();
        session.setAttribute("quizContent", quizContent);
        session.setAttribute("userAnswer", userAnswer);
        session.setAttribute("correctAnswer", correctAnswers);
        session.setAttribute("result", result);
        session.setAttribute("level", level);
        session.setAttribute("quizId", quizId); // 퀴즈 ID 저장
        session.setAttribute("userId", userId); // 사용자 ID 저장
    }

    @Override
    public Map<String, String> getQuizInfo() {
        HttpSession session = request.getSession();
        Map<String, String> quizInfo = new HashMap<>();
        quizInfo.put("quizContent", (String) session.getAttribute("quizContent"));
        quizInfo.put("userAnswer", (String) session.getAttribute("userAnswer"));
        quizInfo.put("correctAnswer", ((List<String>) session.getAttribute("correctAnswer")).toString());
        quizInfo.put("result", (String) session.getAttribute("result"));
        quizInfo.put("level", (String) session.getAttribute("level"));
        quizInfo.put("quizId", String.valueOf(session.getAttribute("quizId"))); // 퀴즈 ID 추가
        quizInfo.put("userId", (String) session.getAttribute("userId")); // 사용자 ID 추가
        return quizInfo;
    }

    @Override
    public void saveQuiz(int quizId, String userId){
        boolean exists = QuizMapper.existsQuizInfo(quizId, userId);
        if (!exists) {
            QuizMapper.insertQuizInfo(quizId, userId);
        }
    }

    @Override
    public List<String> getCorrectAnswers(int quizId) {
        return QuizMapper.findAnswersByQuizId(quizId);
    }

    @Autowired
    public void QuizService(QuizMapper quizMapper) {
        this.QuizMapper = quizMapper;
    }

    @Override
    @Transactional
    public boolean createQuiz(QuizVO quizVO) {
        QuizMapper.insertQuiz(quizVO);
        QuizMapper.insertAnswer(quizVO);
        return true;
    }
}
