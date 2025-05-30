package co.edu.frontend.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonaDTO {
    private Long id;
    private String nombre;
    private LocalDate fechaRegistro;
    private String tipoDocumento;
    private String numeroDocumento;
    private String direccion;
    private String telefono;
    private String correo;
    private LocalDate fechaNacimiento;
    private String estadoCivil;
    private String nacionalidad;
    private String datosProfesionales;
    private String genero;
    private String codigo;
    private Long rolId; // Solo el ID del rol asociado
}