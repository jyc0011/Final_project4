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
    private String lang;
    private String salt;
}
