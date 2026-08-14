import { useEffect, useState } from 'react';
import DeveloperCard from '../components/DeveloperCard';
import LoadingState from '../components/LoadingState';
import EmptyState from '../components/EmptyState';
import ErrorState from '../components/ErrorState';
import SkillBadge from '../components/SkillBadge';
import { getDevelopers, searchDevelopersBySkill, searchProjectsBySkill } from '../services/api';
import '../styles/pages.css';

export default function Home() {
  const [developers, setDevelopers] = useState([]);
  const [skillQuery, setSkillQuery] = useState('Java');
  const [projectSkillQuery, setProjectSkillQuery] = useState('Java');
  const [searchResults, setSearchResults] = useState(null);
  const [projectResults, setProjectResults] = useState(null);

  const [loadingAll, setLoadingAll] = useState(true);
  const [loadingSearch, setLoadingSearch] = useState(false);
  const [loadingProjects, setLoadingProjects] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function loadDevelopers() {
      try {
        setLoadingAll(true);
        setError(null);
        const data = await getDevelopers();
        setDevelopers(data);
      } catch {
        setError(true);
      } finally {
        setLoadingAll(false);
      }
    }

    loadDevelopers();
  }, []);

  async function handleSkillSearch(event) {
    event.preventDefault();
    if (!skillQuery.trim()) return;

    try {
      setLoadingSearch(true);
      setError(null);
      const data = await searchDevelopersBySkill(skillQuery.trim());
      setSearchResults(data);
    } catch {
      setError(true);
      setSearchResults([]);
    } finally {
      setLoadingSearch(false);
    }
  }

  async function handleProjectSearch(event) {
    event.preventDefault();
    if (!projectSkillQuery.trim()) return;

    try {
      setLoadingProjects(true);
      setError(null);
      const data = await searchProjectsBySkill(projectSkillQuery.trim());
      setProjectResults(data);
    } catch {
      setError(true);
      setProjectResults([]);
    } finally {
      setLoadingProjects(false);
    }
  }

  if (error && developers.length === 0) {
    return <ErrorState />;
  }

  return (
    <div className="page">
      <section className="hero">
        <div className="container">
          <p className="hero__eyebrow">DevGraph</p>
          <h1>Explore Developer Connections</h1>
          <p className="hero__description">
            Discover developers, skills, projects and companies through their relationships.
          </p>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="section-header">
            <h2>Search Developers by Skill</h2>
            <p>Find developers who have a specific technology skill.</p>
          </div>
          <form className="search-form" onSubmit={handleSkillSearch}>
            <label htmlFor="skill-search">Skill name</label>
            <div className="search-form__row">
              <input
                id="skill-search"
                type="text"
                value={skillQuery}
                onChange={(e) => setSkillQuery(e.target.value)}
                placeholder="e.g. Java"
              />
              <button type="submit" className="btn btn--primary" disabled={loadingSearch}>
                Search Developers
              </button>
            </div>
          </form>

          {loadingSearch && <LoadingState message="Searching developers..." />}
          {!loadingSearch && searchResults && searchResults.length === 0 && (
            <EmptyState
              title={`No developers found for "${skillQuery}".`}
              message="Try another technology."
            />
          )}
          {!loadingSearch && searchResults && searchResults.length > 0 && (
            <div className="card-grid">
              {searchResults.map((developer) => (
                <DeveloperCard
                  key={developer.id}
                  developer={developer}
                  matchedSkill={skillQuery.trim()}
                />
              ))}
            </div>
          )}
        </div>
      </section>

      <section className="section section--alt">
        <div className="container">
          <div className="section-header">
            <h2>Search Projects by Skill</h2>
            <p>Find projects that use a specific technology.</p>
          </div>
          <form className="search-form" onSubmit={handleProjectSearch}>
            <label htmlFor="project-skill-search">Skill name</label>
            <div className="search-form__row">
              <input
                id="project-skill-search"
                type="text"
                value={projectSkillQuery}
                onChange={(e) => setProjectSkillQuery(e.target.value)}
                placeholder="e.g. Java"
              />
              <button type="submit" className="btn btn--primary" disabled={loadingProjects}>
                Search Projects
              </button>
            </div>
          </form>

          {loadingProjects && <LoadingState message="Searching projects..." />}
          {!loadingProjects && projectResults && projectResults.length === 0 && (
            <EmptyState
              title={`No projects found for "${projectSkillQuery}".`}
              message="Try another technology."
            />
          )}
          {!loadingProjects && projectResults && projectResults.length > 0 && (
            <div className="card-grid card-grid--wide">
              {projectResults.map((project) => (
                <article key={project.id} className="project-card">
                  <div className="project-card__header">
                    <h3>{project.name}</h3>
                    <SkillBadge name={project.domain} />
                  </div>
                  <p>{project.description}</p>
                  <div className="project-card__meta">
                    <span>Uses skill:</span>
                    <SkillBadge name={projectSkillQuery.trim()} highlight />
                  </div>
                </article>
              ))}
            </div>
          )}
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="section-header">
            <h2>All Developers</h2>
            <p>Browse all developers in the DevGraph network.</p>
          </div>
          {loadingAll && <LoadingState message="Loading developers..." />}
          {!loadingAll && developers.length > 0 && (
            <div className="card-grid">
              {developers.map((developer) => (
                <DeveloperCard key={developer.id} developer={developer} />
              ))}
            </div>
          )}
        </div>
      </section>

      <section id="about" className="section section--alt about-section">
        <div className="container about-content">
          <h2>About DevGraph</h2>
          <p>
            DevGraph is a relationship explorer that helps you understand how developers,
            skills, projects, and companies connect. Built on a graph database, it reveals
            multi-hop connections — like which developers worked on FinTech projects, or who
            shares skills with a colleague — without needing to write database queries.
          </p>
          <div className="about-relationships">
            <div className="about-rel-item">Developer → Skill</div>
            <div className="about-rel-item">Developer → Project</div>
            <div className="about-rel-item">Project → Company</div>
            <div className="about-rel-item">Developer → Company</div>
          </div>
        </div>
      </section>
    </div>
  );
}
