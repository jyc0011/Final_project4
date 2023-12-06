package com.finalproject.team4.shouldbe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminChatVO {
    private int msg_id;//chat_report
    private String user_id;//chat_report
    private String content;//message:content
    private int count_report;//users

    /*chatreport
    private int chat_report_id;
    private String user_id;
    private int msg_id;
    private String report_time;
     */

    //삭제 예정
   // private String profile_img;
    //private String user_name;
  //  private String user_id;
    //private String time;


}
