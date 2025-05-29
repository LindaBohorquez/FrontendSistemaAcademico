package co.edu.frontend.DTO;

import lombok.Data;

import java.time.LocalDate;

@Data
public class EstudianteDTO {
    private Long id;
    private String becas;
    private String correoEstudiantil;
    private Short creditosAprobados;
    private String estado;
    private LocalDate fechaInscripcion;
    private Long personaId;
    private Long programaId;
}
