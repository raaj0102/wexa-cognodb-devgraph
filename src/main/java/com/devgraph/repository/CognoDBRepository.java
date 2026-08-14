package com.devgraph.repository;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Session;
import org.neo4j.driver.Values;
import org.springframework.stereotype.Repository;

@Repository
public class CognoDBRepository {

    private static final String CONNECTION_TEST_QUERY =
            "RETURN $message AS message";

    private final Driver driver;

    public CognoDBRepository(Driver driver) {
        this.driver = driver;
    }

    public String testConnection() {
        try (Session session = driver.session()) {
            return session.run(
                            CONNECTION_TEST_QUERY,
                            Values.parameters("message", "CognoDB Connected!")
                    )
                    .single()
                    .get("message")
                    .asString();
        }
    }
}
