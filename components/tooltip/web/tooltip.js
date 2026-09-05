export function initCiataTooltip(root) {
  const triggerHost = root.querySelector('.ciata-tooltip__trigger');
  const tooltip = root.querySelector('[role="tooltip"]');
  if (!triggerHost || !tooltip) return;

  const focusable = triggerHost.matches('button, a, input, select, textarea, [tabindex]')
    ? triggerHost
    : triggerHost.querySelector('button, a[href], input, select, textarea, [tabindex]:not([tabindex="-1"])');

  const shouldDescribe = root.dataset.ciataTooltipDescribe === 'true';
  if (focusable && shouldDescribe) focusable.setAttribute('aria-describedby', tooltip.id);

  const show = () => { tooltip.hidden = false; };
  const hide = () => { tooltip.hidden = true; };

  triggerHost.addEventListener('mouseenter', show);
  triggerHost.addEventListener('mouseleave', (event) => {
    if (!tooltip.contains(event.relatedTarget)) hide();
  });
  tooltip.addEventListener('mouseenter', show);
  tooltip.addEventListener('mouseleave', hide);
  triggerHost.addEventListener('focusin', show);
  triggerHost.addEventListener('focusout', (event) => {
    if (!triggerHost.contains(event.relatedTarget)) hide();
  });
  triggerHost.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && !tooltip.hidden) {
      event.preventDefault();
      hide();
    }
  });
}
