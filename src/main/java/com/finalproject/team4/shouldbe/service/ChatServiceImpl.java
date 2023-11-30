package com.finalproject.team4.shouldbe.service;

import com.finalproject.team4.shouldbe.mapper.ChatMapper;
import com.finalproject.team4.shouldbe.vo.MessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    ChatMapper chatMapper;

    @Override
    public void saveMessage(MessageVO message) {

        chatMapper.insertMessage(message);
    }
}
