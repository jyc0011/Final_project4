package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.*;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {

    @Autowired
    ChatMapper chatMapper;

    public int totalRecord(String userId) {
        return chatMapper.countUserChatRooms(userId);
    }
    public List<ChatRoomVO> getCurrentUserChatRooms(PagingVO pvo, String userId) {
        return chatMapper.getCurrentUserChatRooms(pvo, userId);
    }

    public List<MessageVO> getMessagesByChatId(int chatId) {
        return chatMapper.getMessagesByChatId(chatId);
    }

    public String getProfileImg(String userId) {
        return chatMapper.getProfileImg(userId);
    }
}