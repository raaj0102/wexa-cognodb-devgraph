package com.devgraph.service;

import com.devgraph.model.HealthResponse;
import com.devgraph.repository.CognoDBRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class CognoDBService {

    private static final Logger log = LoggerFactory.getLogger(CognoDBService.class);

    private final CognoDBRepository repository;

    public CognoDBService(CognoDBRepository repository) {
        this.repository = repository;
    }

    public HealthResponse checkHealth() {
        try {
            String message = repository.testConnection();
            return HealthResponse.up(message);
        } catch (Exception ex) {
            log.error("CognoDB health check failed", ex);
            return HealthResponse.down("Unable to connect to CognoDB");
        }
    }
}
