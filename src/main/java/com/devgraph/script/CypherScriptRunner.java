package com.devgraph.script;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Session;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

/**
 * Utility to execute a Cypher script file against CognoDB.
 * Usage: java com.devgraph.script.CypherScriptRunner scripts/seed.cypher
 */
public class CypherScriptRunner {

    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.err.println("Usage: CypherScriptRunner <path-to-cypher-file>");
            System.exit(1);
        }

        String uri = requireEnv("COGNODB_URI");
        String username = requireEnv("COGNODB_USERNAME");
        String password = requireEnv("COGNODB_PASSWORD");

        String script = Files.readString(Path.of(args[0]), StandardCharsets.UTF_8);
        if (script.startsWith("\uFEFF")) {
            script = script.substring(1);
        }
        List<String> statements = parseStatements(script);

        try (Driver driver = GraphDatabase.driver(uri, AuthTokens.basic(username, password))) {
            try (Session session = driver.session()) {
                int executed = 0;
                for (String statement : statements) {
                    session.run(statement).consume();
                    executed++;
                }
                System.out.println("Executed " + executed + " Cypher statements from " + args[0]);
            }
        }
    }

    static List<String> parseStatements(String script) {
        StringBuilder cleaned = new StringBuilder();
        for (String line : script.split("\n")) {
            String trimmed = line.trim();
            if (trimmed.isEmpty() || trimmed.startsWith("//")) {
                continue;
            }
            cleaned.append(trimmed).append('\n');
        }

        List<String> statements = new ArrayList<>();
        for (String part : cleaned.toString().split(";")) {
            String statement = part.trim();
            if (!statement.isEmpty()) {
                statements.add(statement);
            }
        }
        return statements;
    }

    private static String requireEnv(String name) {
        String value = System.getenv(name);
        if (value == null || value.isBlank()) {
            System.err.println(name + " environment variable is required");
            System.exit(1);
        }
        return value;
    }
}
