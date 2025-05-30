package co.edu.frontend.DTO;

import lombok.Data;

import java.util.Date;

@Data
public class MensajeDTO {
    private Long id;
    private String contenido;
    private Date fechaEnvio; // CAMPO CORREGIDO

    private boolean editado;
    private String estado;

    private Long chatId;

    private Long emisorId;
    private String nombreEmisor;

    private Long destinatarioId;
    private String nombreDestinatario;
}
