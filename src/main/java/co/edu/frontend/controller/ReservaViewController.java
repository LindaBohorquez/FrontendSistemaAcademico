package co.edu.frontend.controller;

import co.edu.frontend.DTO.ReservaRecursoDTO;
import co.edu.frontend.DTO.RecursoAcademicoDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Controller
@RequestMapping("/frontend/reservas")
public class ReservaViewController {
    private final RestTemplate restTemplate;
    @Value("${backend.url}")
    private String backendUrl;
    public ReservaViewController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String listarReservas(Model model) {
        ResponseEntity<ReservaRecursoDTO[]> res = restTemplate.getForEntity(backendUrl + "/reservas-recurso", ReservaRecursoDTO[].class);
        ResponseEntity<RecursoAcademicoDTO[]> rec = restTemplate.getForEntity(backendUrl + "/recursos-academicos", RecursoAcademicoDTO[].class);
        model.addAttribute("reservas", Arrays.asList(res.getBody()));
        model.addAttribute("recursos", Arrays.asList(rec.getBody()));
        model.addAttribute("reserva", new ReservaRecursoDTO());
        return "reservas";
    }

    @PostMapping("/guardar")
    public String guardar(@ModelAttribute ReservaRecursoDTO reserva) {
        restTemplate.postForEntity(backendUrl + "/reservas-recurso", reserva, ReservaRecursoDTO.class);
        return "redirect:/frontend/reservas";
    }
}
