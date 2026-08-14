package com.devgraph.repository;

import com.devgraph.model.*;
import org.neo4j.driver.Driver;
import org.neo4j.driver.Record;
import org.neo4j.driver.Session;
import org.neo4j.driver.Values;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public class DeveloperRepository {

    private static final String FIND_ALL_DEVELOPERS = """
            MATCH (d:Developer)
            RETURN d.id AS id, d.name AS name, d.email AS email,
                   d.experienceYears AS experienceYears, d.location AS location
            ORDER BY d.name
            """;

    private static final String FIND_DEVELOPER_BY_ID = """
            MATCH (d:Developer {id: $developerId})
            OPTIONAL MATCH (d)-[:HAS_SKILL]->(s:Skill)
            OPTIONAL MATCH (d)-[:WORKED_ON]->(p:Project)
            OPTIONAL MATCH (d)-[:WORKED_AT]->(c:Company)
            RETURN d.id AS id, d.name AS name, d.email AS email,
                   d.experienceYears AS experienceYears, d.location AS location,
                   collect(DISTINCT {id: s.id, name: s.name, category: s.category}) AS skills,
                   collect(DISTINCT {id: p.id, name: p.name, description: p.description, domain: p.domain}) AS projects,
                   collect(DISTINCT {id: c.id, name: c.name, industry: c.industry, location: c.location}) AS companies
            """;

    private static final String FIND_BY_SKILL = """
            MATCH (d:Developer)-[:HAS_SKILL]->(s:Skill)
            WHERE s.name = $skillName
            RETURN d.id AS id, d.name AS name, d.email AS email,
                   d.experienceYears AS experienceYears, d.location AS location
            ORDER BY d.name
            """;

    private static final String FIND_PROJECTS_BY_SKILL = """
            MATCH (p:Project)-[:USES_SKILL]->(s:Skill)
            WHERE s.name = $skillName
            RETURN p.id AS id, p.name AS name, p.description AS description, p.domain AS domain
            ORDER BY p.name
            """;

    private static final String FIND_BY_INDUSTRY = """
            MATCH (d:Developer)-[:WORKED_ON]->(p:Project)-[:BELONGS_TO]->(c:Company)
            WHERE c.industry = $industry
            RETURN DISTINCT d.id AS id, d.name AS name, d.email AS email,
                   d.experienceYears AS experienceYears, d.location AS location,
                   collect(DISTINCT p.name) AS projects,
                   collect(DISTINCT c.name) AS companies
            ORDER BY d.name
            """;

    private static final String FIND_SIMILAR_DEVELOPERS = """
            MATCH (target:Developer {id: $developerId})-[:HAS_SKILL]->(s:Skill)<-[:HAS_SKILL]-(other:Developer)
            WHERE target <> other
            WITH other, collect(DISTINCT s.name) AS sharedSkills
            RETURN other.id AS id, other.name AS name, sharedSkills, size(sharedSkills) AS sharedSkillCount
            ORDER BY sharedSkillCount DESC, other.name
            """;

    private final Driver driver;

    public DeveloperRepository(Driver driver) {
        this.driver = driver;
    }

    public List<DeveloperSummary> findAll() {
        try (Session session = driver.session()) {
            return session.run(FIND_ALL_DEVELOPERS)
                    .list(this::toDeveloperSummary);
        }
    }

    public Optional<DeveloperDetail> findById(String developerId) {
        try (Session session = driver.session()) {
            return session.run(FIND_DEVELOPER_BY_ID, Values.parameters("developerId", developerId))
                    .stream()
                    .findFirst()
                    .filter(record -> !record.get("id").isNull())
                    .map(this::toDeveloperDetail);
        }
    }

    public List<DeveloperSummary> findBySkill(String skillName) {
        try (Session session = driver.session()) {
            return session.run(FIND_BY_SKILL, Values.parameters("skillName", skillName))
                    .list(this::toDeveloperSummary);
        }
    }

    public List<ProjectDto> findProjectsBySkill(String skillName) {
        try (Session session = driver.session()) {
            return session.run(FIND_PROJECTS_BY_SKILL, Values.parameters("skillName", skillName))
                    .list(this::toProjectDto);
        }
    }

    public List<IndustryDeveloperDto> findByIndustry(String industry) {
        try (Session session = driver.session()) {
            return session.run(FIND_BY_INDUSTRY, Values.parameters("industry", industry))
                    .list(this::toIndustryDeveloperDto);
        }
    }

    public List<SimilarDeveloperDto> findSimilarDevelopers(String developerId) {
        try (Session session = driver.session()) {
            return session.run(FIND_SIMILAR_DEVELOPERS, Values.parameters("developerId", developerId))
                    .list(this::toSimilarDeveloperDto);
        }
    }

    public boolean existsById(String developerId) {
        try (Session session = driver.session()) {
            return session.run(
                            "MATCH (d:Developer {id: $developerId}) RETURN count(d) AS cnt",
                            Values.parameters("developerId", developerId)
                    )
                    .single()
                    .get("cnt")
                    .asInt() > 0;
        }
    }

    private DeveloperSummary toDeveloperSummary(Record record) {
        return new DeveloperSummary(
                record.get("id").asString(),
                record.get("name").asString(),
                record.get("email").asString(),
                record.get("experienceYears").asInt(),
                record.get("location").asString()
        );
    }

    private DeveloperDetail toDeveloperDetail(Record record) {
        return new DeveloperDetail(
                record.get("id").asString(),
                record.get("name").asString(),
                record.get("email").asString(),
                record.get("experienceYears").asInt(),
                record.get("location").asString(),
                mapSkills(record.get("skills").asList(value -> value.asMap())),
                mapProjects(record.get("projects").asList(value -> value.asMap())),
                mapCompanies(record.get("companies").asList(value -> value.asMap()))
        );
    }

    private ProjectDto toProjectDto(Record record) {
        return new ProjectDto(
                record.get("id").asString(),
                record.get("name").asString(),
                record.get("description").asString(),
                record.get("domain").asString()
        );
    }

    private IndustryDeveloperDto toIndustryDeveloperDto(Record record) {
        return new IndustryDeveloperDto(
                record.get("id").asString(),
                record.get("name").asString(),
                record.get("email").asString(),
                record.get("experienceYears").asInt(),
                record.get("location").asString(),
                record.get("projects").asList(value -> value.asString()),
                record.get("companies").asList(value -> value.asString())
        );
    }

    private SimilarDeveloperDto toSimilarDeveloperDto(Record record) {
        return new SimilarDeveloperDto(
                record.get("id").asString(),
                record.get("name").asString(),
                record.get("sharedSkills").asList(value -> value.asString()),
                record.get("sharedSkillCount").asInt()
        );
    }

    private List<SkillDto> mapSkills(List<Map<String, Object>> rawSkills) {
        List<SkillDto> skills = new ArrayList<>();
        for (Map<String, Object> map : rawSkills) {
            if (map.get("id") != null) {
                skills.add(new SkillDto(
                        stringValue(map.get("id")),
                        stringValue(map.get("name")),
                        stringValue(map.get("category"))
                ));
            }
        }
        return skills;
    }

    private List<ProjectDto> mapProjects(List<Map<String, Object>> rawProjects) {
        List<ProjectDto> projects = new ArrayList<>();
        for (Map<String, Object> map : rawProjects) {
            if (map.get("id") != null) {
                projects.add(new ProjectDto(
                        stringValue(map.get("id")),
                        stringValue(map.get("name")),
                        stringValue(map.get("description")),
                        stringValue(map.get("domain"))
                ));
            }
        }
        return projects;
    }

    private List<CompanyDto> mapCompanies(List<Map<String, Object>> rawCompanies) {
        List<CompanyDto> companies = new ArrayList<>();
        for (Map<String, Object> map : rawCompanies) {
            if (map.get("id") != null) {
                companies.add(new CompanyDto(
                        stringValue(map.get("id")),
                        stringValue(map.get("name")),
                        stringValue(map.get("industry")),
                        stringValue(map.get("location"))
                ));
            }
        }
        return companies;
    }

    private String stringValue(Object value) {
        return value == null ? null : value.toString();
    }
}
