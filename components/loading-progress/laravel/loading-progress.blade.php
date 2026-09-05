@props([
    'label',
    'mode' => 'indeterminate',
    'value' => null,
    'min' => 0,
    'max' => 100,
    'showValue' => false,
])

@php
    $label = trim((string) $label);
    $mode = trim((string) $mode);

    if ($label === '') {
        throw new InvalidArgumentException('label não pode ser vazio.');
    }
    if (! in_array($mode, ['indeterminate', 'determinate'], true)) {
        throw new InvalidArgumentException('mode deve ser indeterminate ou determinate.');
    }
    if (! is_numeric($min) || ! is_numeric($max)) {
        throw new InvalidArgumentException('min e max devem ser numéricos.');
    }

    $min = (float) $min;
    $max = (float) $max;
    $determinate = $mode === 'determinate';

    if ($determinate && $max <= $min) {
        throw new InvalidArgumentException('max deve ser maior que min no modo determinate.');
    }
    if ($determinate && $value !== null && ! is_numeric($value)) {
        throw new InvalidArgumentException('value deve ser numérico quando informado.');
    }

    $safeValue = $determinate
        ? max($min, min($max, $value === null ? $min : (float) $value))
        : null;
    $percent = $determinate
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
