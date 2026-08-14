package com.devgraph.service;

import com.devgraph.exception.ResourceNotFoundException;
import com.devgraph.model.*;
import com.devgraph.repository.DeveloperRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeveloperService {

    private final DeveloperRepository developerRepository;

    public DeveloperService(DeveloperRepository developerRepository) {
        this.developerRepository = developerRepository;
    }

    public List<DeveloperSummary> getAllDevelopers() {
        return developerRepository.findAll();
    }

    public DeveloperDetail getDeveloperById(String id) {
        return developerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Developer not found: " + id));
    }

    public List<DeveloperSummary> searchBySkill(String skill) {
        return developerRepository.findBySkill(skill);
    }

    public List<ProjectDto> searchProjectsBySkill(String skill) {
        return developerRepository.findProjectsBySkill(skill);
    }

    public List<IndustryDeveloperDto> exploreByIndustry(String industry) {
        return developerRepository.findByIndustry(industry);
    }

    public List<SimilarDeveloperDto> getSimilarDevelopers(String id) {
        if (!developerRepository.existsById(id)) {
            throw new ResourceNotFoundException("Developer not found: " + id);
        }
        return developerRepository.findSimilarDevelopers(id);
    }
}
