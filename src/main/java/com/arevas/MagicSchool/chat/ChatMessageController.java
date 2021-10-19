package com.arevas.MagicSchool.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class ChatMessageController {
 
    @MessageMapping("/chat")
    @SendTo("/app/university/chat")
    public Message getMessage(Message message) {
        return message;
    }
}