package com.finalproject.team4.shouldbe.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.TextMessage;

import java.util.HashMap;

@Component
public class SocketHandler extends TextWebSocketHandler {

	private HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); // 웹소켓 세션을 담아둘 맵

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		// 메시지 발송
		String payload = message.getPayload();
		String[] parts = payload.split(":", 2);
		String targetId = parts[0];
		String msg = parts[1];

		WebSocketSession targetSession = sessionMap.get(targetId);
		if (targetSession != null && targetSession.isOpen()) {
			try {
				targetSession.sendMessage(new TextMessage(msg));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 소켓 연결
		sessionMap.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 소켓 종료
		sessionMap.remove(session.getId());
	}
}
