package com.finalproject.team4.shouldbe.mapper;

import com.finalproject.team4.shouldbe.vo.ChatRoomVO;
import com.finalproject.team4.shouldbe.vo.MessageVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import com.finalproject.team4.shouldbe.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {

    List<ChatRoomVO> getCurrentUserChatRooms(PagingVO pvo, String userId);

    int countUnreadMessages(int chatId, int isFromId);

    int countUserChatRooms(String userId);

    List<MessageVO> getMessagesByChatId(int chatId);

    void updateMessagesAsRead(int chatId);

    String getProfileImg(String userId);

    void insertMessage(MessageVO message);

    void insertLastMessage(MessageVO message);

    int countUserPartner(String userId);

    List<UserVO> getUserPartnerList(PagingVO pvo, String userId);

    void createChatRoom(ChatRoomVO newChatRoom);

    void updateLastContent(int chatId, String last_content);

    void storeEncryptionKey(int chat_id, String user_id, String symmetric_key);

    String getSharedKey(int chatId, String userId);
}