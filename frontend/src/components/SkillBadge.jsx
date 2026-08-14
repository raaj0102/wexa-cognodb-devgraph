import '../styles/components.css';

export default function SkillBadge({ name, highlight = false }) {
  return (
    <span className={`skill-badge ${highlight ? 'skill-badge--highlight' : ''}`}>
      {name}
    </span>
  );
}
