@props([
    'id',
    'text',
    'describe' => false,
])

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
