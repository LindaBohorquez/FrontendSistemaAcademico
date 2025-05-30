package co.edu.frontend.controller;

import co.edu.frontend.DTO.AsignaturaEstudianteDTO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/calificaciones")
public class CalificacionController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    public CalificacionController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String listar(Model model) {
        AsignaturaEstudianteDTO[] calificaciones = restTemplate.getForObject(
                backendUrl + "/asignaturaestudiante", AsignaturaEstudianteDTO[].class
        );
        model.addAttribute("calificaciones", calificaciones);
        return "calificaciones"; // calificaciones.jsp
    }

    @PostMapping("/guardar")
    public String guardar(@RequestParam(required = false) Long id,
                          @RequestParam Long estudianteId,
                          @RequestParam Long asignaturaId,
                          @RequestParam float primerPrevio,
                          @RequestParam float segundoPrevio,
                          @RequestParam float tercerPrevio,
                          @RequestParam float examenFinal,
                          @RequestParam(required = false) boolean habilitacion,
                          @RequestParam(required = false) boolean vacacional) {

        AsignaturaEstudianteDTO dto = new AsignaturaEstudianteDTO();
        dto.setId(id);
        dto.setEstudianteId(estudianteId);
        dto.setAsignaturaId(asignaturaId);
        dto.setPrimerPrevio(primerPrevio);
        dto.setSegundoPrevio(segundoPrevio);
        dto.setTercerPrevio(tercerPrevio);
        dto.setExamenFinal(examenFinal);
        dto.setHabilitacion(habilitacion);
        dto.setVacacional(vacacional);

        if (id != null) {
            restTemplate.put(backendUrl + "/asignaturaestudiante/" + id, dto);
        } else {
            restTemplate.postForObject(backendUrl + "/asignaturaestudiante", dto, Void.class);
        }

        return "redirect:/calificaciones";
    }
}
