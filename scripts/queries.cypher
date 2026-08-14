// DevGraph — reusable Cypher queries (all user input via parameters)

// ── Query 1: Developers with a particular skill ──────────────────────────────
// Parameter: $skillName
// Traversal: Developer → HAS_SKILL → Skill

MATCH (d:Developer)-[:HAS_SKILL]->(s:Skill)
WHERE s.name = $skillName
RETURN d.id AS id, d.name AS name, d.email AS email,
       d.experienceYears AS experienceYears, d.location AS location
ORDER BY d.name;


// ── Query 2: Projects using a particular skill ───────────────────────────────
// Parameter: $skillName
// Traversal: Project → USES_SKILL → Skill

MATCH (p:Project)-[:USES_SKILL]->(s:Skill)
WHERE s.name = $skillName
RETURN p.id AS id, p.name AS name, p.description AS description, p.domain AS domain
ORDER BY p.name;


// ── Query 3: Developers connected to projects through shared skills ────────────
// Multi-hop: Developer → HAS_SKILL → Skill ← USES_SKILL ← Project

MATCH (d:Developer)-[:HAS_SKILL]->(s:Skill)<-[:USES_SKILL]-(p:Project)
RETURN DISTINCT d.id AS developerId, d.name AS developerName,
       collect(DISTINCT p.name) AS connectedProjects
ORDER BY developerName;


// ── Query 4: Developers on projects in a given industry (3-hop) ────────────────
// Parameter: $industry
// Traversal: Developer → WORKED_ON → Project → BELONGS_TO → Company

MATCH (d:Developer)-[:WORKED_ON]->(p:Project)-[:BELONGS_TO]->(c:Company)
WHERE c.industry = $industry
RETURN DISTINCT d.id AS id, d.name AS name, d.email AS email,
       d.experienceYears AS experienceYears, d.location AS location,
       collect(DISTINCT p.name) AS projects,
       collect(DISTINCT c.name) AS companies
ORDER BY d.name;


// ── Query 5: Developers with a skill who worked on projects in an industry ────
// Parameters: $skillName, $industry
// Traversal: Developer → HAS_SKILL → Skill
//            Developer → WORKED_ON → Project → BELONGS_TO → Company

MATCH (d:Developer)-[:HAS_SKILL]->(s:Skill)
WHERE s.name = $skillName
MATCH (d)-[:WORKED_ON]->(p:Project)-[:BELONGS_TO]->(c:Company)
WHERE c.industry = $industry
RETURN DISTINCT d.id AS id, d.name AS name, d.email AS email,
       d.experienceYears AS experienceYears, d.location AS location,
       collect(DISTINCT p.name) AS projects,
       collect(DISTINCT c.name) AS companies
ORDER BY d.name;


// ── Query 6: Developer skill profile ─────────────────────────────────────────
// Parameter: $developerId

MATCH (d:Developer {id: $developerId})
OPTIONAL MATCH (d)-[:HAS_SKILL]->(s:Skill)
RETURN d.id AS id, d.name AS name, d.email AS email,
       d.experienceYears AS experienceYears, d.location AS location,
       collect(DISTINCT {id: s.id, name: s.name, category: s.category}) AS skills;


// ── Query 7: Similar developers (shared skills) ──────────────────────────────
// Parameter: $developerId

MATCH (target:Developer {id: $developerId})-[:HAS_SKILL]->(s:Skill)<-[:HAS_SKILL]-(other:Developer)
WHERE target <> other
WITH target, other, collect(DISTINCT s.name) AS sharedSkills
RETURN target.id AS targetDeveloperId, target.name AS targetDeveloperName,
       other.id AS similarDeveloperId, other.name AS similarDeveloperName,
       sharedSkills, size(sharedSkills) AS sharedSkillCount
ORDER BY sharedSkillCount DESC, similarDeveloperName;


// ── Query 8: Skill recommendations via similar developers ────────────────────
// Parameter: $developerId
// Find skills used by projects worked on by similar developers,
// but not yet held by the target developer.

MATCH (target:Developer {id: $developerId})-[:HAS_SKILL]->(targetSkill:Skill)<-[:HAS_SKILL]-(similar:Developer)
WHERE target <> similar
WITH target, similar, count(DISTINCT targetSkill) AS overlap
ORDER BY overlap DESC
LIMIT 5
WITH target, collect(similar) AS similarDevelopers
UNWIND similarDevelopers AS similar
MATCH (similar)-[:WORKED_ON]->(:Project)-[:USES_SKILL]->(recSkill:Skill)
WHERE NOT (target)-[:HAS_SKILL]->(recSkill)
RETURN recSkill.name AS skillName, recSkill.category AS category,
       count(*) AS frequency
ORDER BY frequency DESC, skillName;
