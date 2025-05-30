package co.edu.frontend.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import co.edu.frontend.DTO.PersonaDTO;
import co.edu.frontend.model.LoginRequest;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    private final RestTemplate restTemplate;

    @Value("${backend.url}")
    private String backendUrl;

    public LoginController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping("/login")
    public String mostrarFormularioLogin() {
        logger.info("Mostrando formulario login");
        return "login";
    }

    @PostMapping("/login")
    public String procesarLogin(
            @RequestParam("correo") String correo,
            @RequestParam("password") String contrasena,
            HttpSession session,
            Model model) {

        logger.info("Procesando login para correo: {}", correo);

        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setCorreo(correo);
        loginRequest.setContrasena(contrasena);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<LoginRequest> requestEntity = new HttpEntity<>(loginRequest, headers);

        try {
            ResponseEntity<LoginResponse> response = restTemplate.exchange(
                    backendUrl + "/auth/login",
                    HttpMethod.POST,
                    requestEntity,
                    LoginResponse.class);

            if (response.getStatusCode() == HttpStatus.OK) {
                LoginResponse loginResponse = response.getBody();

                // Guarda el usuario y el token en la sesión
                session.setAttribute("usuario", loginResponse);
                session.setAttribute("token", loginResponse.getToken());

                System.out.println("Token recibido y guardado en sesión: " + loginResponse.getToken());

                return "redirect:/dashboard";
            } else {
                logger.warn("Respuesta backend inesperada: {}", response.getStatusCode());
                model.addAttribute("error", "Respuesta inesperada del servidor");
            }

        } catch (HttpClientErrorException.Unauthorized e) {
            logger.warn("Error de autenticación: usuario o clave incorrectos");
            System.out.println("Error 401 - No autorizado: " + e.getMessage());
            model.addAttribute("error", "Usuario o clave incorrectos");

        } catch (HttpClientErrorException e) {
            logger.error("Error HTTP al contactar el backend", e);
            System.out.println("Error HTTP genérico: " + e.getStatusCode() + " - " + e.getResponseBodyAsString());
            model.addAttribute("error", "Error HTTP desde el servidor");

        } catch (Exception e) {
            logger.error("Error al contactar el microservicio backend", e);
            System.out.println("Excepción general: " + e.getMessage());
            model.addAttribute("error", "Error al contactar el microservicio");
        }

        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        LoginResponse user = (LoginResponse) session.getAttribute("usuario");
        if (user == null)
            return "redirect:/login";

        model.addAttribute("nombre", user.getNombre());
        model.addAttribute("rol", user.getRol());
        return "dashboard";
    }

    @GetMapping("/gestion-roles")
    public String mostrarGestionRoles(HttpSession session, Model model) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        logger.info("Entrando a mostrarGestionRoles");

        String token = (String) session.getAttribute("token");

        if (token == null) {
            logger.warn("Token no encontrado en sesión. Redirigiendo a login.");
            return "redirect:/login";
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(token);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            String url = backendUrl + "/personas";
            logger.info("Consultando personas desde URL: {}", url);

            ResponseEntity<PersonaDTO[]> response = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    PersonaDTO[].class);

            PersonaDTO[] personas = response.getBody();
            logger.info("Se obtuvieron {} personas", personas != null ? personas.length : 0);

            model.addAttribute("personas", Arrays.asList(personas));
            return "gestion_roles"; // Debe existir como gestion_roles.jsp en WEB-INF/views
        } catch (Exception e) {
            logger.error("Error al obtener la lista de personas", e);
            model.addAttribute("error", "No se pudo obtener la lista de personas.");
            return "dashboard";
        }
    }

    @PostMapping("/gestion-roles/cambiar-rol")
    public String cambiarRol(
            @RequestParam("personaId") Long personaId,
            @RequestParam("nuevoRol") Long nuevoRolId,
            HttpSession session,
            Model model) {

        Logger logger = LoggerFactory.getLogger(this.getClass());
        logger.info("Procesando cambio de rol para personaId={} a nuevoRol={}", personaId, nuevoRolId);

        String token = (String) session.getAttribute("token");

        if (token == null) {
            logger.warn("Token no encontrado en sesión. Redirigiendo a login.");
            return "redirect:/login";
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(token);
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Estructura de petición JSON
        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("personaId", personaId);
        requestBody.put("nuevoRolId", nuevoRolId);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

        try {
            String url = backendUrl + "/personas/" + personaId + "/cambiar-rol"; // <-- Endpoint esperado en el backend
            restTemplate.exchange(url, HttpMethod.PUT, entity, Void.class);
            logger.info("Rol actualizado exitosamente");
        } catch (Exception e) {
            logger.error("Error al actualizar el rol", e);
            model.addAttribute("error", "No se pudo actualizar el rol.");
        }

        return "redirect:/gestion-roles"; // Redirige para recargar lista
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
