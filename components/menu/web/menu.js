export function initCiataMenu(root) {
  const trigger = root.querySelector('.ciata-menu__trigger');
  const popup = root.querySelector('[role="menu"]');
  if (!trigger || !popup) return;

  const items = () => Array.from(popup.querySelectorAll('[role="menuitem"]')).filter((item) => !item.disabled);

  const close = (restoreFocus = true) => {
    popup.hidden = true;
    trigger.setAttribute('aria-expanded', 'false');
    if (restoreFocus) trigger.focus();
  };

  const open = () => {
    popup.hidden = false;
    trigger.setAttribute('aria-expanded', 'true');
    items()[0]?.focus();
  };

  trigger.addEventListener('click', () => popup.hidden ? open() : close());

  popup.addEventListener('keydown', (event) => {
    const enabled = items();
    const current = enabled.indexOf(document.activeElement);
    if (event.key === 'Escape') {
      event.preventDefault();
      close();
      return;
    }
    if (!['ArrowDown', 'ArrowUp', 'Home', 'End'].includes(event.key) || !enabled.length) return;
    event.preventDefault();
    let next = current;
    if (event.key === 'ArrowDown') next = (current + 1 + enabled.length) % enabled.length;
    else if (event.key === 'ArrowUp') next = (current - 1 + enabled.length) % enabled.length;
    else if (event.key === 'Home') next = 0;
    else if (event.key === 'End') next = enabled.length - 1;
    enabled[next]?.focus();
  });

  document.addEventListener('pointerdown', (event) => {
    if (!popup.hidden && !root.contains(event.target)) close(false);
  });
}
