package com.finalproject.team4.shouldbe.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
    @GetMapping("/board_free")
    public String boardfree() {
        return "board/board_free";
    }

    @GetMapping("/board_free/view")
    public String view() {
        return "board/board_free";
    }
    @GetMapping("/board_free/write")
    public String write() {
        return "board/board_write";
    }
}
