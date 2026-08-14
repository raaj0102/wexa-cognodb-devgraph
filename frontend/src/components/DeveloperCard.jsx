import { Link } from 'react-router-dom';
import SkillBadge from './SkillBadge';
import '../styles/components.css';

export default function DeveloperCard({ developer, matchedSkill, skills = [] }) {
  const displaySkills = skills.length > 0
    ? skills
    : matchedSkill
      ? [{ name: matchedSkill, highlight: true }]
      : [];

  return (
    <article className="developer-card">
      <div className="developer-card__header">
        <h3>{developer.name}</h3>
        <span className="developer-card__experience">{developer.experienceYears} yrs exp.</span>
      </div>
      <p className="developer-card__location">{developer.location}</p>
      {displaySkills.length > 0 && (
        <div className="developer-card__skills">
          {displaySkills.map((skill) => (
            <SkillBadge
              key={skill.name || skill}
              name={skill.name || skill}
              highlight={skill.highlight}
            />
          ))}
        </div>
      )}
      <Link to={`/developers/${developer.id}`} className="btn btn--secondary btn--full">
        View Profile
      </Link>
    </article>
  );
}
