package co.edu.frontend.DTO;

import co.edu.ufps.SistemaAcademicoUFPSBackend.model.Asistencia;
import co.edu.ufps.SistemaAcademicoUFPSBackend.model.EstadoAsistencia;
import lombok.Data;

@Data
public class AsistenciaDTO {

    private Long id;
    private Long estudianteId;
    private String nombreEstudiante;
    private Long claseId;
    private String nombreClase;
    private EstadoAsistencia estado;

    public AsistenciaDTO(Asistencia asistencia) {
        this.id = asistencia.getId();
        this.estudianteId = asistencia.getEstudiante().getId();
        this.nombreEstudiante = asistencia.getEstudiante().getPersona().getNombre();
        this.claseId = asistencia.getClase().getId();
        this.nombreClase = asistencia.getClase().getNombre();
        this.estado = asistencia.getEstado();
    }
}
