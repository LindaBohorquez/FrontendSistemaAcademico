package co.edu.frontend.DTO;

import java.util.Date;
import java.util.List;

public class PrestamoMaterialDTO {
    private Long id;
    private Date fechaPrestamo;
    private Date fechaDevolucionEstimada;
    private Date fechaDevolucionReal;
    private String estado;
    private RecursoAcademicoDTO recurso;
    private PersonaDTO solicitante;
    // Getters y setters
}
