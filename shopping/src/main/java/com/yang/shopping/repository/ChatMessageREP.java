package com.yang.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yang.shopping.model.ChatMessageENT;

import java.util.List;

public interface ChatMessageREP extends JpaRepository<ChatMessageENT, Integer> {
    List<ChatMessageENT> findTop50ByRoomIdOrderByIdDesc(String roomId);
    Long countByRoomIdAndIdGreaterThan(String roomId, Long lastSeenId);
    List<ChatMessageENT> findTop1ByRoomIdOrderByIdDesc(String roomId);
}