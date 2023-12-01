package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
    private int post_id;
    private String user_id;
    private String title;
    private String content;
    private int views;
    private String board_cat;
    private String write_date;
}

