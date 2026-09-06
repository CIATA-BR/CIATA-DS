@props([
    'id',
    'items',
    'expanded' => [],
    'labelLevel' => 3,
])

@php
    $normalizedId = trim((string) $id);
    $normalizedItems = collect($items)->values()->map(function ($item) {
        if (!is_array($item) || !array_key_exists('label', $item) || !array_key_exists('content', $item)) {
            throw new InvalidArgumentException('Cada item deve conter label e content.');
        }

        $item['label'] = trim((string) $item['label']);
        if ($item['label'] === '') {
            throw new InvalidArgumentException('Rótulos do Accordion não podem ser vazios.');
        }

        return $item;
    });
    $normalizedExpanded = array_values($expanded);
    $labelLevel = max(1, min(6, (int) $labelLevel));

    if ($normalizedId === '') {
        throw new InvalidArgumentException('id não pode ser vazio.');
    }
    if ($normalizedItems->isEmpty()) {
        throw new InvalidArgumentException('items não pode ser vazio.');
    }
    foreach ($normalizedExpanded as $index) {
        if (!is_int($index) || !$normalizedItems->has($index)) {
            throw new InvalidArgumentException('expanded contém índice inválido.');
        }
    }
@endphp

<div class="ciata-accordion" data-ciata-accordion>
    @foreach($normalizedItems as $index => $item)
        @php($isExpanded = in_array($index, $normalizedExpanded, true))
        <section class="ciata-accordion__item">
            <h{{ $labelLevel }} class="ciata-accordion__heading">
                <button
                    type="button"
                    id="{{ $normalizedId }}-trigger-{{ $index }}"
                    class="ciata-accordion__button"
                    aria-expanded="{{ $isExpanded ? 'true' : 'false' }}"
                    aria-controls="{{ $normalizedId }}-panel-{{ $index }}"
                >{{ $item['label'] }}</button>
            </h{{ $labelLevel }}>
            <div
                id="{{ $normalizedId }}-panel-{{ $index }}"
                class="ciata-accordion__panel"
                aria-labelledby="{{ $normalizedId }}-trigger-{{ $index }}"
                @unless($isExpanded) hidden @endunless
            >{{ $item['content'] }}</div>
        </section>
    @endforeach
</div>
