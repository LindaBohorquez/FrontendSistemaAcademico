package co.edu.frontend.DTO;

import lombok.Data;

import java.util.Date;

@Data
public class ChatDTO {

    private Long id;
    private Date fechaCreacion;

    private Long participante1Id;
    private String nombreParticipante1;

    private Long participante2Id;
    private String nombreParticipante2;
}
