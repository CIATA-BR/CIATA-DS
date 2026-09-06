@props([
    'id',
    'label',
    'name',
    'value' => '',
    'options' => [],
    'disabled' => false,
    'readonly' => false,
    'browserAutocomplete' => 'off',
])

@php
    $id = trim((string) $id);
    $label = trim((string) $label);
    $name = trim((string) $name);
    $value = (string) $value;
    $browserAutocomplete = trim((string) $browserAutocomplete);
    $disabled = (bool) $disabled;
    $readonly = (bool) $readonly;
    $options = collect($options)->map(fn ($option) => trim((string) $option))->values();

    if ($id === '' || $label === '' || $name === '' || $browserAutocomplete === '') {
        throw new InvalidArgumentException('id, label, name e browserAutocomplete não podem ser vazios.');
    }
    if ($options->contains(fn ($option) => $option === '')) {
        throw new InvalidArgumentException('options não pode conter rótulos vazios.');
    }
    if ($options->duplicates()->isNotEmpty()) {
        throw new InvalidArgumentException('options não pode conter rótulos duplicados.');
    }
@endphp

<div class="ciata-autocomplete" data-ciata-autocomplete>
    <label for="{{ $id }}">{{ $label }}</label>
    <input
        id="{{ $id }}"
        name="{{ $name }}"
        type="text"
        role="combobox"
        aria-autocomplete="list"
        aria-expanded="false"
        aria-controls="{{ $id }}-listbox"
        autocomplete="{{ $browserAutocomplete }}"
        value="{{ $value }}"
        @disabled($disabled)
        @readonly($readonly)
    >
    <ul id="{{ $id }}-listbox" role="listbox" class="ciata-autocomplete__list" hidden>
        @foreach($options as $index => $option)
            <li id="{{ $id }}-option-{{ $index }}" role="option" data-value="{{ $option }}">{{ $option }}</li>
        @endforeach
    </ul>
</div>
