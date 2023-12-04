package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomVO {
    private int chat_id;
    private String from_id;
    private String to_id;
    private String last_content;
    private int not_read;
    private String last_time;
}
