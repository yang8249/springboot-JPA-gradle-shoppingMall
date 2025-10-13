package com.yang.shopping.dto;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ChatMessageDTO {
    // 클라이언트 <-> 서버 교환용
    private String roomId;      // "global" 같은 고정값 사용 가능
    private String senderNick;  // 서버에서 채워주어 브로드캐스트
    private String content;
    private String sentAt;      // ISO 문자열로 내려주기
}