package co.edu.frontend.controller;

import co.edu.frontend.DTO.AsignaturaDTO;
import co.edu.frontend.DTO.DocenteDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/asignaciones")
@RequiredArgsConstructor
public class AsignacionController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    @GetMapping
    public String verFormularioAsignacion(Model model) {
        AsignaturaDTO[] asignaturas = restTemplate.getForObject(backendUrl + "/asignaturas", AsignaturaDTO[].class);
        DocenteDTO[] docentes = restTemplate.getForObject(backendUrl + "/docentes", DocenteDTO[].class);

        model.addAttribute("asignaturas", asignaturas);
        model.addAttribute("docentes", docentes);

        return "asignacion"; // asignacion.jsp
    }

    @PostMapping("/asignar")
    public String asignarDocente(@RequestParam Long asignaturaId, @RequestParam Long docenteId) {
        String url = backendUrl + "/asignaturas/" + asignaturaId + "/docente";

        Map<String, Long> requestBody = new HashMap<>();
        requestBody.put("id", docenteId);

        restTemplate.patchForObject(url, requestBody, Void.class);

        return "redirect:/asignaciones";
    }
}
