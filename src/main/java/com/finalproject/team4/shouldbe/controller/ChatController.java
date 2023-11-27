package com.finalproject.team4.shouldbe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
}