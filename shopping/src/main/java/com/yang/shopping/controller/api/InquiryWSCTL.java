package com.yang.shopping.controller.api;

import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import com.yang.shopping.dto.ChatMessageDTO;
import com.yang.shopping.model.RoleType;
import com.yang.shopping.model.Users;
import com.yang.shopping.repository.UserRepository;
import com.yang.shopping.service.InquiryChatSRV;

import java.util.Map;

@RestController
@RequiredArgsConstructor
public class InquiryWSCTL {

    private final InquiryChatSRV inquiryChatSRV;
    private final SimpMessagingTemplate broker;
    private final UserRepository userRepository;

    @MessageMapping("/send")
    public void sendInquiry(ChatMessageDTO in, SimpMessageHeaderAccessor accessor) {
        var attrs = accessor.getSessionAttributes();
        Integer userId = (attrs != null) ? (Integer) attrs.get("userId") : null;
        if (userId == null) return;

        // 1) 관리자 여부 판정 (세션 → 실패 시 DB)
        boolean isAdmin = isAdminFromSession(attrs);
        if (!isAdmin) {
        	Users userDetails = userRepository.findById(userId)
                    .orElseThrow();

            var me = userDetails;
            isAdmin = (me != null && me.getRole() == RoleType.ADMIN);
        }

        // 2) roomId 확정 로직
        String roomId = in.getRoomId();
        if (isAdmin) {
            // 관리자는 반드시 roomId가 있어야 함
            if (roomId == null || roomId.isBlank()) {
                // 잘못된 요청: 무시
                return;
            }
        } else {
            // 일반유저는 자신의 방으로 강제
            roomId = "inq-" + userId;
        }

        // 3) 저장 및 브로드캐스트
        ChatMessageDTO saved = inquiryChatSRV.saveMessage(userId, roomId, in.getContent(), isAdmin);
        if (saved != null) {
            broker.convertAndSend("/topic/inq." + roomId, saved);
        }
    }

    private boolean isAdminFromSession(Map<String, Object> attrs) {
        if (attrs == null) return false;
        Object role = attrs.get("role");
        if (role instanceof Integer) return ((Integer) role) == 1;
        if (role instanceof String) return "ADMIN".equals(role) || "1".equals(role);
        Object userRole = attrs.get("userRole");
        if (userRole instanceof String) return "ADMIN".equals(userRole);
        return false;
    }
}
