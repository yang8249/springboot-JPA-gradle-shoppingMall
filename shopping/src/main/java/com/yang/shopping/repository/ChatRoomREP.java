package com.yang.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yang.shopping.model.ChatRoomENT;

import java.util.List;

public interface ChatRoomREP extends JpaRepository<ChatRoomENT, String> {
    List<ChatRoomENT> findAllByOrderByLastMessageAtDesc();
}
