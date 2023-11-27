package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.vo.QuizVO;
import com.finalproject.team4.shouldbe.service.QuizService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
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
    public String quiz_create(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        if (!"Y".equals(request.getSession().getAttribute("logStatus"))) {
            return "redirect:/login";
        }
        return "quiz/quiz_create";
    }


    @PostMapping("/createOk")
    @ResponseStatus(HttpStatus.CREATED)
    public void quizCreateOk(@RequestBody QuizVO quizVO) {
        quizService.createQuiz(quizVO);
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
    public void saveQuiz(@RequestParam("quizId") int quizId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("logId");
        if (userId == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User is not logged in");
        }
        quizService.saveQuiz(quizId, userId);
    }
    @ExceptionHandler(ResponseStatusException.class)
    public ResponseEntity<String> handleResponseStatusException(ResponseStatusException ex) {
        return new ResponseEntity<>(ex.getReason(), ex.getStatus());
    }

}