package com.yang.shopping.config;

// package com.example.MultiGreenMaster.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    // 클라이언트 연결 엔드포인트: /ws (SockJS 허용)
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
                .addInterceptors(new HttpSessionHandshakeInterceptor()) // HttpSession attrs -> WS 세션으로 복사
                .setAllowedOriginPatterns("*")
                .withSockJS();
    }

    // 메시지 라우팅 설정
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/topic");   // 구독 경로
        registry.setApplicationDestinationPrefixes("/app"); // 발행 경로 프리픽스
    }
}
