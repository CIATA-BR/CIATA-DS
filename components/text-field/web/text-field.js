export function setCiataFieldError(input, message, options = {}) {
  if (!(input instanceof HTMLInputElement || input instanceof HTMLTextAreaElement)) {
    throw new TypeError('setCiataFieldError exige um input ou textarea.');
  }

  const { errorElement, announce = false } = options;

  if (!errorElement) {
    throw new TypeError('errorElement é obrigatório.');
  }

  if (message) {
    input.setAttribute('aria-invalid', 'true');
    if (errorElement.id) {
      input.setAttribute('aria-errormessage', errorElement.id);
      const ids = new Set((input.getAttribute('aria-describedby') || '').split(/\s+/).filter(Boolean));
      ids.add(errorElement.id);
      input.setAttribute('aria-describedby', [...ids].join(' '));
    }
    errorElement.textContent = message;
    if (announce) {
      errorElement.setAttribute('role', 'alert');
    } else {
      errorElement.removeAttribute('role');
    }
    return;
  }

  input.removeAttribute('aria-invalid');
  input.removeAttribute('aria-errormessage');
  errorElement.textContent = '';
  errorElement.removeAttribute('role');
}

export function bindCiataPasswordToggle(button, input) {
  if (!(button instanceof HTMLButtonElement) || !(input instanceof HTMLInputElement)) {
    throw new TypeError('bindCiataPasswordToggle exige button e input.');
  }

  if (input.type !== 'password' && input.type !== 'text') {
    throw new TypeError('O campo deve ser do tipo password ou text.');
  }

  button.addEventListener('click', () => {
    const showing = input.type === 'text';
    input.type = showing ? 'password' : 'text';
    button.setAttribute('aria-pressed', String(!showing));
    button.textContent = showing ? 'Mostrar senha' : 'Ocultar senha';
    input.focus({ preventScroll: true });
  });
}
