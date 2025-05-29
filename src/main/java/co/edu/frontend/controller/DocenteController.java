package co.edu.frontend.controller;

import co.edu.frontend.DTO.DocenteDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
@Controller
@RequestMapping("/docentes")
@RequiredArgsConstructor
public class DocenteController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    @GetMapping
    public String verVistaDocente(Model model) {
        DocenteDTO[] docentes = restTemplate.getForObject(backendUrl + "/docentes", DocenteDTO[].class);
        model.addAttribute("docentes", docentes);
        model.addAttribute("docente", new DocenteDTO()); // Formulario vacío por defecto
        return "docente"; // Unificada
    }

    @PostMapping("/guardar")
    public String guardarDocente(@ModelAttribute DocenteDTO docente) {
        if (docente.getId() == null) {
            restTemplate.postForObject(backendUrl + "/docentes", docente, DocenteDTO.class);
        } else {
            restTemplate.put(backendUrl + "/docentes/" + docente.getId(), docente);
        }
        return "redirect:/docentes";
    }

    @GetMapping("/editar/{id}")
    public String editarDocente(@PathVariable Long id, Model model) {
        DocenteDTO docente = restTemplate.getForObject(backendUrl + "/docentes/" + id, DocenteDTO.class);
        DocenteDTO[] docentes = restTemplate.getForObject(backendUrl + "/docentes", DocenteDTO[].class);
        model.addAttribute("docentes", docentes);
        model.addAttribute("docente", docente); // Carga datos al form
        return "docente";
    }
}
