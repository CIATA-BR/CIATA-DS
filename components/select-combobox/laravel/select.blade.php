@props([
    'id',
    'name',
    'label',
    'options' => [],
    'selected' => null,
    'placeholder' => null,
    'help' => null,
    'error' => null,
    'required' => false,
    'disabled' => false,
    'optionalLabel' => null,
])

@php
    $id = trim((string) $id);
    $name = trim((string) $name);
    $label = trim((string) $label);
    $placeholder = $placeholder === null ? null : trim((string) $placeholder);

    if ($id === '' || $name === '' || $label === '') {
        throw new InvalidArgumentException('id, name e label não podem ser vazios.');
    }

    $normalizedOptions = collect($options)->map(function ($option) {
        $value = is_array($option) ? ($option['value'] ?? null) : ($option->value ?? null);
        $text = is_array($option) ? ($option['label'] ?? null) : ($option->label ?? null);
        $optionDisabled = is_array($option)
            ? ($option['disabled'] ?? false)
            : ($option->disabled ?? false);

        return [
            'value' => $value,
            'label' => trim((string) $text),
            'disabled' => (bool) $optionDisabled,
        ];
    });

    if ($normalizedOptions->isEmpty()) {
        throw new InvalidArgumentException('options não pode ser vazio.');
    }
    if ($normalizedOptions->contains(fn ($option) => $option['label'] === '')) {
        throw new InvalidArgumentException('Rótulos das opções não podem ser vazios.');
    }
    if ($normalizedOptions->pluck('value')->map(fn ($value) => (string) $value)->duplicates()->isNotEmpty()) {
        throw new InvalidArgumentException('Valores das opções devem ser únicos.');
    }
    if ($placeholder !== null && $placeholder === '') {
        throw new InvalidArgumentException('placeholder não pode ser vazio quando informado.');
    }

    $helpId = $help ? "{$id}-help" : null;
    $errorId = $error ? "{$id}-error" : null;
    $describedBy = collect([$helpId, $errorId])->filter()->implode(' ');
    $current = old($name, $selected);

    if ($current !== null && $current !== '' && ! $normalizedOptions->contains(fn ($option) => (string) $option['value'] === (string) $current)) {
        throw new InvalidArgumentException('selected não pertence às opções do Select.');
    }
@endphp

<div class="ciata-select">
    <label class="ciata-select__label" for="{{ $id }}">
        {{ $label }}
        @if($required)
            <span class="ciata-select__required">(obrigatório)</span>
        @elseif($optionalLabel)
            <span class="ciata-select__optional">({{ $optionalLabel }})</span>
        @endif
    </label>

    <select
        id="{{ $id }}"
        name="{{ $name }}"
        class="ciata-select__control"
        @if($required) required @endif
        @if($disabled) disabled @endif
        @if($describedBy) aria-describedby="{{ $describedBy }}" @endif
        @if($error) aria-invalid="true" aria-errormessage="{{ $errorId }}" @endif
        {{ $attributes->except(['class']) }}
    >
        @if($placeholder !== null)
            <option value="" @selected($current === null || $current === '') @if($required) disabled @endif>
                {{ $placeholder }}
            </option>
        @endif

        @foreach($normalizedOptions as $option)
            <option
                value="{{ $option['value'] }}"
                @selected((string) $current === (string) $option['value'])
                @if($option['disabled']) disabled @endif
            >{{ $option['label'] }}</option>
        @endforeach
    </select>

    @if($help)
        <div id="{{ $helpId }}" class="ciata-select__help">{{ $help }}</div>
    @endif

    @if($error)
        <div id="{{ $errorId }}" class="ciata-select__error">{{ $error }}</div>
    @endif
</div>
