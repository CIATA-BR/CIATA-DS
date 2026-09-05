@props([
    'id',
    'items',
    'expanded' => [],
    'labelLevel' => 3,
])

@php($labelLevel = max(1, min(6, (int) $labelLevel)))

<div class="ciata-accordion" data-ciata-accordion>
    @foreach($items as $index => $item)
        @php($isExpanded = in_array($index, $expanded, true))
        <section class="ciata-accordion__item">
            <h{{ $labelLevel }} class="ciata-accordion__heading">
                <button
                    type="button"
                    id="{{ $id }}-trigger-{{ $index }}"
                    class="ciata-accordion__button"
                    aria-expanded="{{ $isExpanded ? 'true' : 'false' }}"
                    aria-controls="{{ $id }}-panel-{{ $index }}"
                >{{ $item['label'] }}</button>
            </h{{ $labelLevel }}>
            <div
                id="{{ $id }}-panel-{{ $index }}"
                class="ciata-accordion__panel"
                aria-labelledby="{{ $id }}-trigger-{{ $index }}"
                @unless($isExpanded) hidden @endunless
            >{{ $item['content'] }}</div>
        </section>
    @endforeach
</div>
