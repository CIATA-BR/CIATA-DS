@props([
    'type' => 'button',
    'variant' => 'primary',
    'disabled' => false,
    'loading' => false,
    'loadingLabel' => 'Processando',
])

@php
    $variants = ['primary', 'secondary', 'danger', 'ghost'];
    $safeVariant = in_array($variant, $variants, true) ? $variant : 'primary';

    $classes = collect([
        'ciata-button',
        $safeVariant !== 'primary' ? "ciata-button--{$safeVariant}" : null,
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
