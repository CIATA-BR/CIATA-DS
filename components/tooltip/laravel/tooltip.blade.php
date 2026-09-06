@props([
    'id',
    'text',
    'describe' => false,
])

@php
    $id = trim((string) $id);
    $text = trim((string) $text);
    $describe = (bool) $describe;

    if ($id === '') {
        throw new InvalidArgumentException('id não pode ser vazio.');
    }
    if ($text === '') {
        throw new InvalidArgumentException('text não pode ser vazio.');
    }
@endphp

<span
    class="ciata-tooltip"
    data-ciata-tooltip
    data-ciata-tooltip-describe="{{ $describe ? 'true' : 'false' }}"
>
    <span class="ciata-tooltip__trigger">
        {{ $trigger }}
    </span>
    <span id="{{ $id }}" class="ciata-tooltip__bubble" role="tooltip" hidden>
        {{ $text }}
    </span>
</span>
