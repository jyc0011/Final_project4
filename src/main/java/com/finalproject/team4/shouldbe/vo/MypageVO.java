package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MypageVO {
    private String user_id;
    private String user_name;
    private String email;
    private String nation;
    private String password;
    private String salt;
    private String lang;
    private String profile_img;
    private String profile_content;

    public String getLang(){
        lang = lang.replaceAll(",", "/");
        System.out.println(lang);
        return lang;
    }
}


