package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminBoardVO {
    private String board_cat;
    private String board_title;
    private String content;
    private String user_id;
    private int report_count;
    private String report_reason;

}
