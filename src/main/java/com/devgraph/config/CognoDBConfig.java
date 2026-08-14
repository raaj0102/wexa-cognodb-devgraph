package com.devgraph.config;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CognoDBConfig {

    private final CognoDBProperties properties;

    public CognoDBConfig(CognoDBProperties properties) {
        this.properties = properties;
    }

    @Bean(destroyMethod = "close")
    public Driver neo4jDriver() {
        return GraphDatabase.driver(
                properties.getUri(),
                AuthTokens.basic(properties.getUsername(), properties.getPassword())
        );
    }
}
