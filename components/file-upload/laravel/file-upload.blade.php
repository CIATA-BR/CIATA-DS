@props([
    'id',
    'label',
    'name',
    'accept' => null,
    'multiple' => false,
    'required' => false,
    'disabled' => false,
    'helperText' => null,
    'errorText' => null,
])

<div class="ciata-file-upload">
    <label for="{{ $id }}">{{ $label }}</label>
    <input
        id="{{ $id }}"
        name="{{ $name }}{{ $multiple ? '[]' : '' }}"
        type="file"
        @if($accept) accept="{{ $accept }}" @endif
        @if($multiple) multiple @endif
        @required($required)
        @disabled($disabled)
        @if($helperText || $errorText) aria-describedby="{{ $id }}-description" @endif
        @if($errorText) aria-invalid="true" @endif
    >
    @if($helperText || $errorText)
        <div id="{{ $id }}-description" class="ciata-file-upload__description">
            {{ $errorText ?: $helperText }}
        </div>
    @endif
</div>
