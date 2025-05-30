package co.edu.frontend.DTO;

import lombok.Data;

import java.util.Date;

@Data
public class ClaseDTO {

    private Long id;
    private String nombre;
    private Date fecha;
    private String lugar;
    private String temaVisto;
    private short cupoMaximo;
    private short creditos;

    private String nombreAsignatura;
    private String nombreDocente;
    private String nombreSemestre;
}
