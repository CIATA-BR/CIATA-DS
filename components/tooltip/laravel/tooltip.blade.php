@props([
    'text',
    'id' => 'ciata-tooltip',
])

<span class="ciata-tooltip" data-ciata-tooltip>
    <span class="ciata-tooltip__trigger" aria-describedby="{{ $id }}">
        {{ $trigger }}
    </span>
    <span id="{{ $id }}" class="ciata-tooltip__bubble" role="tooltip" hidden>
        {{ $text }}
    </span>
</span>
