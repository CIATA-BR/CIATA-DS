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
    $helpId = $help ? "{$id}-help" : null;
    $errorId = $error ? "{$id}-error" : null;
    $describedBy = collect([$helpId, $errorId])->filter()->implode(' ');
    $current = old($name, $selected);
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
        @if($placeholder)
            <option value="" @selected($current === null || $current === '') @if($required) disabled @endif>
                {{ $placeholder }}
            </option>
        @endif

        @foreach($options as $option)
            @php
                $value = is_array($option) ? $option['value'] : $option->value;
                $text = is_array($option) ? $option['label'] : $option->label;
                $optionDisabled = is_array($option)
                    ? ($option['disabled'] ?? false)
                    : ($option->disabled ?? false);
            @endphp
            <option
                value="{{ $value }}"
                @selected((string) $current === (string) $value)
                @if($optionDisabled) disabled @endif
            >{{ $text }}</option>
        @endforeach
    </select>

    @if($help)
        <div id="{{ $helpId }}" class="ciata-select__help">{{ $help }}</div>
    @endif

    @if($error)
        <div id="{{ $errorId }}" class="ciata-select__error">{{ $error }}</div>
    @endif
</div>
