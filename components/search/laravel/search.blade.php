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
    $landmarkLabel = $landmarkLabel !== null ? trim((string) $landmarkLabel) : null;

    if ($id === '' || $label === '' || $name === '' || $submitLabel === '') {
        throw new InvalidArgumentException('id, label, name e submitLabel não podem ser vazios.');
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
