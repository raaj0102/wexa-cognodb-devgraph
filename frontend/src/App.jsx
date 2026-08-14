import { Routes, Route } from 'react-router-dom';
import Header from './components/Header';
import Home from './pages/Home';
import DeveloperProfile from './pages/DeveloperProfile';
import IndustryExplorer from './pages/IndustryExplorer';
import './styles/index.css';

export default function App() {
  return (
    <>
      <Header />
      <main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/developers/:id" element={<DeveloperProfile />} />
          <Route path="/industry" element={<IndustryExplorer />} />
        </Routes>
      </main>
      <footer className="footer">
        <div className="container">
          <p>DevGraph — Developer Skill & Project Explorer</p>
        </div>
      </footer>
    </>
  );
}
