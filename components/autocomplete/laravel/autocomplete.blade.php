@props([
    'id',
    'label',
    'name',
    'value' => '',
    'options' => [],
    'disabled' => false,
    'readonly' => false,
])

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
        autocomplete="off"
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
