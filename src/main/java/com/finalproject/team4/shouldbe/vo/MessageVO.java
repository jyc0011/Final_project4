package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageVO {
    private String from;
    private String to;
    private String text;
//    private int msg_id;
//    private int chat_id;
//    private int is_from_id;
//    private String content;
//    private int is_read;
//    private String send_date;
}
