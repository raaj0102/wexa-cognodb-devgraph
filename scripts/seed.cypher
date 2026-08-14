// DevGraph seed data â€” safe to run repeatedly (MERGE-based)

// â”€â”€ Skills (15) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MERGE (s:Skill {id: 'skill-java'})         SET s.name = 'Java',              s.category = 'Backend';
MERGE (s:Skill {id: 'skill-spring'})       SET s.name = 'Spring Boot',       s.category = 'Backend';
MERGE (s:Skill {id: 'skill-python'})       SET s.name = 'Python',            s.category = 'Backend';
MERGE (s:Skill {id: 'skill-javascript'})   SET s.name = 'JavaScript',        s.category = 'Frontend';
MERGE (s:Skill {id: 'skill-react'})        SET s.name = 'React',             s.category = 'Frontend';
MERGE (s:Skill {id: 'skill-nodejs'})       SET s.name = 'Node.js',           s.category = 'Backend';
MERGE (s:Skill {id: 'skill-sql'})          SET s.name = 'SQL',               s.category = 'Data';
MERGE (s:Skill {id: 'skill-docker'})       SET s.name = 'Docker',            s.category = 'DevOps';
MERGE (s:Skill {id: 'skill-kubernetes'})   SET s.name = 'Kubernetes',        s.category = 'DevOps';
MERGE (s:Skill {id: 'skill-kafka'})        SET s.name = 'Kafka',             s.category = 'Data';
MERGE (s:Skill {id: 'skill-aws'})          SET s.name = 'AWS',               s.category = 'Cloud';
MERGE (s:Skill {id: 'skill-redis'})        SET s.name = 'Redis',             s.category = 'Data';
MERGE (s:Skill {id: 'skill-mongodb'})      SET s.name = 'MongoDB',           s.category = 'Data';
MERGE (s:Skill {id: 'skill-ml'})           SET s.name = 'Machine Learning',  s.category = 'AI';
MERGE (s:Skill {id: 'skill-data-eng'})     SET s.name = 'Data Engineering', s.category = 'Data';

// â”€â”€ Companies (6) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MERGE (c:Company {id: 'comp-stripe'})      SET c.name = 'Stripe Labs',        c.industry = 'FinTech',    c.location = 'San Francisco, USA';
MERGE (c:Company {id: 'comp-aws'})         SET c.name = 'Amazon Web Services', c.industry = 'Cloud',      c.location = 'Seattle, USA';
MERGE (c:Company {id: 'comp-shopify'})     SET c.name = 'Shopify Commerce',   c.industry = 'E-commerce', c.location = 'Ottawa, Canada';
MERGE (c:Company {id: 'comp-jpmorgan'})    SET c.name = 'JPMorgan Digital',   c.industry = 'FinTech',    c.location = 'New York, USA';
MERGE (c:Company {id: 'comp-medbridge'})   SET c.name = 'MedBridge Health',  c.industry = 'Healthcare', c.location = 'Boston, USA';
MERGE (c:Company {id: 'comp-uber-freight'}) SET c.name = 'Uber Freight',      c.industry = 'Logistics',  c.location = 'Chicago, USA';

// â”€â”€ Projects (10) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MERGE (p:Project {id: 'proj-payment'})     SET p.name = 'Payment Gateway',           p.description = 'Real-time payment processing platform',        p.domain = 'FinTech';
MERGE (p:Project {id: 'proj-ecommerce'})   SET p.name = 'E-commerce Platform',       p.description = 'Scalable online retail marketplace',           p.domain = 'E-commerce';
MERGE (p:Project {id: 'proj-banking'})     SET p.name = 'Banking Analytics',         p.description = 'Financial risk and portfolio analytics',       p.domain = 'FinTech';
MERGE (p:Project {id: 'proj-recommend'})   SET p.name = 'Recommendation Engine',     p.description = 'ML-powered product recommendations',           p.domain = 'AI';
MERGE (p:Project {id: 'proj-healthcare'})  SET p.name = 'Healthcare Portal',        p.description = 'Patient records and appointment management',   p.domain = 'Healthcare';
MERGE (p:Project {id: 'proj-logistics'})   SET p.name = 'Logistics Tracking',        p.description = 'Fleet and shipment tracking system',           p.domain = 'Logistics';
MERGE (p:Project {id: 'proj-fraud'})       SET p.name = 'Fraud Detection System',    p.description = 'Real-time transaction fraud detection',        p.domain = 'FinTech';
MERGE (p:Project {id: 'proj-devplatform'}) SET p.name = 'Developer Platform',        p.description = 'Internal developer tooling and CI/CD portal',  p.domain = 'Cloud';
MERGE (p:Project {id: 'proj-support'})     SET p.name = 'Customer Support System',   p.description = 'Omnichannel customer support platform',        p.domain = 'E-commerce';
MERGE (p:Project {id: 'proj-datapipeline'}) SET p.name = 'Data Pipeline Platform',  p.description = 'Large-scale ETL and streaming data pipelines', p.domain = 'Data';

