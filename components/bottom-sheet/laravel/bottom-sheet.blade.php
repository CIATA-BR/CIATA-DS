@props([
    'id',
    'title',
    'titleLevel' => 2,
    'triggerLabel' => 'Abrir',
])

@php($titleLevel = max(1, min(6, (int) $titleLevel)))

<div class="ciata-bottom-sheet" data-ciata-bottom-sheet>
    <button type="button" class="ciata-bottom-sheet__trigger" aria-haspopup="dialog" aria-controls="{{ $id }}">
        {{ $triggerLabel }}
    </button>

    <dialog id="{{ $id }}" class="ciata-bottom-sheet__dialog" aria-labelledby="{{ $id }}-title">
        <section class="ciata-bottom-sheet__surface">
            <header class="ciata-bottom-sheet__header">
                <h{{ $titleLevel }} id="{{ $id }}-title" tabindex="-1">{{ $title }}</h{{ $titleLevel }}>
                <button type="button" class="ciata-bottom-sheet__close">Fechar</button>
            </header>
            <div class="ciata-bottom-sheet__content">{{ $slot }}</div>
        </section>
    </dialog>
</div>
