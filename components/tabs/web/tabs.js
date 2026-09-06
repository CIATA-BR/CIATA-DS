export function initCiataTabs(root) {
  if (!root?.matches?.('[data-ciata-tabs]')) return;

  const tabs = Array.from(root.querySelectorAll('[role="tab"]')).filter(
    (tab) => tab.closest('[data-ciata-tabs]') === root,
  );
  if (!tabs.length) return;

  const activate = (tab) => {
    tabs.forEach((item) => {
      const selected = item === tab;
      item.setAttribute('aria-selected', selected ? 'true' : 'false');
      item.tabIndex = selected ? 0 : -1;

      const panelId = item.getAttribute('aria-controls');
      const panel = panelId ? document.getElementById(panelId) : null;
      if (panel && panel.closest('[data-ciata-tabs]') === root) {
        panel.hidden = !selected;
      }
    });
  };

  tabs.forEach((tab, index) => {
    tab.addEventListener('click', () => activate(tab));
    tab.addEventListener('keydown', (event) => {
      let next = index;
      if (event.key === 'ArrowRight') next = (index + 1) % tabs.length;
      else if (event.key === 'ArrowLeft') next = (index - 1 + tabs.length) % tabs.length;
      else if (event.key === 'Home') next = 0;
      else if (event.key === 'End') next = tabs.length - 1;
      else return;

      event.preventDefault();
      tabs[next].focus();
      activate(tabs[next]);
    });
  });
}