// â”€â”€ Developers (20) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MERGE (d:Developer {id: 'dev-001'}) SET d.name = 'Priya Sharma',     d.email = 'priya.sharma@email.com',     d.experienceYears = 8,  d.location = 'Bangalore, India';
MERGE (d:Developer {id: 'dev-002'}) SET d.name = 'James Mitchell',   d.email = 'james.mitchell@email.com',   d.experienceYears = 6,  d.location = 'London, UK';
MERGE (d:Developer {id: 'dev-003'}) SET d.name = 'Ana Rodriguez',    d.email = 'ana.rodriguez@email.com',    d.experienceYears = 5,  d.location = 'Madrid, Spain';
MERGE (d:Developer {id: 'dev-004'}) SET d.name = 'David Kim',        d.email = 'david.kim@email.com',        d.experienceYears = 10, d.location = 'Seoul, South Korea';
MERGE (d:Developer {id: 'dev-005'}) SET d.name = 'Sarah Chen',       d.email = 'sarah.chen@email.com',       d.experienceYears = 7,  d.location = 'Singapore';
MERGE (d:Developer {id: 'dev-006'}) SET d.name = 'Michael Okafor',   d.email = 'michael.okafor@email.com',   d.experienceYears = 4,  d.location = 'Lagos, Nigeria';
MERGE (d:Developer {id: 'dev-007'}) SET d.name = 'Emily Watson',     d.email = 'emily.watson@email.com',     d.experienceYears = 9,  d.location = 'Toronto, Canada';
MERGE (d:Developer {id: 'dev-008'}) SET d.name = 'Raj Patel',        d.email = 'raj.patel@email.com',        d.experienceYears = 6,  d.location = 'Mumbai, India';
MERGE (d:Developer {id: 'dev-009'}) SET d.name = 'Lisa Nguyen',      d.email = 'lisa.nguyen@email.com',      d.experienceYears = 5,  d.location = 'Sydney, Australia';
MERGE (d:Developer {id: 'dev-010'}) SET d.name = 'Tom Becker',       d.email = 'tom.becker@email.com',       d.experienceYears = 11, d.location = 'Berlin, Germany';
MERGE (d:Developer {id: 'dev-011'}) SET d.name = 'Fatima Al-Hassan', d.email = 'fatima.alhassan@email.com',  d.experienceYears = 3,  d.location = 'Dubai, UAE';
MERGE (d:Developer {id: 'dev-012'}) SET d.name = 'Chris Johnson',    d.email = 'chris.johnson@email.com',    d.experienceYears = 8,  d.location = 'Austin, USA';
MERGE (d:Developer {id: 'dev-013'}) SET d.name = 'Nina Kowalski',    d.email = 'nina.kowalski@email.com',    d.experienceYears = 7,  d.location = 'Warsaw, Poland';
MERGE (d:Developer {id: 'dev-014'}) SET d.name = 'Alex Turner',      d.email = 'alex.turner@email.com',      d.experienceYears = 5,  d.location = 'San Francisco, USA';
MERGE (d:Developer {id: 'dev-015'}) SET d.name = 'Mei Lin',          d.email = 'mei.lin@email.com',          d.experienceYears = 6,  d.location = 'Shanghai, China';
MERGE (d:Developer {id: 'dev-016'}) SET d.name = 'Oliver Hughes',    d.email = 'oliver.hughes@email.com',    d.experienceYears = 4,  d.location = 'Dublin, Ireland';
MERGE (d:Developer {id: 'dev-017'}) SET d.name = 'Sofia Martinez',   d.email = 'sofia.martinez@email.com',   d.experienceYears = 9,  d.location = 'Barcelona, Spain';
MERGE (d:Developer {id: 'dev-018'}) SET d.name = "Kevin O'Brien",   d.email = 'kevin.obrien@email.com',     d.experienceYears = 7,  d.location = 'Boston, USA';
MERGE (d:Developer {id: 'dev-019'}) SET d.name = 'Yuki Tanaka',      d.email = 'yuki.tanaka@email.com',      d.experienceYears = 5,  d.location = 'Tokyo, Japan';
MERGE (d:Developer {id: 'dev-020'}) SET d.name = 'Hannah Brooks',    d.email = 'hannah.brooks@email.com',    d.experienceYears = 6,  d.location = 'Chicago, USA';

