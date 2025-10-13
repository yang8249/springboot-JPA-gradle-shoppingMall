package com.yang.shopping.service;

// package com.example.MultiGreenMaster.service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.dto.ChatMessageDTO;
import com.yang.shopping.model.ChatMessageENT;
import com.yang.shopping.model.Users;
import com.yang.shopping.repository.ChatMessageREP;
import com.yang.shopping.repository.UserRepository;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@RequiredArgsConstructor
public class ChatSRV {

    private final ChatMessageREP chatMessageREP;
    private final UserRepository userREP;

    private static final DateTimeFormatter ISO = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

    public ChatMessageDTO saveMessage(Integer senderId, String roomId, String content) {
        Users sender = userREP.findById(senderId).orElse(null);
        if (sender == null) return null;

        ChatMessageENT saved = chatMessageREP.save(
                ChatMessageENT.builder()
                        .roomId(roomId)
                        .sender(sender)
                        .content(content)
                        .sentAt(LocalDateTime.now())
                        .build()
        );

        return ChatMessageDTO.builder()
                .roomId(saved.getRoomId())
                .senderNick(sender.getName())
                .content(saved.getContent())
                .sentAt(saved.getSentAt().format(ISO))
                .build();
    }

    // 최근 50개 불러오기 (초기 로딩)
    @Transactional(readOnly = true)
    public List<ChatMessageDTO> getRecentMessages(String roomId) {
        return chatMessageREP.findTop50ByRoomIdOrderByIdDesc(roomId).stream()
                .sorted((a,b) -> a.getId().compareTo(b.getId())) // 오래된 → 최신 순으로 정렬해서 반환
                .map(m -> ChatMessageDTO.builder()
                        .roomId(m.getRoomId())
                        .senderNick(m.getSender() != null ? m.getSender().getName() : "unknown")
                        .content(m.getContent())
                        .sentAt(m.getSentAt().format(ISO))
                        .build())
                .collect(Collectors.toList());
    }
}
