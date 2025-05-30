package co.edu.frontend.DTO;

import lombok.Data;
import java.time.LocalTime;

@Data

public class HorarioDTO {
    private Long id;
    private String dia;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private Long asignaturaId; // Solo el ID para no exponer toda la entidad Asignatura
}
