@props([
    'id',
    'title',
    'titleLevel' => 2,
    'triggerLabel' => 'Abrir',
    'closeLabel' => 'Fechar',
])

@php
    $id = trim((string) $id);
    $title = trim((string) $title);
    $triggerLabel = trim((string) $triggerLabel);
    $closeLabel = trim((string) $closeLabel);
    $titleLevel = (int) $titleLevel;

    if ($id === '') {
        throw new InvalidArgumentException('id não pode ser vazio.');
    }
    if ($title === '') {
        throw new InvalidArgumentException('title não pode ser vazio.');
    }
    if ($triggerLabel === '') {
        throw new InvalidArgumentException('triggerLabel não pode ser vazio.');
    }
    if ($closeLabel === '') {
        throw new InvalidArgumentException('closeLabel não pode ser vazio.');
    }
    if ($titleLevel < 1 || $titleLevel > 6) {
        throw new InvalidArgumentException('titleLevel deve estar entre 1 e 6.');
    }
@endphp

<div class="ciata-bottom-sheet" data-ciata-bottom-sheet>
    <button type="button" class="ciata-bottom-sheet__trigger" aria-haspopup="dialog" aria-controls="{{ $id }}">
        {{ $triggerLabel }}
    </button>

    <dialog id="{{ $id }}" class="ciata-bottom-sheet__dialog" aria-labelledby="{{ $id }}-title">
        <section class="ciata-bottom-sheet__surface">
            <header class="ciata-bottom-sheet__header">
                <h{{ $titleLevel }} id="{{ $id }}-title" tabindex="-1">{{ $title }}</h{{ $titleLevel }}>
                <button type="button" class="ciata-bottom-sheet__close">{{ $closeLabel }}</button>
            </header>
            <div class="ciata-bottom-sheet__content">{{ $slot }}</div>
        </section>
    </dialog>
</div>
