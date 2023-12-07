package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    private String userid;
    private String userpwd;
    private String username;
    private String email;
    private String nation;
    private int sex;
    private String date;
    private String[] langArr;
    private String salt;
    private String profile_img;
    private String profile_content;
    private String lang;

    public void setLangArr(String[] langArr) {
        this.langArr = langArr;
        this.lang = String.join("/", langArr);
    }
    public void setLang(String lang){
        this.lang = lang;
        this.langArr = lang.split("/");
    }

}