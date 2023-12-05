package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MessageVO {
    private int msg_id;
    private int chat_id;
    private int is_from_id;
    private String content;
    private int is_read;
    private String send_date;
    private String sender;
    private String from_id;
    private String trans_content;
}
