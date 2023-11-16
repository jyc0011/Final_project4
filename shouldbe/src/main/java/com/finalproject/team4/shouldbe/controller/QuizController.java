package com.finalproject.team4.shouldbe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/quiz")
public class QuizController {
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

    @GetMapping("/medium")
    public String quiz_medium(){
        return "/quiz/quiz_medium";
    }

    @GetMapping("/hard")
    public String quiz_hard(){
        return "/quiz/quiz_hard";
    }
}
