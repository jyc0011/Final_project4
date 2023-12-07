package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminSuspendedVO {
    private int suspended_id;
    private String profile_img;
    private String user_name;
    private String user_id;
    private String suspended_time;
    private String reason;
    private int posts_count;
    private int comments_count;
    private int count_report;

    //밑에부터 삭제
    //private String time;

}
