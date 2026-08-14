package com.devgraph.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@Getter
@AllArgsConstructor
public class SimilarDeveloperDto {

    private final String id;
    private final String name;
    private final List<String> sharedSkills;
    private final int sharedSkillCount;
}
