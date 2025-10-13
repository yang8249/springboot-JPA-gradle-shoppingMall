package com.yang.shopping.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;


// ChatRoomENT (선택: 관리자 목록/정렬용 메타)
@Entity

@Table(name = "chat_room")
@Getter
@Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ChatRoomENT {
    @Id
    private String id; // roomId = "inq-{userId}"

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private Users user; // 문의한 고객

    private LocalDateTime lastMessageAt;
    private String lastMessagePreview;
    private boolean hasUnansweredByAdmin; // 관리자 미응답 표시
}
