package co.edu.frontend.controller;

import co.edu.frontend.DTO.ChatDTO;
import co.edu.frontend.DTO.MensajeDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Controller
@RequestMapping("/mensajes")
public class ChatFrontendController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    public ChatFrontendController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String listarChats(HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("usuarioId");
        if (usuarioId == null) {
            usuarioId = 5L;
            session.setAttribute("usuarioId", usuarioId);
            session.setAttribute("usuarioNombre", "Jorge");
        }

        String url = backendUrl + "/chats/persona/" + usuarioId;
        ResponseEntity<ChatDTO[]> response = restTemplate.getForEntity(url, ChatDTO[].class);
        model.addAttribute("chats", Arrays.asList(response.getBody()));
        return "mensajes";
    }

    @PostMapping("/crear-chat")
    public String crearChat(@RequestParam Long destinatarioId, HttpSession session) {
        Long emisorId = (Long) session.getAttribute("usuarioId");
        if (emisorId == null) {
            emisorId = 5L;
            session.setAttribute("usuarioId", emisorId);
            session.setAttribute("usuarioNombre", "Jorge");
        }

        String url = backendUrl + "/chats/participantes?participante1Id=" + emisorId + "&participante2Id=" + destinatarioId;

        ChatDTO chatExistente = null;
        try {
            ResponseEntity<ChatDTO> response = restTemplate.getForEntity(url, ChatDTO.class);
            chatExistente = response.getBody();
        } catch (org.springframework.web.client.HttpClientErrorException.NotFound ex) {
            // No existe, se creará abajo
        }

        if (chatExistente == null) {
            String bodyJson = String.format(
                    "{\"participante1\":{\"id\":%d}, \"participante2\":{\"id\":%d}}",
                    emisorId, destinatarioId
            );

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<String> req = new HttpEntity<>(bodyJson, headers);

            restTemplate.postForEntity(backendUrl + "/chats", req, ChatDTO.class);
        }

        return "redirect:/mensajes";
    }

    @GetMapping("/chat/{chatId}")
    public String verChat(@PathVariable Long chatId, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("usuarioId");
        if (usuarioId == null) {
            usuarioId = 5L;
            session.setAttribute("usuarioId", usuarioId);
            session.setAttribute("usuarioNombre", "Jorge");
        }

        String msgUrl = backendUrl + "/chats/" + chatId + "/mensajes";
        ResponseEntity<MensajeDTO[]> response = restTemplate.getForEntity(msgUrl, MensajeDTO[].class);
        List<MensajeDTO> mensajes = Arrays.asList(response.getBody());

        Long finalUsuarioId = usuarioId;
        Long destinatarioId = mensajes.stream()
                .filter(m -> !m.getEmisorId().equals(finalUsuarioId))
                .map(MensajeDTO::getEmisorId)
                .findFirst()
                .orElse(null);

        // Si no hay mensajes, obtenemos el destinatario desde el chat
        if (destinatarioId == null) {
            String chatUrl = backendUrl + "/chats/" + chatId;
            ResponseEntity<ChatDTO> chatResponse = restTemplate.getForEntity(chatUrl, ChatDTO.class);
            ChatDTO chat = chatResponse.getBody();
            if (chat != null) {
                destinatarioId = chat.getParticipante1Id().equals(usuarioId)
                        ? chat.getParticipante2Id()
                        : chat.getParticipante1Id();
            }
        }

        model.addAttribute("chatId", chatId);
        model.addAttribute("mensajes", mensajes);
        model.addAttribute("destinatarioId", destinatarioId);

        return listarChats(session, model);
    }

    @PostMapping("/chat/{chatId}/enviar")
    public String enviarMensaje(@PathVariable Long chatId,
                                @RequestParam String contenido,
                                @RequestParam Long destinatarioId,
                                HttpSession session) {

        Long emisorId = (Long) session.getAttribute("usuarioId");
        if (emisorId == null) {
            emisorId = 5L;
            session.setAttribute("usuarioId", emisorId);
            session.setAttribute("usuarioNombre", "Jorge");
        }

        String url = backendUrl + "/chats/" + chatId + "/mensajes";

        Map<String, Object> body = new HashMap<>();
        Map<String, Object> emisor = Map.of("id", emisorId);
        Map<String, Object> destinatario = Map.of("id", destinatarioId);

        body.put("contenido", contenido);
        body.put("emisor", emisor);
        body.put("destinatario", destinatario);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> req = new HttpEntity<>(body, headers);

        restTemplate.postForEntity(url, req, MensajeDTO.class);

        return "redirect:/mensajes/chat/" + chatId;
    }
}
