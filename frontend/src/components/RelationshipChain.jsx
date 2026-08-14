import '../styles/components.css';

export default function RelationshipChain({ steps }) {
  return (
    <div className="relationship-chain" aria-label="Relationship path">
      {steps.map((step, index) => (
        <div key={`${step.label}-${index}`} className="relationship-chain__item">
          <span className={`relationship-chain__node relationship-chain__node--${step.type}`}>
            {step.label}
          </span>
          {index < steps.length - 1 && (
            <span className="relationship-chain__arrow" aria-hidden="true">↓</span>
          )}
        </div>
      ))}
    </div>
  );
}
