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
        List<ChatRoomVO> chatRooms = chatMapper.getCurrentUserChatRooms(pvo, userId);
        for (ChatRoomVO chatRoom : chatRooms) {
            int unreadCount;
            if(chatRoom.getFrom_id().equals(userId)){
                unreadCount = chatMapper.countUnreadMessages(chatRoom.getChat_id(),1);
            }else{
                unreadCount = chatMapper.countUnreadMessages(chatRoom.getChat_id(),0);
            }

            chatRoom.setNot_read(unreadCount);
        }
        return chatRooms;
    }

    public List<MessageVO> getMessagesByChatId(int chatId) {
        List<MessageVO> message = chatMapper.getMessagesByChatId(chatId);
        chatMapper.updateMessagesAsRead(chatId);
        return message;
    }

    public String getProfileImg(String userId) {
        return chatMapper.getProfileImg(userId);
    }

    public int saveMessage(MessageVO message) {
        chatMapper.insertMessage(message);
        chatMapper.insertLastMessage(message);
        return message.getMsg_id();
    }
}