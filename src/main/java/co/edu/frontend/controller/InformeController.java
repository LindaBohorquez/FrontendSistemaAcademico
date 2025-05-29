package co.edu.frontend.controller;

import co.edu.frontend.DTO.InformeAcademicoDTO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/informes")
public class InformeController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    public InformeController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping
    public String mostrarFormulario() {
        return "informe-estudiante";
    }

    @PostMapping("/consultar")
    public String consultarInforme(@RequestParam Long estudianteId, Model model) {
        String url = backendUrl + "/historiales/informe/estudiante/" + estudianteId;
        InformeAcademicoDTO informe = restTemplate.getForObject(url, InformeAcademicoDTO.class);
        model.addAttribute("informe", informe);
        return "informe-estudiante";
    }

    @GetMapping("/pdf/{id}")
    public ResponseEntity<ByteArrayResource> descargarPDF(@PathVariable Long id) {
        String url = backendUrl + "/historiales/informe/estudiante/" + id + "/pdf";
        ResponseEntity<byte[]> response = restTemplate.getForEntity(url, byte[].class);

        ByteArrayResource resource = new ByteArrayResource(response.getBody());

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=informe_estudiante_" + id + ".pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(resource);
    }
}
