package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.ChatService;
import com.finalproject.team4.shouldbe.service.MypageService;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ChatController {
	@Autowired
	MypageService myservice;
	@Autowired
	ChatService chatservice;

	@RequestMapping("/chat/list")
	public ModelAndView chat_room_list(HttpServletRequest request,
									   @RequestParam(required = false, defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		System.out.println(userId);
		PagingVO pvo = new PagingVO();
		pvo.setOnePageRecord(10);
		pvo.setNowPage(page);
		pvo.setTotalRecord(chatservice.totalRecord(userId));
		List<ChatRoomVO> vo = chatservice.getCurrentUserChatRooms(pvo, userId);
		System.out.println(vo);
		mav.addObject("myId", userId);
		mav.addObject("pVO", pvo);
		mav.addObject("chatRoom", vo);
		mav.setViewName("chat/chatRoomList");
		return mav;
	}

	@RequestMapping("/chat.l")
	public ModelAndView chat_room(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		MypageVO myvo =myservice.mypage_info(userId);
		mv.addObject("myvo",myvo);
		mv.setViewName("chat/chat");
		return mv;
	}

	@RequestMapping("/chat")
	public ModelAndView privateChat(@RequestParam("chat_id") int chatId,
									@RequestParam("other_user_id") String otherUserId,
									@RequestParam("from_id") String fromId,
									HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		List<MessageVO> pastMessages = chatservice.getMessagesByChatId(chatId);
		String profile_img=chatservice.getProfileImg(userId);
		String other_profile_img=chatservice.getProfileImg(otherUserId);
		mav.addObject("other_profile_img", other_profile_img);
		mav.addObject("profile_img", profile_img);
		mav.addObject("otherId", otherUserId);
		mav.addObject("userId", userId);
		mav.addObject("chatId", chatId);
		mav.addObject("fromId", fromId);
		mav.addObject("pastMessages", pastMessages);
		mav.setViewName("chat/chat");

		return mav;
	}


	@MessageMapping("/chat.sendMessage")
	@SendTo("/topic/public")
	public ChatMessage sendMessage(
			@Payload ChatMessage chatMessage
	) {
		return chatMessage;
	}

	@MessageMapping("/chat/private/{userId}")
	@SendTo("/topic/private/{userId}")
	public MessageVO sendPrivateMessage(MessageVO vo, @DestinationVariable String userId) {
		// Logic for sending a message in a private chat
		// Save the chat message to the database, set additional attributes, etc.

		return vo;
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