package co.edu.frontend.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReporteReservaEstadoDTO {
    private String nombreRecurso;
    private String tipoRecurso;
    private String estado;
}