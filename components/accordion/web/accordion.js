export function initCiataAccordion(root) {
  const buttons = Array.from(root.querySelectorAll('.ciata-accordion__button'));

  buttons.forEach((button) => {
    button.addEventListener('click', () => {
      const panelId = button.getAttribute('aria-controls');
      const panel = panelId ? root.querySelector(`#${panelId}`) : null;
      if (!panel) return;

      const expanded = button.getAttribute('aria-expanded') === 'true';
      button.setAttribute('aria-expanded', expanded ? 'false' : 'true');
      panel.hidden = expanded;
    });
  });
}
