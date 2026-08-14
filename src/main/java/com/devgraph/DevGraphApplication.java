package com.devgraph;

import com.devgraph.config.CognoDBProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties(CognoDBProperties.class)
public class DevGraphApplication {

    public static void main(String[] args) {
        SpringApplication.run(DevGraphApplication.class, args);
    }
}