// â”€â”€ Project â†’ Company (BELONGS_TO) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MATCH (p:Project {id: 'proj-payment'}),     (c:Company {id: 'comp-stripe'})      MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-ecommerce'}),   (c:Company {id: 'comp-shopify'})     MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-banking'}),     (c:Company {id: 'comp-jpmorgan'})    MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-recommend'}),   (c:Company {id: 'comp-shopify'})     MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-healthcare'}),  (c:Company {id: 'comp-medbridge'})   MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-logistics'}),   (c:Company {id: 'comp-uber-freight'}) MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-fraud'}),       (c:Company {id: 'comp-jpmorgan'})    MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-devplatform'}), (c:Company {id: 'comp-aws'})         MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-support'}),     (c:Company {id: 'comp-shopify'})     MERGE (p)-[:BELONGS_TO]->(c);
MATCH (p:Project {id: 'proj-datapipeline'}),(c:Company {id: 'comp-aws'})         MERGE (p)-[:BELONGS_TO]->(c);

// â”€â”€ Project â†’ Skill (USES_SKILL) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MATCH (p:Project {id: 'proj-payment'}),     (s:Skill {id: 'skill-java'})       MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-payment'}),     (s:Skill {id: 'skill-spring'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-payment'}),     (s:Skill {id: 'skill-kafka'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-payment'}),     (s:Skill {id: 'skill-aws'})        MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-ecommerce'}),   (s:Skill {id: 'skill-javascript'})   MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-ecommerce'}),   (s:Skill {id: 'skill-react'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-ecommerce'}),   (s:Skill {id: 'skill-nodejs'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-ecommerce'}),   (s:Skill {id: 'skill-redis'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-banking'}),     (s:Skill {id: 'skill-python'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-banking'}),     (s:Skill {id: 'skill-sql'})        MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-banking'}),     (s:Skill {id: 'skill-data-eng'})   MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-recommend'}),   (s:Skill {id: 'skill-python'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-recommend'}),   (s:Skill {id: 'skill-ml'})         MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-recommend'}),   (s:Skill {id: 'skill-kafka'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-healthcare'}),  (s:Skill {id: 'skill-java'})       MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-healthcare'}),  (s:Skill {id: 'skill-spring'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-healthcare'}),  (s:Skill {id: 'skill-sql'})        MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-logistics'}),   (s:Skill {id: 'skill-javascript'})   MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-logistics'}),   (s:Skill {id: 'skill-nodejs'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-logistics'}),   (s:Skill {id: 'skill-mongodb'})    MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-fraud'}),       (s:Skill {id: 'skill-python'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-fraud'}),       (s:Skill {id: 'skill-ml'})         MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-fraud'}),       (s:Skill {id: 'skill-kafka'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-devplatform'}), (s:Skill {id: 'skill-java'})       MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-devplatform'}), (s:Skill {id: 'skill-docker'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-devplatform'}), (s:Skill {id: 'skill-kubernetes'}) MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-devplatform'}), (s:Skill {id: 'skill-aws'})        MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-support'}),     (s:Skill {id: 'skill-react'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-support'}),     (s:Skill {id: 'skill-nodejs'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-support'}),     (s:Skill {id: 'skill-redis'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-datapipeline'}),(s:Skill {id: 'skill-python'})     MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-datapipeline'}),(s:Skill {id: 'skill-kafka'})      MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-datapipeline'}),(s:Skill {id: 'skill-data-eng'})   MERGE (p)-[:USES_SKILL]->(s);
MATCH (p:Project {id: 'proj-datapipeline'}),(s:Skill {id: 'skill-aws'})        MERGE (p)-[:USES_SKILL]->(s);

