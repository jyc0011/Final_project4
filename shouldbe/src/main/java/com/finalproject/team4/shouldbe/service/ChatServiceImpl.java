package com.finalproject.team4.shouldbe.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.finalproject.team4.shouldbe.mapper.ChatMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {

	private final ChatMapper chatMapper;
}
