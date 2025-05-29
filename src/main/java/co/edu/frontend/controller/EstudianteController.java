package co.edu.frontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.client.RestTemplate;
import co.edu.frontend.DTO.EstudianteDTO;

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
    public String listarEstudiantes(Model model) {
        EstudianteDTO[] estudiantes = restTemplate.getForObject(
            backendUrl + "/estudiantes",
            EstudianteDTO[].class
        );
        model.addAttribute("estudiantes", estudiantes);
        return "estudiantes"; // apunta a estudiantes.jsp
    }
}
