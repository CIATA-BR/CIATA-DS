export function setCiataButtonLoading(button, loading, options = {}) {
  if (!(button instanceof HTMLButtonElement)) {
    throw new TypeError('setCiataButtonLoading exige um HTMLButtonElement.');
  }

  const { loadingLabel = 'Processando' } = options;

  if (loading) {
    if (!button.dataset.ciataOriginalLabel) {
      button.dataset.ciataOriginalLabel = button.textContent.trim();
    }

    button.setAttribute('aria-busy', 'true');
    button.disabled = true;
    button.dataset.ciataLoading = 'true';

    const status = button.querySelector('[data-ciata-button-status]');
    if (status) {
      status.textContent = loadingLabel;
    }

    return;
  }

  button.removeAttribute('aria-busy');
  button.disabled = false;
  delete button.dataset.ciataLoading;

  const status = button.querySelector('[data-ciata-button-status]');
  if (status) {
    status.textContent = '';
  }
}
