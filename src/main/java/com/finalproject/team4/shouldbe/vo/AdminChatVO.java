package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminChatVO {
    // private String from_id;
    // private String to;
    // private String content
    private int count_report;

    //삭제 예정
    private String profile_img;
    private String user_name;
    private String user_id;
    private String time;



}
