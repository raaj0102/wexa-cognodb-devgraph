package com.devgraph.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DeveloperSummary {

    private final String id;
    private final String name;
    private final String email;
    private final int experienceYears;
    private final String location;
}
