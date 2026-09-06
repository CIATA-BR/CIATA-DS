export function initCiataAccordion(root) {
  if (!root?.matches?.('[data-ciata-accordion]')) return;

  const buttons = Array.from(root.querySelectorAll('.ciata-accordion__button')).filter(
    (button) => button.closest('[data-ciata-accordion]') === root,
  );

  buttons.forEach((button) => {
    button.addEventListener('click', () => {
      const panelId = button.getAttribute('aria-controls');
      const panel = panelId ? document.getElementById(panelId) : null;
      if (!panel || panel.closest('[data-ciata-accordion]') !== root) return;

      const expanded = button.getAttribute('aria-expanded') === 'true';
      button.setAttribute('aria-expanded', expanded ? 'false' : 'true');
      panel.hidden = expanded;
    });
  });
}
