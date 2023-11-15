package com.finalproject.team4.shouldbe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
    @GetMapping("/board")
    public String boardfree() {
        return "board/board_list";
    }

    @GetMapping("/board/view")
    public String view() {
        return "board/board_view";
    }
    @GetMapping("/board/write")
    public String write() {
        return "board/board_write";
    }
}
