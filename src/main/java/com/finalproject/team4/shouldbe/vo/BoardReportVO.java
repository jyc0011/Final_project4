package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardReportVO {
    private int post_report_id;//post_report
    private String user_id;//post_report
    private int post_id;//post_report
    private String report_time;//post_report

    private String title; //posts
    private String content; //posts
    private String board_cat;//posts
}
