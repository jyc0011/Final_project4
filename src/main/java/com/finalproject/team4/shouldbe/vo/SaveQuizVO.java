package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SaveQuizVO {
    private int quiz_id;
    private int level;
    private String user_id;
    private String quiz_content;
    private String answer;
}
