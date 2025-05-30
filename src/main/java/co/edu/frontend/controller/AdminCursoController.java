package co.edu.frontend.controller;

import co.edu.frontend.DTO.AsignaturaDTO;
import co.edu.frontend.DTO.MateriaDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/adminCurso")
@RequiredArgsConstructor
public class AdminCursoController {

    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    @GetMapping
    public String vistaAdminCursos(Model model,
                                   @RequestParam(required = false) Long materiaId,
                                   @RequestParam(required = false) Long asignaturaId) {

        MateriaDTO[] materias = restTemplate.getForObject(backendUrl + "/materias", MateriaDTO[].class);
        AsignaturaDTO[] asignaturas = restTemplate.getForObject(backendUrl + "/asignaturas", AsignaturaDTO[].class);

        MateriaDTO materia = materiaId != null
                ? restTemplate.getForObject(backendUrl + "/materias/" + materiaId, MateriaDTO.class)
                : new MateriaDTO();

        AsignaturaDTO asignatura = asignaturaId != null
                ? restTemplate.getForObject(backendUrl + "/asignaturas/" + asignaturaId, AsignaturaDTO.class)
                : new AsignaturaDTO();

        model.addAttribute("materias", materias);
        model.addAttribute("asignaturas", asignaturas);
        model.addAttribute("materia", materia);
        model.addAttribute("asignatura", asignatura);
        return "adminCursos";
    }

    @PostMapping("/materia/guardar")
    public String guardarMateria(@ModelAttribute MateriaDTO materia) {
        if (materia.getId() == null) {
            restTemplate.postForObject(backendUrl + "/materias", materia, MateriaDTO.class);
        } else {
            restTemplate.put(backendUrl + "/materias/" + materia.getId(), materia);
        }
        return "redirect:/admin/cursos";
    }

    @PostMapping("/asignatura/guardar")
    public String guardarAsignatura(@ModelAttribute AsignaturaDTO asignatura) {
        if (asignatura.getId() == null) {
            restTemplate.postForObject(backendUrl + "/asignaturas", asignatura, AsignaturaDTO.class);
        } else {
            restTemplate.put(backendUrl + "/asignaturas/" + asignatura.getId(), asignatura);
        }
        return "redirect:/admin/cursos";
    }

    @PostMapping("/materia/eliminar")
    public String eliminarMateria(@RequestParam Long id) {
        restTemplate.delete(backendUrl + "/materias/" + id);
        return "redirect:/admin/cursos";
    }

    @PostMapping("/asignatura/eliminar")
    public String eliminarAsignatura(@RequestParam Long id) {
        restTemplate.delete(backendUrl + "/asignaturas/" + id);
        return "redirect:/admin/cursos";
    }
}
