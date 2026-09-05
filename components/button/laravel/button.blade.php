@props([
    'type' => 'button',
    'variant' => 'primary',
    'disabled' => false,
    'loading' => false,
    'loadingLabel' => 'Processando',
])

@php
    $types = ['button', 'submit', 'reset'];
    $variants = ['primary', 'secondary', 'danger', 'ghost'];
    $type = trim((string) $type);
    $variant = trim((string) $variant);
    $loadingLabel = trim((string) $loadingLabel);

    if (! in_array($type, $types, true)) {
        throw new InvalidArgumentException("type deve ser 'button', 'submit' ou 'reset'.");
    }
    if (! in_array($variant, $variants, true)) {
        throw new InvalidArgumentException("variant deve ser 'primary', 'secondary', 'danger' ou 'ghost'.");
    }
    if ($loadingLabel === '') {
        throw new InvalidArgumentException('loadingLabel não pode ser vazio.');
    }

    $classes = collect([
        'ciata-button',
        $variant !== 'primary' ? "ciata-button--{$variant}" : null,
    ])->filter()->implode(' ');
@endphp

<button
    type="{{ $type }}"
    {{ $attributes->class($classes) }}
    @disabled($disabled)
    @if($loading) aria-busy="true" aria-disabled="true" data-ciata-loading="true" @endif
>
    <span data-ciata-button-label>{{ $slot }}</span>

    <span
        class="ciata-visually-hidden"
        data-ciata-button-status
        aria-live="polite"
        aria-atomic="true"
    >@if($loading){{ $loadingLabel }}@endif</span>
</button>
