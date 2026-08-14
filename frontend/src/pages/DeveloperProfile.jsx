import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import LoadingState from '../components/LoadingState';
import ErrorState from '../components/ErrorState';
import SkillBadge from '../components/SkillBadge';
import { getDeveloper, getSimilarDevelopers } from '../services/api';
import '../styles/pages.css';

export default function DeveloperProfile() {
  const { id } = useParams();
  const [developer, setDeveloper] = useState(null);
  const [similar, setSimilar] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);

  useEffect(() => {
    async function loadProfile() {
      try {
        setLoading(true);
        setError(false);
        const [profile, similarDevs] = await Promise.all([
          getDeveloper(id),
          getSimilarDevelopers(id),
        ]);
        setDeveloper(profile);
        setSimilar(similarDevs);
      } catch {
        setError(true);
      } finally {
        setLoading(false);
      }
    }

    loadProfile();
  }, [id]);

  if (loading) {
    return <LoadingState message="Loading developer profile..." />;
  }

  if (error || !developer) {
    return (
      <div className="page">
        <div className="container">
          <ErrorState title="Developer not found." message="Please return to the developer list and try again." />
          <Link to="/" className="btn btn--secondary">Back to Developers</Link>
        </div>
      </div>
    );
  }

  return (
    <div className="page">
      <div className="container profile-page">
        <Link to="/" className="back-link">← Back to Developers</Link>

        <section className="profile-hero card">
          <div>
            <p className="profile-hero__eyebrow">Developer Profile</p>
            <h1>{developer.name}</h1>
            <p className="profile-hero__email">{developer.email}</p>
          </div>
          <div className="profile-hero__meta">
            <div className="meta-item">
              <span className="meta-label">Location</span>
              <span>{developer.location}</span>
            </div>
            <div className="meta-item">
              <span className="meta-label">Experience</span>
              <span>{developer.experienceYears} years</span>
            </div>
          </div>
        </section>

        <div className="profile-grid">
          <section className="card profile-section">
            <h2>Skills</h2>
            <div className="badge-row">
              {developer.skills.map((skill) => (
                <SkillBadge key={skill.id} name={skill.name} />
              ))}
            </div>
          </section>

          <section className="card profile-section">
            <h2>Projects</h2>
            {developer.projects.length === 0 ? (
              <p className="muted">No projects recorded.</p>
            ) : (
              <ul className="profile-list">
                {developer.projects.map((project) => (
                  <li key={project.id} className="profile-list__item">
                    <strong>{project.name}</strong>
                    <span>{project.domain}</span>
                    <p>{project.description}</p>
                  </li>
                ))}
              </ul>
            )}
          </section>

          <section className="card profile-section">
            <h2>Companies</h2>
            {developer.companies.length === 0 ? (
              <p className="muted">No companies recorded.</p>
            ) : (
              <ul className="profile-list">
                {developer.companies.map((company) => (
                  <li key={company.id} className="profile-list__item">
                    <strong>{company.name}</strong>
                    <span>{company.industry} · {company.location}</span>
                  </li>
                ))}
              </ul>
            )}
          </section>
        </div>

        <section className="section">
          <div className="section-header">
            <h2>Similar Developers</h2>
            <p>Developers who share skills with {developer.name}.</p>
          </div>
          {similar.length === 0 ? (
            <p className="muted">No similar developers found.</p>
          ) : (
            <div className="similar-grid">
              {similar.map((item) => (
                <article key={item.id} className="similar-card card">
                  <div className="similar-card__header">
                    <h3>{item.name}</h3>
                    <span className="similar-count">{item.sharedSkillCount} shared</span>
                  </div>
                  <div className="badge-row">
                    {item.sharedSkills.map((skill) => (
                      <SkillBadge key={skill} name={skill} highlight />
                    ))}
                  </div>
                  <Link to={`/developers/${item.id}`} className="btn btn--secondary btn--full">
                    View Profile
                  </Link>
                </article>
              ))}
            </div>
          )}
        </section>
      </div>
    </div>
  );
}
