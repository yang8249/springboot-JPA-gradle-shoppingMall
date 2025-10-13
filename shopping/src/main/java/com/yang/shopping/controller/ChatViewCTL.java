package com.yang.shopping.controller;

// package com.example.MultiGreenMaster.controller;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yang.shopping.model.Users;
import com.yang.shopping.repository.UserRepository;

@Controller
@RequiredArgsConstructor
public class ChatViewCTL {


    private final UserRepository userRepository;
    
    @GetMapping("/chat")
    public String chat(@SessionAttribute(name="userId", required = false) int userId, Model model) {
    	
    	System.out.println("chat 진입 ");
    	Users userDetails = userRepository.findById(userId)
                .orElseThrow();

        var me = userDetails;
        if (me == null) return "redirect:/login"; // 프로젝트 로그인 경로에 맞춰 수정
        model.addAttribute("nickname", me.getName());
        return "chat/chat";
    }
}
