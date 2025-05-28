package co.edu.frontend.DTO;

import lombok.Data;

@Data
public class ExamenDTO {
    private Long id;
    private String tipo;
    private Long claseId;
    private String claseNombre;
}
