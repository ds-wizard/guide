// Keep the guide menu in place when following links between pages.
(() => {
  const menu = document.querySelector('.sidebar-scroll');
  if (!menu) return;
  const home = document.querySelector('.sidebar-brand')?.pathname || '/';
  const key = `dsw-guide-menu:${home}`;
  try {
    const saved = JSON.parse(sessionStorage.getItem(key));
    if (saved) {
      // Let Sphinx open only the current page's ancestors.
      menu.scrollTop = saved.top || 0;
    }
  } catch (_) { /* Storage may be unavailable; ordinary navigation still works. */ }

  const save = () => {
    try {
      sessionStorage.setItem(key, JSON.stringify({
        top: menu.scrollTop
      }));
    } catch (_) { /* Keep navigation usable without storage. */ }
  };
  menu.addEventListener('change', save);
  menu.addEventListener('click', event => {
    if (event.target.closest('a')) save();
  });
  window.addEventListener('pagehide', save);
})();
