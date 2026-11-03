// Keep the guide menu in place when following links between pages.
(() => {
  const menu = document.querySelector('.sidebar-scroll');
  if (!menu) return;
  const branches = [...menu.querySelectorAll('.toctree-checkbox')];
  const path = input => input.parentElement.querySelector(':scope > a')?.pathname;
  const home = document.querySelector('.sidebar-brand')?.pathname || '/';
  const key = `dsw-guide-menu:${home}`;
  try {
    const saved = JSON.parse(sessionStorage.getItem(key));
    if (saved) {
      for (const input of branches) {
        // Keep the new page's active ancestors open as well.
        if (saved.open?.includes(path(input))) input.checked = true;
      }
      menu.scrollTop = saved.top || 0;
    }
  } catch (_) { /* Storage may be unavailable; ordinary navigation still works. */ }

  const save = () => {
    try {
      sessionStorage.setItem(key, JSON.stringify({
        top: menu.scrollTop,
        open: branches.filter(input => input.checked).map(path)
      }));
    } catch (_) { /* Keep navigation usable without storage. */ }
  };
  menu.addEventListener('change', save);
  menu.addEventListener('click', event => {
    if (event.target.closest('a')) save();
  });
  window.addEventListener('pagehide', save);
})();
