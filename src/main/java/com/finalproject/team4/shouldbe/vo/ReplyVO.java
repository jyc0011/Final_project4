package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVO {
    private int comment_id;
    private int post_id;
    private String user_id;
    private String content;
    private String write_date;
    private int parent_comment_id;
    private int depth;
    private int is_deleted;

}
