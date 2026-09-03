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
