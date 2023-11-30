package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FriendVO {
    private String following_user_id;
    private String followed_user_id;
    private String user_name;
    private String profile_content;
    private String profile_img;
}
