package com.yang.shopping.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.dto.ChatMessageDTO;
import com.yang.shopping.model.ChatMessageENT;
import com.yang.shopping.model.ChatRoomENT;
import com.yang.shopping.model.Users;
import com.yang.shopping.repository.ChatMessageREP;
import com.yang.shopping.repository.ChatRoomREP;
import com.yang.shopping.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class InquiryChatSRV {
    private final ChatMessageREP msgRep;
    private final UserRepository userRep;
    private final ChatRoomREP roomRep;

    // 고객 방 생성 or 반환
    public ChatRoomENT
    ensureRoomForUser(Integer userId) {
        String roomId = "inq-" + userId;
        return roomRep.findById(roomId).orElseGet(() -> {
            Users user = userRep.findById(userId).orElseThrow();
            ChatRoomENT r = ChatRoomENT.builder()
                    .id(roomId).user(user)
                    .lastMessageAt(null)
                    .lastMessagePreview(null)
                    .hasUnansweredByAdmin(false)
                    .build();
            return roomRep.save(r);
        });
    }

    public ChatMessageDTO saveMessage(Integer senderId, String roomId, String content, boolean senderIsAdmin) {
        Users sender = userRep.findById(senderId).orElseThrow();
        ChatMessageENT saved = msgRep.save(ChatMessageENT.builder()
                .roomId(roomId)
                .sender(sender)
                .content(content)
                .sentAt(LocalDateTime.now())
                .build());

        // 방 메타 갱신
        ChatRoomENT room = roomRep.findById(roomId).orElseGet(() -> ensureRoomForUser(parseUserId(roomId)));
        room.setLastMessageAt(saved.getSentAt());
        room.setLastMessagePreview(content.length() > 50 ? content.substring(0, 50) : content);
        // 고객이 보냈으면 관리자 미응답 = true, 관리자가 보냈으면 false
        room.setHasUnansweredByAdmin(!senderIsAdmin);
        roomRep.save(room);

        return ChatMessageDTO.builder()
                .roomId(roomId)
                .senderNick(sender.getName())
                .content(content)
                .sentAt(saved.getSentAt().toString())
                .build();
    }

    public List<ChatMessageDTO> history(String roomId) {
        return msgRep.findTop50ByRoomIdOrderByIdDesc(roomId).stream()
                .sorted(Comparator.comparingLong(ChatMessageENT::getId))
                .map(m -> ChatMessageDTO.builder()
                        .roomId(roomId)
                        .senderNick(m.getSender() != null ? m.getSender().getName() : "unknown")
                        .content(m.getContent())
                        .sentAt(m.getSentAt().toString())
                        .build())
                .toList();
    }


    public List<ChatRoomENT> listRoomsForAdmin() {
        return roomRep.findAllByOrderByLastMessageAtDesc();
    }

    private Integer parseUserId(String roomId) {
        // "inq-123" -> 123
        return Integer.valueOf(roomId.substring(4));
    }
}

