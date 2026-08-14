package com.devgraph.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@Getter
@AllArgsConstructor
public class DeveloperDetail {

    private final String id;
    private final String name;
    private final String email;
    private final int experienceYears;
    private final String location;
    private final List<SkillDto> skills;
    private final List<ProjectDto> projects;
    private final List<CompanyDto> companies;
}
