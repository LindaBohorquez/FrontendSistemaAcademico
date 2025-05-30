package co.edu.frontend.DTO;

import lombok.Data;

import java.util.Date;

@Data
public class ComentarioDTO {

    private Long id;
    private String contenido;
    private Date fechaCreacion;

    private Long emisorId;
    private String nombreEmisor;

    private Long foroId;
    private String tituloForo;

}
