package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuizVO {
    private int quiz_id;
    private int level;
    private String quiz_lang;
    private String quiz_content;
    private String answer;

    public int getQuiz_id() {
        return quiz_id;
    }
}
