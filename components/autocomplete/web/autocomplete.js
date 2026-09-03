export function initCiataAutocomplete(root) {
  const input = root.querySelector('[role="combobox"]');
  const listbox = root.querySelector('[role="listbox"]');
  if (!input || !listbox) return;

  const options = Array.from(listbox.querySelectorAll('[role="option"]'));
  let activeIndex = -1;

  const setActive = (index) => {
    options.forEach((option, current) => {
      option.setAttribute('aria-selected', current === index ? 'true' : 'false');
    });
    activeIndex = index;
    if (index >= 0) input.setAttribute('aria-activedescendant', options[index].id);
    else input.removeAttribute('aria-activedescendant');
  };

  const open = () => {
    if (!options.length) return;
    listbox.hidden = false;
    input.setAttribute('aria-expanded', 'true');
  };

  const close = () => {
    listbox.hidden = true;
    input.setAttribute('aria-expanded', 'false');
    setActive(-1);
  };

  const choose = (option) => {
    input.value = option.dataset.value ?? option.textContent.trim();
    input.dispatchEvent(new Event('change', { bubbles: true }));
    close();
    input.focus();
  };

  input.addEventListener('input', () => {
    if (input.value.trim() && options.length) open();
    else close();
  });

  input.addEventListener('keydown', (event) => {
    if (event.key === 'ArrowDown') {
      event.preventDefault();
      open();
      setActive((activeIndex + 1 + options.length) % options.length);
    } else if (event.key === 'ArrowUp') {
      event.preventDefault();
      open();
      setActive((activeIndex - 1 + options.length) % options.length);
    } else if (event.key === 'Enter' && activeIndex >= 0) {
      event.preventDefault();
      choose(options[activeIndex]);
    } else if (event.key === 'Escape' && !listbox.hidden) {
      event.preventDefault();
      close();
    }
  });

  options.forEach((option) => {
    option.addEventListener('mousedown', (event) => event.preventDefault());
    option.addEventListener('click', () => choose(option));
  });

  input.addEventListener('blur', () => requestAnimationFrame(() => {
    if (!root.contains(document.activeElement)) close();
  }));
}
