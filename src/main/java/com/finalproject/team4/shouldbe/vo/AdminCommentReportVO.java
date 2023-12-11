package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminCommentReportVO {

    private int comment_report_id;
    private String user_id;
    private int comment_id;
    private String report_time;
    private int post_id;
    private String content;
    private String board_cat;
    private String title;

}
