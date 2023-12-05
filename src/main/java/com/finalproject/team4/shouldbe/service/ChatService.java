package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.ChatMapper;
import com.finalproject.team4.shouldbe.vo.ChatRoomVO;
import com.finalproject.team4.shouldbe.vo.MessageVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
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
            if (chatRoom.getFrom_id().equals(userId)) {
                unreadCount = chatMapper.countUnreadMessages(chatRoom.getChat_id(), 1);
            } else {
                unreadCount = chatMapper.countUnreadMessages(chatRoom.getChat_id(), 0);
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

    public int totalPartnerRecord(String userId) {
        return chatMapper.countUserPartner(userId);
    }

    public List<UserVO> getPartnerById(PagingVO pvo, String userId) {
        return chatMapper.getUserPartnerList(pvo, userId);
    }
}