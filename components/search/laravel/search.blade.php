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
])

<form role="search" class="ciata-search" method="get">
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
        <button type="submit">Buscar</button>
    </div>
    @if($errorText)
        <div id="{{ $id }}-error">{{ $errorText }}</div>
    @endif
    @if($statusText)
        <p class="ciata-search__status" role="status">{{ $statusText }}</p>
    @endif
</form>
