package com.devgraph.controller;

import com.devgraph.model.*;
import com.devgraph.service.DeveloperService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class DeveloperController {

    private final DeveloperService developerService;

    public DeveloperController(DeveloperService developerService) {
        this.developerService = developerService;
    }

    @GetMapping("/api/developers")
    public List<DeveloperSummary> getAllDevelopers() {
        return developerService.getAllDevelopers();
    }

    @GetMapping("/api/developers/search")
    public List<DeveloperSummary> searchBySkill(@RequestParam String skill) {
        return developerService.searchBySkill(skill);
    }

    @GetMapping("/api/developers/{id}")
    public DeveloperDetail getDeveloperById(@PathVariable String id) {
        return developerService.getDeveloperById(id);
    }

    @GetMapping("/api/developers/{id}/similar")
    public List<SimilarDeveloperDto> getSimilarDevelopers(@PathVariable String id) {
        return developerService.getSimilarDevelopers(id);
    }

    @GetMapping("/api/projects/search")
    public List<ProjectDto> searchProjectsBySkill(@RequestParam String skill) {
        return developerService.searchProjectsBySkill(skill);
    }

    @GetMapping("/api/explore/industry")
    public List<IndustryDeveloperDto> exploreByIndustry(@RequestParam String industry) {
        return developerService.exploreByIndustry(industry);
    }
}
