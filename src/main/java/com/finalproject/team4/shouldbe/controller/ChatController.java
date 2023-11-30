package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.vo.MessageVO;
import com.finalproject.team4.shouldbe.vo.OutputMessageVO;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ChatController {

    @RequestMapping("/chat/list")
    public ModelAndView chat_room_list() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat/chatRoomList");
        // 추가적인 사용자 정보나 세션 정보를 ModelAndView에 추가할 수 있습니다.
        return mv;
    }

    @RequestMapping("/chat/room")
    public ModelAndView chat_room() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat/chat");
        // 추가적인 사용자 정보나 세션 정보를 ModelAndView에 추가할 수 있습니다.
        return mv;
    }

    @RequestMapping("/chat/message/save")
    public ModelAndView chat_message_save() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat/chat");
        // 추가적인 사용자 정보나 세션 정보를 ModelAndView에 추가할 수 있습니다.
        return mv;
    }

    @RequestMapping("/chattingForm")
    public ModelAndView chat() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat/chatting");
        // 추가적인 사용자 정보나 세션 정보를 ModelAndView에 추가할 수 있습니다.
        return mv;
    }

    @MessageMapping("/chatting")
    @SendTo("/topic/messages")
    public OutputMessageVO send(MessageVO vo) {
        System.out.println(vo.toString());
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        System.out.println(time);
        return new OutputMessageVO(vo.getFrom(), vo.getTo(), vo.getText(), time);
    }
}