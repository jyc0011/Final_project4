package com.finalproject.team4.shouldbe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.finalproject.team4.shouldbe.vo.QuizVO;
import com.finalproject.team4.shouldbe.mapper.QuizMapper;
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
    public void saveQuizInfo(String quizContent, String userAnswer, String correctAnswer, String result) {
        HttpSession session = request.getSession();
        session.setAttribute("quizContent", quizContent);
        session.setAttribute("userAnswer", userAnswer);
        session.setAttribute("correctAnswer", correctAnswer);
        session.setAttribute("result", result);
    }

    @Override
    public Map<String, String> getQuizInfo() {
        HttpSession session = request.getSession();
        Map<String, String> quizInfo = new HashMap<>();
        quizInfo.put("userAnswer", (String) session.getAttribute("userAnswer"));
        quizInfo.put("correctAnswer", (String) session.getAttribute("correctAnswer"));
        quizInfo.put("result", (String) session.getAttribute("result"));
        return quizInfo;
    }
}
