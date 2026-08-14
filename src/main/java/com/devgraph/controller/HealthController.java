package com.devgraph.controller;

import com.devgraph.model.HealthResponse;
import com.devgraph.service.CognoDBService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HealthController {

    private final CognoDBService cognoDBService;

    public HealthController(CognoDBService cognoDBService) {
        this.cognoDBService = cognoDBService;
    }

    @GetMapping("/health")
    public ResponseEntity<HealthResponse> health() {
        HealthResponse response = cognoDBService.checkHealth();

        if ("UP".equals(response.getStatus())) {
            return ResponseEntity.ok(response);
        }

        return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body(response);
    }
}
