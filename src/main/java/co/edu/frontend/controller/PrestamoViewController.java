package co.edu.frontend.controller;

import co.edu.frontend.DTO.PrestamoMaterialDTO;
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
@RequestMapping("/frontend/prestamos")
public class PrestamoViewController {
    private final RestTemplate restTemplate;
    @Value("${backend.url}")
    private String backendUrl;
    public PrestamoViewController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String listarPrestamos(Model model) {
        ResponseEntity<PrestamoMaterialDTO[]> res = restTemplate.getForEntity(backendUrl + "/prestamos-material", PrestamoMaterialDTO[].class);
        ResponseEntity<RecursoAcademicoDTO[]> rec = restTemplate.getForEntity(backendUrl + "/recursos-academicos", RecursoAcademicoDTO[].class);
        model.addAttribute("prestamos", Arrays.asList(res.getBody()));
        model.addAttribute("recursos", Arrays.asList(rec.getBody()));
        model.addAttribute("prestamo", new PrestamoMaterialDTO());
        return "prestamos";
    }

    @PostMapping("/guardar")
    public String guardar(@ModelAttribute PrestamoMaterialDTO prestamo) {
        restTemplate.postForEntity(backendUrl + "/prestamos-material", prestamo, PrestamoMaterialDTO.class);
        return "redirect:/frontend/prestamos";
    }

    @GetMapping("/devolver/{id}")
    public String devolver(@PathVariable Long id) {
        restTemplate.put(backendUrl + "/prestamos-material/" + id + "/devolver", null);
        return "redirect:/frontend/prestamos";
    }

    @GetMapping("/mantenimiento/{id}")
    public String mantenimiento(@PathVariable Long id) {
        restTemplate.put(backendUrl + "/prestamos-material/" + id + "/mantenimiento", null);
        return "redirect:/frontend/prestamos";
    }
}