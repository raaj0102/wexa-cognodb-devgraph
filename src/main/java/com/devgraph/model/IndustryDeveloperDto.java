package com.devgraph.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@Getter
@AllArgsConstructor
public class IndustryDeveloperDto {

    private final String id;
    private final String name;
    private final String email;
    private final int experienceYears;
    private final String location;
    private final List<String> projects;
    private final List<String> companies;
}
