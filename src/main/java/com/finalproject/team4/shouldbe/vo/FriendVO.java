package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FriendVO {
    private String following_user_id;//상대
    private String followed_user_id;//본인
    private String user_name;
    private String profile_content;
    private String profile_img;
    private int chat_id;
    private String from_id;
    private String to_id;
}

