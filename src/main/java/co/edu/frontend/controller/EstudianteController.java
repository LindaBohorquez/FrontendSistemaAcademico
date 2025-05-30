package co.edu.frontend.controller;

import co.edu.frontend.DTO.EstudianteDTO;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/estudiantes")
public class EstudianteController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    public EstudianteController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String listarEstudiantes(Model model, HttpSession session) {
        LoginResponse usuario = (LoginResponse) session.getAttribute("usuario");
        if (usuario == null) {
            return "redirect:/login";
        }

        String token = usuario.getToken();
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(token);  // Authorization: Bearer <token>
        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        try {
            ResponseEntity<EstudianteDTO[]> response = restTemplate.exchange(
                backendUrl + "/estudiantes",  // El endpoint protegido del backend
                HttpMethod.GET,
                requestEntity,
                EstudianteDTO[].class
            );

            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                List<EstudianteDTO> estudiantes = Arrays.asList(response.getBody());
                model.addAttribute("estudiantes", estudiantes);
            } else {
                model.addAttribute("error", "No se pudo obtener la lista de estudiantes");
            }

        } catch (Exception e) {
            model.addAttribute("error", "Error al obtener estudiantes: " + e.getMessage());
        }

        return "estudiantes";
    }
}
