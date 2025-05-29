package co.edu.frontend.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AsignaturaEstudianteDTO {

    private Long id;
    private Long estudianteId;
    private Long asignaturaId;
    private float primerPrevio;
    private float segundoPrevio;
    private float tercerPrevio;
    private float examenFinal;
    private boolean habilitacion;
    private boolean vacacional;
    private float definitiva;

}
