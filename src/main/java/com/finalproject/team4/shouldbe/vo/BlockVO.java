package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BlockVO {
    private String block_id;
    private String user_name;
    private String user_id;
    private String block_reason;
    private String profile_img;
}
