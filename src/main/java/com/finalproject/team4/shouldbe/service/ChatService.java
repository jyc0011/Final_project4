package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.ChatMapper;
import com.finalproject.team4.shouldbe.util.EncryptUtil;
import com.finalproject.team4.shouldbe.vo.ChatRoomVO;
import com.finalproject.team4.shouldbe.vo.MessageVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.KeyPair;
import java.util.List;

@Service
public class ChatService {

    @Autowired
    ChatMapper chatMapper;

    public int totalRecord(String userId) {
        return chatMapper.countUserChatRooms(userId);
    }

    public List<ChatRoomVO> getCurrentUserChatRooms(PagingVO pvo, String userId) throws Exception {
        List<ChatRoomVO> chatRooms = chatMapper.getCurrentUserChatRooms(pvo, userId);
        for (ChatRoomVO chatRoom : chatRooms) {
            String sharedKey = chatMapper.getSharedKey(chatRoom.getChat_id(), userId);
            String decryptedContent = EncryptUtil.decryptAES(chatRoom.getLast_content(), sharedKey);
            chatRoom.setLast_content(decryptedContent);
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


    public List<MessageVO> getMessagesByChatId(int chatId, String userId) throws Exception {
        List<MessageVO> messages = chatMapper.getMessagesByChatId(chatId);
        String sharedKey = chatMapper.getSharedKey(chatId, userId);
        for (MessageVO message : messages) {
            String decryptedContent = EncryptUtil.decryptAES(message.getContent(), sharedKey);
            message.setContent(decryptedContent);
        }
        chatMapper.updateMessagesAsRead(chatId);
        return messages;
    }


    public String getProfileImg(String userId) {
        return chatMapper.getProfileImg(userId);
    }

    public int saveMessage(MessageVO message) throws Exception {
        String sharedKey = chatMapper.getSharedKey(message.getChat_id(), message.getSender());
        String encryptedContent = EncryptUtil.encryptAES(message.getContent(), sharedKey);
        message.setContent(encryptedContent);
        chatMapper.insertMessage(message);
        chatMapper.insertLastMessage(message);
        String decryptedContent = EncryptUtil.decryptAES(message.getContent(), sharedKey);
        message.setContent(decryptedContent);
        return message.getMsg_id();
    }

    public int totalPartnerRecord(String userId) {
        return chatMapper.countUserPartner(userId);
    }

    public List<UserVO> getPartnerById(PagingVO pvo, String userId) {
        return chatMapper.getUserPartnerList(pvo, userId);
    }

    public int startChat(String currentUserId, String otherUserId) throws Exception {
        ChatRoomVO newChatRoom = new ChatRoomVO();
        newChatRoom.setFrom_id(currentUserId);
        newChatRoom.setTo_id(otherUserId);
        chatMapper.createChatRoom(newChatRoom);
        int chat_id=newChatRoom.getChat_id();
        KeyPair keyPairMe = EncryptUtil.generateKeyPair();
        KeyPair keyPairOther = EncryptUtil.generateKeyPair();
        String sharedKey = EncryptUtil.generateSharedKey(keyPairMe.getPrivate(), keyPairOther.getPublic());
        String encryptedContent = EncryptUtil.encryptAES("new chat", sharedKey);
        chatMapper.storeEncryptionKey(chat_id, currentUserId, sharedKey);
        chatMapper.storeEncryptionKey(chat_id, otherUserId, sharedKey);
        chatMapper.updateLastContent(chat_id, encryptedContent);
        return chat_id;
    }

    public void reportMessage(String userId, int msgId) throws Exception {
        MessageVO messageInfo = chatMapper.findMessageInfo(msgId);
        ChatRoomVO chatInfo=chatMapper.getChatByChatId(messageInfo.getChat_id());
        String senderUserId = messageInfo.getIs_from_id() == 1 ? chatInfo.getFrom_id() : chatInfo.getTo_id();
        chatMapper.reportMessage(senderUserId, msgId);
    }


    public void saveMessageToMypage(String userId, int msgId) throws Exception {
        chatMapper.saveMessageToMypage(userId, msgId);
    }
}