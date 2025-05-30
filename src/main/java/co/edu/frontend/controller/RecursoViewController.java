package co.edu.frontend.controller;

import co.edu.frontend.DTO.RecursoAcademicoDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Controller
@RequestMapping("/frontend/recursos")
public class RecursoViewController {
    private final RestTemplate restTemplate;
    @Value("${backend.url}")
    private String backendUrl;
    public RecursoViewController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String listarRecursos(Model model) {
        String url = backendUrl + "/recursos-academicos";
        ResponseEntity<RecursoAcademicoDTO[]> response = restTemplate.getForEntity(url, RecursoAcademicoDTO[].class);
        model.addAttribute("recursos", Arrays.asList(response.getBody()));
        return "recursos";
    }
}