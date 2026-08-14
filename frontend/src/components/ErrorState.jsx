import '../styles/components.css';

export default function ErrorState({ title = 'Unable to connect to DevGraph.', message = 'Please try again later.' }) {
  return (
    <div className="state-container error-state" role="alert">
      <div className="state-icon" aria-hidden="true">!</div>
      <h3>{title}</h3>
      <p>{message}</p>
    </div>
  );
}
