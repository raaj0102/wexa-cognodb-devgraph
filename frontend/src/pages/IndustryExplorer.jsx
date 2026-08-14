import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import LoadingState from '../components/LoadingState';
import EmptyState from '../components/EmptyState';
import ErrorState from '../components/ErrorState';
import RelationshipChain from '../components/RelationshipChain';
import { exploreIndustry } from '../services/api';
import '../styles/pages.css';

const INDUSTRIES = [
  { label: 'FinTech', value: 'FinTech' },
  { label: 'Healthcare', value: 'Healthcare' },
  { label: 'E-commerce', value: 'E-commerce' },
  { label: 'Logistics', value: 'Logistics' },
  { label: 'Cloud', value: 'Cloud' },
];

export default function IndustryExplorer() {
  const [selectedIndustry, setSelectedIndustry] = useState('FinTech');
  const [results, setResults] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(false);

  async function loadIndustry(industry) {
    try {
      setLoading(true);
      setError(false);
      const data = await exploreIndustry(industry);
      setResults(data);
    } catch {
      setError(true);
      setResults([]);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    loadIndustry(selectedIndustry);
  }, []);

  async function handleExplore(event) {
    event.preventDefault();
    await loadIndustry(selectedIndustry);
  }

  return (
    <div className="page">
      <section className="hero hero--compact">
        <div className="container">
          <h1>Explore by Industry</h1>
          <p className="hero__description">
            Discover developers connected to projects and companies in a specific industry.
          </p>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <form className="industry-form card" onSubmit={handleExplore}>
            <label htmlFor="industry-select">Select an industry</label>
            <div className="search-form__row">
              <select
                id="industry-select"
                value={selectedIndustry}
                onChange={(e) => setSelectedIndustry(e.target.value)}
              >
                {INDUSTRIES.map((industry) => (
                  <option key={industry.value} value={industry.value}>{industry.label}</option>
                ))}
              </select>
              <button type="submit" className="btn btn--primary" disabled={loading}>
                Explore Industry
              </button>
            </div>
          </form>

          <div className="relationship-legend card">
            <h3>How connections work</h3>
            <RelationshipChain
              steps={[
                { label: 'Developer', type: 'developer' },
                { label: 'Worked On', type: 'relation' },
                { label: 'Project', type: 'project' },
                { label: 'Belongs To', type: 'relation' },
                { label: 'Company', type: 'company' },
              ]}
            />
          </div>

          {loading && <LoadingState message="Exploring industry connections..." />}
          {error && <ErrorState />}
          {!loading && !error && results && results.length === 0 && (
            <EmptyState
              title={`No developers found in ${selectedIndustry}.`}
              message="Try selecting a different industry."
            />
          )}
          {!loading && !error && results && results.length > 0 && (
            <div className="industry-results">
              {results.map((item) => (
                <article key={item.id} className="industry-card card">
                  <div className="industry-card__header">
                    <div>
                      <h3>{item.name}</h3>
                      <p className="muted">{item.location} · {item.experienceYears} yrs exp.</p>
                    </div>
                    <Link to={`/developers/${item.id}`} className="btn btn--secondary">
                      View Profile
                    </Link>
                  </div>

                  <RelationshipChain
                    steps={[
                      { label: item.name, type: 'developer' },
                      { label: 'Worked On', type: 'relation' },
                      { label: item.projects.join(', '), type: 'project' },
                      { label: 'Belongs To', type: 'relation' },
                      { label: `${item.companies.join(', ')} (${selectedIndustry})`, type: 'company' },
                    ]}
                  />
                </article>
              ))}
            </div>
          )}
        </div>
      </section>
    </div>
  );
}
