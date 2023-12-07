package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardReplyVO {
    private int comment_id;
    private String writer;
    private int post_id;
    private String content;
    private int like;
    private int target_parent;
    private String write_date;
    private int depth;
    private String email;
    private int isdelete;
    private String board_cat;
}
