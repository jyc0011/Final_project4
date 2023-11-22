package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.vo.QuizVO;
import com.finalproject.team4.shouldbe.service.QuizService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
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
    public String quiz_create(){
        return "/quiz/quiz_create";
    }

    @GetMapping("/easy")
    public String quiz_easy(){
        return "/quiz/quiz_easy";
    }

    @GetMapping("/easy/problem")
    public ModelAndView quiz_easy_prob(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        QuizVO quiz = quizService.selectRandomQuiz(userId, 1);

        ModelAndView mav = new ModelAndView("quiz/quiz_easy"); // "quizPage"는 JSP 파일의 이름
        mav.addObject("quiz", quiz);
        return mav;
    }

    @PostMapping("/checkAnswer")
    public String checkAnswer(@RequestParam("quizContent") String quizContent, @RequestParam("userAnswer") String userAnswer, @RequestParam("correctAnswer") String correctAnswer) {
        String result = userAnswer.equals(correctAnswer) ? "correct" : "incorrect";
        quizService.saveQuizInfo(quizContent, userAnswer, correctAnswer, result);
        return "redirect:/quiz/easy/answer";
    }

    @GetMapping("/easy/answer")
    public ModelAndView showAnswer() {
        Map<String, String> quizInfo = quizService.getQuizInfo();
        ModelAndView modelAndView = new ModelAndView("/quiz/quiz_answer");
        modelAndView.addObject("quizInfo", quizInfo);
        return modelAndView;
    }

    @GetMapping("/medium")
    public String quiz_medium(){
        return "/quiz/quiz_medium";
    }

    @GetMapping("/hard")
    public String quiz_hard(){
        return "/quiz/quiz_hard";
    }
}
