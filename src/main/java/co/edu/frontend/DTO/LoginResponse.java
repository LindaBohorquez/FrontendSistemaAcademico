package co.edu.frontend.DTO;

import lombok.Data;

@Data
public class LoginResponse {
    private String token;
    public LoginResponse(String token) {
        this.token = token;
    }
    public String getToken() { return token; }
}