// â”€â”€ Developer â†’ Skill (HAS_SKILL) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MATCH (d:Developer {id: 'dev-001'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-001'}), (s:Skill {id: 'skill-spring'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-001'}), (s:Skill {id: 'skill-kafka'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-002'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-002'}), (s:Skill {id: 'skill-spring'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-002'}), (s:Skill {id: 'skill-docker'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-003'}), (s:Skill {id: 'skill-javascript'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-003'}), (s:Skill {id: 'skill-react'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-003'}), (s:Skill {id: 'skill-nodejs'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-004'}), (s:Skill {id: 'skill-python'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-004'}), (s:Skill {id: 'skill-ml'})         MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-004'}), (s:Skill {id: 'skill-kafka'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-005'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-005'}), (s:Skill {id: 'skill-aws'})        MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-005'}), (s:Skill {id: 'skill-kubernetes'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-006'}), (s:Skill {id: 'skill-javascript'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-006'}), (s:Skill {id: 'skill-react'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-007'}), (s:Skill {id: 'skill-python'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-007'}), (s:Skill {id: 'skill-sql'})        MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-007'}), (s:Skill {id: 'skill-data-eng'})   MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-008'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-008'}), (s:Skill {id: 'skill-spring'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-008'}), (s:Skill {id: 'skill-sql'})        MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-009'}), (s:Skill {id: 'skill-nodejs'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-009'}), (s:Skill {id: 'skill-mongodb'})    MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-009'}), (s:Skill {id: 'skill-docker'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-010'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-010'}), (s:Skill {id: 'skill-kafka'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-010'}), (s:Skill {id: 'skill-aws'})        MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-011'}), (s:Skill {id: 'skill-react'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-011'}), (s:Skill {id: 'skill-javascript'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-012'}), (s:Skill {id: 'skill-python'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-012'}), (s:Skill {id: 'skill-ml'})         MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-013'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-013'}), (s:Skill {id: 'skill-spring'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-013'}), (s:Skill {id: 'skill-docker'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-014'}), (s:Skill {id: 'skill-javascript'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-014'}), (s:Skill {id: 'skill-nodejs'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-014'}), (s:Skill {id: 'skill-aws'})        MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-015'}), (s:Skill {id: 'skill-python'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-015'}), (s:Skill {id: 'skill-data-eng'})   MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-015'}), (s:Skill {id: 'skill-kafka'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-016'}), (s:Skill {id: 'skill-javascript'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-016'}), (s:Skill {id: 'skill-react'})      MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-016'}), (s:Skill {id: 'skill-nodejs'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-017'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-017'}), (s:Skill {id: 'skill-spring'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-017'}), (s:Skill {id: 'skill-sql'})        MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-018'}), (s:Skill {id: 'skill-python'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-018'}), (s:Skill {id: 'skill-ml'})         MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-018'}), (s:Skill {id: 'skill-sql'})        MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-019'}), (s:Skill {id: 'skill-java'})       MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-019'}), (s:Skill {id: 'skill-docker'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-019'}), (s:Skill {id: 'skill-kubernetes'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-020'}), (s:Skill {id: 'skill-javascript'}) MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-020'}), (s:Skill {id: 'skill-nodejs'})     MERGE (d)-[:HAS_SKILL]->(s);
MATCH (d:Developer {id: 'dev-020'}), (s:Skill {id: 'skill-mongodb'})    MERGE (d)-[:HAS_SKILL]->(s);

