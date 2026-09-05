@props([
    'name',
    'legend',
    'options' => [],
    'selected' => null,
    'help' => null,
    'error' => null,
    'required' => false,
    'disabled' => false,
])

@php
    $name = trim((string) $name);
    $legend = trim((string) $legend);
    $groupId = trim((string) $attributes->get('id', "{$name}-group"));

    if ($name === '' || $legend === '' || $groupId === '') {
        throw new InvalidArgumentException('name, legend e id do grupo não podem ser vazios.');
    }

    $normalizedOptions = collect($options)->map(function ($option) {
        $value = is_array($option) ? ($option['value'] ?? null) : ($option->value ?? null);
        $label = is_array($option) ? ($option['label'] ?? null) : ($option->label ?? null);
        $optionDisabled = is_array($option)
            ? ($option['disabled'] ?? false)
            : ($option->disabled ?? false);

        return [
            'value' => $value,
            'label' => trim((string) $label),
            'disabled' => (bool) $optionDisabled,
        ];
    });

    if ($normalizedOptions->count() < 2) {
        throw new InvalidArgumentException('Radio Group deve possuir ao menos duas opções.');
    }
    if ($normalizedOptions->contains(fn ($option) => $option['label'] === '')) {
        throw new InvalidArgumentException('Rótulos das opções não podem ser vazios.');
    }
    if ($normalizedOptions->pluck('value')->map(fn ($value) => (string) $value)->duplicates()->isNotEmpty()) {
        throw new InvalidArgumentException('Valores das opções devem ser únicos.');
    }

    $helpId = $help ? "{$groupId}-help" : null;
    $errorId = $error ? "{$groupId}-error" : null;
    $describedBy = collect([$helpId, $errorId])->filter()->implode(' ');
    $current = old($name, $selected);

    if ($current !== null && ! $normalizedOptions->contains(fn ($option) => (string) $option['value'] === (string) $current)) {
        throw new InvalidArgumentException('selected não pertence às opções do grupo.');
    }
@endphp

<fieldset
    id="{{ $groupId }}"
    class="ciata-radio-group"
    @if($describedBy) aria-describedby="{{ $describedBy }}" @endif
    @if($error) aria-invalid="true" @endif
>
    <legend class="ciata-radio-group__legend">
        {{ $legend }}
        @if($required)
            <span class="ciata-radio-group__required">(obrigatório)</span>
        @endif
    </legend>

    @foreach($normalizedOptions as $option)
        @php
            $value = $option['value'];
            $label = $option['label'];
            $optionDisabled = $option['disabled'];
            $id = "{$groupId}-" . $loop->index;
        @endphp

        <div class="ciata-radio-group__option">
            <input
                id="{{ $id }}"
                name="{{ $name }}"
                type="radio"
                value="{{ $value }}"
                class="ciata-radio-group__control"
                @checked((string) $current === (string) $value)
                @if($required) required @endif
                @if($disabled || $optionDisabled) disabled @endif
            >
            <label class="ciata-radio-group__label" for="{{ $id }}">{{ $label }}</label>
        </div>
    @endforeach

    @if($help)
        <div id="{{ $helpId }}" class="ciata-radio-group__help">{{ $help }}</div>
    @endif

    @if($error)
        <div id="{{ $errorId }}" class="ciata-radio-group__error">{{ $error }}</div>
    @endif
</fieldset>
