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
    $groupId = $attributes->get('id', "{$name}-group");
    $helpId = $help ? "{$groupId}-help" : null;
    $errorId = $error ? "{$groupId}-error" : null;
    $describedBy = collect([$helpId, $errorId])->filter()->implode(' ');
    $current = old($name, $selected);
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

    @foreach($options as $option)
        @php
            $value = is_array($option) ? $option['value'] : $option->value;
            $label = is_array($option) ? $option['label'] : $option->label;
            $optionDisabled = is_array($option)
                ? ($option['disabled'] ?? false)
                : ($option->disabled ?? false);
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
