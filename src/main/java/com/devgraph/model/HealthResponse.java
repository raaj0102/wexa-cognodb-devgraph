package com.devgraph.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class HealthResponse {

    private final String status;
    private final String database;
    private final String message;

    public static HealthResponse up(String message) {
        return new HealthResponse("UP", "CONNECTED", message);
    }

    public static HealthResponse down(String message) {
        return new HealthResponse("DOWN", "DISCONNECTED", message);
    }
}
