import '../styles/components.css';

export default function EmptyState({ title, message }) {
  return (
    <div className="state-container empty-state" role="status">
      <div className="state-icon" aria-hidden="true">◇</div>
      <h3>{title}</h3>
      <p>{message}</p>
    </div>
  );
}
