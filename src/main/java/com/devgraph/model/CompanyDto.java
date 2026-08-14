package com.devgraph.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CompanyDto {

    private final String id;
    private final String name;
    private final String industry;
    private final String location;
}
