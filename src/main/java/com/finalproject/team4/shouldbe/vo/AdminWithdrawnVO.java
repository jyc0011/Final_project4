package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminWithdrawnVO {
    private String profile_img;
    private String user_name;
    private String user_id;
    //private String withdrawn_time;
    // private int posts_count;
    // private int comments_count;
    private int count_report;

    //밑에부터 삭제
    private String time;
}
