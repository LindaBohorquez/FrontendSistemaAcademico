package co.edu.frontend.controller;

import co.edu.frontend.DTO.DocenteDTO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/docentes")
public class DocenteController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    public DocenteController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String listarDocentes(@RequestParam(required = false) Long id, Model model) {
        DocenteDTO[] docentes = restTemplate.getForObject(backendUrl + "/docentes", DocenteDTO[].class);
        model.addAttribute("docentes", docentes);

        DocenteDTO docente;
        if (id != null) {
            docente = restTemplate.getForObject(backendUrl + "/docentes/" + id, DocenteDTO.class);
        } else {
            docente = new DocenteDTO();
        }
        model.addAttribute("docente", docente);

        return "docente";
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
}
