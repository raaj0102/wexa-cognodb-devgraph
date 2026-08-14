import { Link, NavLink } from 'react-router-dom';
import '../styles/components.css';

export default function Header() {
  return (
    <header className="header">
      <div className="container header__inner">
        <Link to="/" className="header__brand">
          <span className="header__logo">DevGraph</span>
          <span className="header__subtitle">Developer Skill & Project Explorer</span>
        </Link>
        <nav className="header__nav" aria-label="Main navigation">
          <NavLink to="/" className={({ isActive }) => isActive ? 'nav-link active' : 'nav-link'} end>
            Developers
          </NavLink>
          <NavLink to="/industry" className={({ isActive }) => isActive ? 'nav-link active' : 'nav-link'}>
            Explore Industry
          </NavLink>
          <a href="/#about" className="nav-link">About</a>
        </nav>
      </div>
    </header>
  );
}
