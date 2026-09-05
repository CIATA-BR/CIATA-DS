@props([
    'id',
    'label',
    'name',
    'value' => null,
    'min' => null,
    'max' => null,
    'required' => false,
    'disabled' => false,
    'readonly' => false,
    'helperText' => null,
    'errorText' => null,
])

@php
    $id = trim((string) $id);
    $label = trim((string) $label);
    $name = trim((string) $name);

    if ($id === '' || $label === '' || $name === '') {
        throw new InvalidArgumentException('id, label e name não podem ser vazios.');
    }
    if ($min && $max && $min > $max) {
        throw new InvalidArgumentException('min deve ser anterior ou igual a max.');
    }
    if ($value && (($min && $value < $min) || ($max && $value > $max))) {
        throw new InvalidArgumentException('value deve estar dentro do intervalo permitido.');
    }
@endphp

<div class="ciata-date-picker">
    <label for="{{ $id }}">{{ $label }}</label>
    <input
        id="{{ $id }}"
        name="{{ $name }}"
        type="date"
        value="{{ $value }}"
        @if($min) min="{{ $min }}" @endif
        @if($max) max="{{ $max }}" @endif
        @required($required)
        @disabled($disabled)
        @readonly($readonly)
        @if($helperText || $errorText) aria-describedby="{{ $id }}-description" @endif
        @if($errorText) aria-invalid="true" @endif
    >
    @if($helperText || $errorText)
        <div id="{{ $id }}-description" class="ciata-date-picker__description">
            {{ $errorText ?: $helperText }}
        </div>
    @endif
</div>
