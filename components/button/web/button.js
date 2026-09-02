function isCiataButtonLoading(button) {
  return button.dataset.ciataLoading === 'true';
}

function blockRepeatedActivation(event) {
  const button = event.currentTarget;

  if (isCiataButtonLoading(button)) {
    event.preventDefault();
    event.stopImmediatePropagation();
  }
}

export function enhanceCiataButton(button) {
  if (!(button instanceof HTMLButtonElement)) {
    throw new TypeError('enhanceCiataButton exige um HTMLButtonElement.');
  }

  if (button.dataset.ciataEnhanced === 'true') {
    return button;
  }

  button.addEventListener('click', blockRepeatedActivation, true);
  button.dataset.ciataEnhanced = 'true';
  return button;
}

export function setCiataButtonLoading(button, loading, options = {}) {
  if (!(button instanceof HTMLButtonElement)) {
    throw new TypeError('setCiataButtonLoading exige um HTMLButtonElement.');
  }

  enhanceCiataButton(button);

  const { loadingLabel = 'Processando' } = options;
  const status = button.querySelector('[data-ciata-button-status]');

  if (loading) {
    button.setAttribute('aria-busy', 'true');
    button.setAttribute('aria-disabled', 'true');
    button.dataset.ciataLoading = 'true';

    if (status) {
      status.textContent = loadingLabel;
    }

    return;
  }

  button.removeAttribute('aria-busy');
  button.removeAttribute('aria-disabled');
  delete button.dataset.ciataLoading;

  if (status) {
    status.textContent = '';
  }
}

export function enhanceAllCiataButtons(root = document) {
  root.querySelectorAll('.ciata-button').forEach((button) => {
    if (button instanceof HTMLButtonElement) {
      enhanceCiataButton(button);
    }
  });
}
