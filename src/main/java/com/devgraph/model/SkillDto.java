package com.devgraph.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class SkillDto {

    private final String id;
    private final String name;
    private final String category;
}
