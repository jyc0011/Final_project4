package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.vo.QuizVO;
import com.finalproject.team4.shouldbe.service.QuizService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/quiz")
public class QuizController {
    @Autowired
    private QuizService quizService;

    @GetMapping("/main")
    public String quiz_list() {
        return "/quiz/quiz_main";
    }

    @GetMapping("/create")
    public String quiz_create() {
        return "/quiz/quiz_create";
    }

    @GetMapping("/easy")
    public String quiz_easy(Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        QuizVO quiz = quizService.selectRandomQuiz(userId, 1);
        model.addAttribute("quiz", quiz);
        session.setAttribute("quizId", quiz.getQuiz_id());
        return "/quiz/quiz_easy";
    }

    @PostMapping("/checkAnswer")
    public ModelAndView checkAnswer(@RequestParam("quizContent") String quizContent,
                                    @RequestParam("userAnswer") String userAnswer,
                                    @RequestParam("level") String level,
                                    HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String userId = (String) session.getAttribute("userId");
        Integer quizId = (Integer) session.getAttribute("quizId"); // 세션에서 퀴즈 번호 가져오기
        List<String> correctAnswers = quizService.getCorrectAnswers(quizId); // 정답 리스트 가져오기

        String result = correctAnswers.contains(userAnswer) ? "correct" : "incorrect"; // 사용자 답변 확인
        quizService.saveQuizInfo(quizContent, userAnswer, correctAnswers, result, level, quizId, userId);

        mav.addObject("result", result); // 결과를 모델에 추가
        mav.setViewName("redirect:/quiz/answer"); // 결과 페이지로 리디렉션
        return mav;
    }


    @GetMapping("/medium")
    public String quiz_medium(Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        QuizVO quiz = quizService.selectRandomQuiz(userId, 2);
        model.addAttribute("quiz", quiz);
        session.setAttribute("quizId", quiz.getQuiz_id());
        return "/quiz/quiz_medium";
    }

    @GetMapping("/hard")
    public String quiz_hard(Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        QuizVO quiz = quizService.selectRandomQuiz(userId, 3);
        model.addAttribute("quiz", quiz);
        session.setAttribute("quizId", quiz.getQuiz_id());
        return "/quiz/quiz_hard";
    }

    @GetMapping("/answer")
    public ModelAndView showAnswer() {
        Map<String, String> quizInfo = quizService.getQuizInfo();
        ModelAndView modelAndView = new ModelAndView("/quiz/quiz_answer");
        modelAndView.addObject("quizInfo", quizInfo);
        return modelAndView;
    }

    @PostMapping("/save")
    public ResponseEntity<?> saveQuiz(@RequestParam("quiz_id") int quizId,
                                      @RequestParam("user_id") String userId) {
        try {
            quizService.saveQuiz(quizId, userId);
            return ResponseEntity.ok("Quiz saved successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error saving quiz");
        }
    }
}