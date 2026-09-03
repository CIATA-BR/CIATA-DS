@props([
    'label',
    'mode' => 'indeterminate',
    'value' => null,
    'min' => 0,
    'max' => 100,
    'showValue' => false,
])

@php
    $determinate = $mode === 'determinate';
    $safeValue = $determinate ? max($min, min($max, $value ?? $min)) : null;
    $percent = $determinate && $max > $min
        ? (($safeValue - $min) / ($max - $min)) * 100
        : null;
@endphp

<div class="ciata-progress" data-mode="{{ $mode }}" {{ $attributes }}>
    <div class="ciata-progress__label">{{ $label }}</div>
    <div
        class="ciata-progress__track"
        role="progressbar"
        aria-label="{{ $label }}"
        @if($determinate)
            aria-valuemin="{{ $min }}"
            aria-valuemax="{{ $max }}"
            aria-valuenow="{{ $safeValue }}"
        @endif
    >
        <div
            class="ciata-progress__value"
            @if($determinate) style="--ciata-progress-value: {{ $percent }}%" @endif
            aria-hidden="true"
        ></div>
    </div>
    @if($showValue && $determinate)
        <div class="ciata-progress__text">{{ round($percent) }}%</div>
    @endif
</div>
