package com.yang.shopping.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yang.shopping.dto.ChatMessageDTO;
import com.yang.shopping.model.RoleType;
import com.yang.shopping.model.Users;
import com.yang.shopping.repository.UserRepository;
import com.yang.shopping.service.InquiryChatSRV;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class InquiryViewCTL {

    private final InquiryChatSRV inquiryChatSRV;
    private final UserRepository userRepository;
    

    // 고객: 자신의 문의방(새 창으로 열기 용)
    @GetMapping("/inquiry")
    public String myInquiry(@SessionAttribute(name="userId", required=false) Integer userId, Model model) {
        if (userId == null) return "redirect:/session-login";
        inquiryChatSRV.ensureRoomForUser(userId);
        model.addAttribute("roomId", "inq-" + userId);
        return "inquiry/room"; // templates/inquiry/room.mustache
    }

    @GetMapping("/inquiry/room")
    public String openRoom(@RequestParam String roomId,
                           @SessionAttribute(name="userId", required=false) int userId,
                           Model model) {
    	Users userDetails = userRepository.findById(userId)
                .orElseThrow();

        var me = userDetails;
        if (me == null) return "redirect:/session-login";

        boolean admin = me.getRole() == RoleType.ADMIN;
        if (!admin) {
            // 일반유저는 자신의 방만
            if (!roomId.equals("inq-" + me.getId())) return "redirect:/";
        }
        model.addAttribute("roomId", roomId);
        return "inquiry/room";
    }



    // 관리자: 문의방 목록
    @GetMapping("/admin/inquiries")
    public String adminInquiryList(@SessionAttribute(name="userId", required=false) int userId, Model model) {

    	Users userDetails = userRepository.findById(userId)
                .orElseThrow();

        var me = userDetails;
        if (me == null || me.getRole() != RoleType.ADMIN) return "redirect:/";
        model.addAttribute("rooms", inquiryChatSRV.listRoomsForAdmin());
        return "inquiry/admin_list"; // templates/inquiry/admin_list.mustache
    }

    // REST: 특정 방 히스토리
    @ResponseBody
    @GetMapping("/api/inquiry/history")
    public List<ChatMessageDTO> history(@RequestParam String roomId,
                                        @SessionAttribute(name="userId", required=false) int userId) {

        // 권한 체크
    	Users userDetails = userRepository.findById(userId)
                .orElseThrow();

        var me = userDetails;
        if (me == null) return List.of();
        boolean admin = me.getRole() == RoleType.ADMIN;
        if (!admin && !roomId.equals("inq-" + me.getId())) return List.of();

        return inquiryChatSRV.history(roomId);
    }
}
