const key = 'ys-theme';
const root = document.documentElement;
const toggle = document.getElementById('themeSwitch');

const setTheme = (theme) => {
  root.setAttribute('data-theme', theme);
  localStorage.setItem(key, theme);
};

const initialTheme = localStorage.getItem(key) || 'light';
setTheme(initialTheme);

toggle?.addEventListener('click', () => {
  const nextTheme = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
  setTheme(nextTheme);
});
