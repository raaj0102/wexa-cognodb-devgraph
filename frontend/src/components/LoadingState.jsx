import '../styles/components.css';

export default function LoadingState({ message = 'Loading...' }) {
  return (
    <div className="state-container loading-state" role="status" aria-live="polite">
      <div className="spinner" aria-hidden="true" />
      <p>{message}</p>
    </div>
  );
}
