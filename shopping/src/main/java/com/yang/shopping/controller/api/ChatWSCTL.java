package com.yang.shopping.controller.api;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import com.yang.shopping.dto.ChatMessageDTO;
import com.yang.shopping.service.ChatSRV;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
public class ChatWSCTL {

    private final ChatSRV chatSRV;
    private final SimpMessagingTemplate messagingTemplate;

    // 클라이언트가 /app/chat.send 로 메시지 전송
    @MessageMapping("/chat.send")
    public void receiveAndBroadcast(ChatMessageDTO in, SimpMessageHeaderAccessor accessor) {
        // HttpSession에서 복사된 userId 사용
        Map<String, Object> attrs = accessor.getSessionAttributes();
        Integer userId = (attrs != null) ? (int) attrs.get("userId") : null;

        if (userId == null) {
            log.warn("Unauthorized chat message rejected (no userId in session).");
            return; // 로그인 안 된 사용자는 무시
        }

        String roomId = (in.getRoomId() == null || in.getRoomId().isBlank()) ? "global" : in.getRoomId();
        ChatMessageDTO saved = chatSRV.saveMessage(userId, roomId, in.getContent());
        if (saved == null) return;

        // /topic/chat.global 등으로 브로드캐스트
        messagingTemplate.convertAndSend("/topic/chat." + roomId, saved);
    }

    // 초기 메시지 히스토리 로드용 REST
    @GetMapping("/api/chat/history")
    public List<ChatMessageDTO> history(@RequestParam(defaultValue = "global") String roomId) {
        return chatSRV.getRecentMessages(roomId);
    }
}
