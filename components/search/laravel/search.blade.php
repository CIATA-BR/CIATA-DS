@props([
    'id',
    'label',
    'name' => 'q',
    'value' => '',
    'placeholder' => null,
    'disabled' => false,
    'readonly' => false,
    'statusText' => null,
    'errorText' => null,
    'submitLabel' => 'Buscar',
    'landmarkLabel' => null,
])

@php
    $id = trim((string) $id);
    $label = trim((string) $label);
    $name = trim((string) $name);
    $submitLabel = trim((string) $submitLabel);
    $value = (string) $value;
    $placeholder = $placeholder !== null ? trim((string) $placeholder) : null;
    $statusText = $statusText !== null ? trim((string) $statusText) : null;
    $errorText = $errorText !== null ? trim((string) $errorText) : null;
    $landmarkLabel = $landmarkLabel !== null ? trim((string) $landmarkLabel) : null;
    $disabled = (bool) $disabled;
    $readonly = (bool) $readonly;

    if ($id === '' || $label === '' || $name === '' || $submitLabel === '') {
        throw new InvalidArgumentException('id, label, name e submitLabel não podem ser vazios.');
    }
    if ($placeholder === '') {
        $placeholder = null;
    }
    if ($statusText === '') {
        $statusText = null;
    }
    if ($errorText === '') {
        $errorText = null;
    }
    if ($landmarkLabel === '') {
        $landmarkLabel = null;
    }
@endphp

<form
    role="search"
    class="ciata-search"
    method="get"
    @if($landmarkLabel) aria-label="{{ $landmarkLabel }}" @endif
>
    <label for="{{ $id }}">{{ $label }}</label>
    <div class="ciata-search__controls">
        <input
            id="{{ $id }}"
            name="{{ $name }}"
            type="search"
            value="{{ $value }}"
            @if($placeholder) placeholder="{{ $placeholder }}" @endif
            @disabled($disabled)
            @readonly($readonly)
            @if($errorText) aria-invalid="true" aria-describedby="{{ $id }}-error" @endif
        >
        <button type="submit" @disabled($disabled || $readonly)>{{ $submitLabel }}</button>
    </div>
    @if($errorText)
        <div id="{{ $id }}-error">{{ $errorText }}</div>
    @endif
    @if($statusText)
        <p class="ciata-search__status" role="status">{{ $statusText }}</p>
    @endif
</form>
