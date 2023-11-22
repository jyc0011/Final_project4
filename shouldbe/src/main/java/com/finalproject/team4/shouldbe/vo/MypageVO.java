package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MypageVO {
    private String user_id;
    private String password;
    private String salt;
    private String lang;
    private String profile_content;
}