// â”€â”€ Developer â†’ Project (WORKED_ON) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MATCH (d:Developer {id: 'dev-001'}), (p:Project {id: 'proj-payment'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-002'}), (p:Project {id: 'proj-payment'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-002'}), (p:Project {id: 'proj-devplatform'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-003'}), (p:Project {id: 'proj-ecommerce'})   MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-003'}), (p:Project {id: 'proj-support'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-004'}), (p:Project {id: 'proj-recommend'})   MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-004'}), (p:Project {id: 'proj-fraud'})       MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-005'}), (p:Project {id: 'proj-devplatform'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-005'}), (p:Project {id: 'proj-datapipeline'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-006'}), (p:Project {id: 'proj-ecommerce'})   MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-007'}), (p:Project {id: 'proj-banking'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-007'}), (p:Project {id: 'proj-datapipeline'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-008'}), (p:Project {id: 'proj-healthcare'})  MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-008'}), (p:Project {id: 'proj-banking'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-009'}), (p:Project {id: 'proj-logistics'})   MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-010'}), (p:Project {id: 'proj-payment'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-010'}), (p:Project {id: 'proj-datapipeline'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-011'}), (p:Project {id: 'proj-support'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-012'}), (p:Project {id: 'proj-fraud'})       MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-012'}), (p:Project {id: 'proj-recommend'})   MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-013'}), (p:Project {id: 'proj-healthcare'})  MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-013'}), (p:Project {id: 'proj-payment'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-014'}), (p:Project {id: 'proj-devplatform'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-014'}), (p:Project {id: 'proj-logistics'})   MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-015'}), (p:Project {id: 'proj-datapipeline'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-016'}), (p:Project {id: 'proj-ecommerce'})   MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-016'}), (p:Project {id: 'proj-support'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-017'}), (p:Project {id: 'proj-healthcare'})  MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-018'}), (p:Project {id: 'proj-banking'})     MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-018'}), (p:Project {id: 'proj-fraud'})       MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-019'}), (p:Project {id: 'proj-devplatform'}) MERGE (d)-[:WORKED_ON]->(p);
MATCH (d:Developer {id: 'dev-020'}), (p:Project {id: 'proj-logistics'})   MERGE (d)-[:WORKED_ON]->(p);

// â”€â”€ Developer â†’ Company (WORKED_AT) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MATCH (d:Developer {id: 'dev-001'}), (c:Company {id: 'comp-stripe'})      MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-002'}), (c:Company {id: 'comp-stripe'})      MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-002'}), (c:Company {id: 'comp-aws'})         MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-003'}), (c:Company {id: 'comp-shopify'})     MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-004'}), (c:Company {id: 'comp-shopify'})     MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-005'}), (c:Company {id: 'comp-aws'})         MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-006'}), (c:Company {id: 'comp-shopify'})     MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-007'}), (c:Company {id: 'comp-jpmorgan'})    MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-008'}), (c:Company {id: 'comp-medbridge'})   MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-008'}), (c:Company {id: 'comp-jpmorgan'})    MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-009'}), (c:Company {id: 'comp-uber-freight'}) MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-010'}), (c:Company {id: 'comp-stripe'})      MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-011'}), (c:Company {id: 'comp-shopify'})     MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-012'}), (c:Company {id: 'comp-jpmorgan'})    MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-013'}), (c:Company {id: 'comp-medbridge'})   MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-014'}), (c:Company {id: 'comp-aws'})         MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-015'}), (c:Company {id: 'comp-aws'})         MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-016'}), (c:Company {id: 'comp-shopify'})     MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-017'}), (c:Company {id: 'comp-medbridge'})   MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-018'}), (c:Company {id: 'comp-jpmorgan'})    MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-019'}), (c:Company {id: 'comp-aws'})         MERGE (d)-[:WORKED_AT]->(c);
MATCH (d:Developer {id: 'dev-020'}), (c:Company {id: 'comp-uber-freight'}) MERGE (d)-[:WORKED_AT]->(c);

// â”€â”€ Verification queries â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

MATCH (n) RETURN labels(n) AS labels, count(n) AS count ORDER BY labels;

MATCH ()-[r]->() RETURN type(r) AS relationshipType, count(r) AS count ORDER BY relationshipType;
