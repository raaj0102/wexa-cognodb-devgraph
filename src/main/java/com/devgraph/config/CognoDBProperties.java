package com.devgraph.config;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

@Getter
@Setter
@Validated
@ConfigurationProperties(prefix = "cognodb")
public class CognoDBProperties {

    @NotBlank(message = "COGNODB_URI environment variable is required")
    private String uri;

    @NotBlank(message = "COGNODB_USERNAME environment variable is required")
    private String username;

    @NotBlank(message = "COGNODB_PASSWORD environment variable is required")
    private String password;
}
