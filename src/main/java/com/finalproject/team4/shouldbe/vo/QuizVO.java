package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuizVO {
    private int quiz_id;
    private int level;
    private String quiz_lang;
    private String quiz_content;
    private String answer;
    private String user_answer;

    @Override
    public String toString() {
        return "QuizVO{" +
                "quiz_id=" + quiz_id +
                ", level=" + level +
                ", quiz_lang='" + quiz_lang + '\'' +
                ", quiz_content='" + quiz_content + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }

}
