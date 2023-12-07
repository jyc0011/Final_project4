package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminWithdrawnVO {
    private String profile_img;//users
    private String user_name;//users
    private String user_id;//withdrawn_users
    private String withdrawn_time;//withdrawn_users
    private int posts_count;//setPosts_count
    private int comments_count;//setComments_count
    private int count_report;//users
    private String time;

    //밑에부터 삭제

}
