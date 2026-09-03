export function initCiataBottomSheet(root) {
  const trigger = root.querySelector('.ciata-bottom-sheet__trigger');
  const dialog = root.querySelector('.ciata-bottom-sheet__dialog');
  const closeButton = root.querySelector('.ciata-bottom-sheet__close');
  const title = dialog?.querySelector('[tabindex="-1"]');
  if (!trigger || !dialog || !closeButton) return;

  let opener = null;

  const close = () => {
    if (dialog.open) dialog.close();
  };

  trigger.addEventListener('click', () => {
    opener = trigger;
    dialog.showModal();
    requestAnimationFrame(() => title?.focus());
  });

  closeButton.addEventListener('click', close);

  dialog.addEventListener('cancel', () => {
    opener = trigger;
  });

  dialog.addEventListener('close', () => {
    if (opener?.isConnected) opener.focus();
    opener = null;
  });
}
