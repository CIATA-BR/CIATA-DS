@props([
    'id',
    'name',
    'label',
    'value' => '1',
    'checked' => false,
    'help' => null,
    'error' => null,
    'required' => false,
    'disabled' => false,
])

@php
    $id = trim((string) $id);
    $name = trim((string) $name);
    $label = trim((string) $label);

    if ($id === '' || $name === '' || $label === '') {
        throw new InvalidArgumentException('id, name e label não podem ser vazios.');
    }

    $helpId = $help ? "{$id}-help" : null;
    $errorId = $error ? "{$id}-error" : null;
    $describedBy = collect([$helpId, $errorId])->filter()->implode(' ');
    $isChecked = old($name, $checked);
@endphp

<div class="ciata-checkbox">
    <div class="ciata-checkbox__control-row">
        <input
            id="{{ $id }}"
            name="{{ $name }}"
            type="checkbox"
            value="{{ $value }}"
            class="ciata-checkbox__control"
            @checked($isChecked)
            @if($required) required @endif
            @if($disabled) disabled @endif
            @if($describedBy) aria-describedby="{{ $describedBy }}" @endif
            @if($error) aria-invalid="true" aria-errormessage="{{ $errorId }}" @endif
            {{ $attributes->except(['class']) }}
        >
        <label class="ciata-checkbox__label" for="{{ $id }}">
            {{ $label }}
            @if($required)
                <span class="ciata-checkbox__required">(obrigatório)</span>
            @endif
        </label>
    </div>

    @if($help)
        <div id="{{ $helpId }}" class="ciata-checkbox__help">{{ $help }}</div>
    @endif

    @if($error)
        <div id="{{ $errorId }}" class="ciata-checkbox__error">{{ $error }}</div>
    @endif
</div>
