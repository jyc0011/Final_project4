package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SaveMessageVO {
    private int msg_id;
    private String save_user_id;
    private String content;
    private int chat_id;
    private String from_id;
    private String to_id;
}
