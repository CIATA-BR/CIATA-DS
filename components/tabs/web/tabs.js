export function initCiataTabs(root) {
  const tabs = Array.from(root.querySelectorAll('[role="tab"]'));
  if (!tabs.length) return;

  const activate = (tab) => {
    tabs.forEach((item) => {
      const selected = item === tab;
      item.setAttribute('aria-selected', selected ? 'true' : 'false');
      item.tabIndex = selected ? 0 : -1;
      const panel = root.querySelector(`#${item.getAttribute('aria-controls')}`);
      if (panel) panel.hidden = !selected;
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
