package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.vo.ChatMessage;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
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

	@RequestMapping("/chat")
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

	@MessageMapping("/chat.sendMessage")
	@SendTo("/topic/public")
	public ChatMessage sendMessage(
			@Payload ChatMessage chatMessage
	) {
		return chatMessage;
	}

	@MessageMapping("/chat.addUser")
	@SendTo("/topic/public")
	public ChatMessage addUser(
			@Payload ChatMessage chatMessage,
			SimpMessageHeaderAccessor headerAccessor
	) {
		// Add username in web socket session
		headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
		return chatMessage;
	}
}