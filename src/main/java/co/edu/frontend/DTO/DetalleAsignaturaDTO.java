package co.edu.frontend.DTO;

import lombok.Data;

@Data
public class DetalleAsignaturaDTO {
    private Long asignaturaId;
    private String asignaturaNombre; // <-- debe coincidir con el JSON del backend
    private float nota;
    private String estado;
    private String periodo;
}
