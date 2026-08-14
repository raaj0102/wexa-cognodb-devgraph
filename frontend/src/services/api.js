const BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080';

async function request(path) {
  const response = await fetch(`${BASE_URL}${path}`);

  if (!response.ok) {
    const error = new Error('Request failed');
    error.status = response.status;
    throw error;
  }

  return response.json();
}

export function getHealth() {
  return request('/api/health');
}

export function getDevelopers() {
  return request('/api/developers');
}

export function getDeveloper(id) {
  return request(`/api/developers/${id}`);
}

export function searchDevelopersBySkill(skill) {
  return request(`/api/developers/search?skill=${encodeURIComponent(skill)}`);
}

export function searchProjectsBySkill(skill) {
  return request(`/api/projects/search?skill=${encodeURIComponent(skill)}`);
}

export function exploreIndustry(industry) {
  return request(`/api/explore/industry?industry=${encodeURIComponent(industry)}`);
}

export function getSimilarDevelopers(id) {
  return request(`/api/developers/${id}/similar`);
}
