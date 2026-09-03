@props([
    'items',
    'expanded' => [],
    'labelLevel' => 3,
])

<div class="ciata-accordion" data-ciata-accordion>
    @foreach($items as $index => $item)
        @php($isExpanded = in_array($index, $expanded, true))
        <section class="ciata-accordion__item">
            <h{{ $labelLevel }} class="ciata-accordion__heading">
                <button
                    type="button"
                    id="accordion-trigger-{{ $index }}"
                    class="ciata-accordion__button"
                    aria-expanded="{{ $isExpanded ? 'true' : 'false' }}"
                    aria-controls="accordion-panel-{{ $index }}"
                >{{ $item['label'] }}</button>
            </h{{ $labelLevel }}>
            <div
                id="accordion-panel-{{ $index }}"
                class="ciata-accordion__panel"
                aria-labelledby="accordion-trigger-{{ $index }}"
                @unless($isExpanded) hidden @endunless
            >{{ $item['content'] }}</div>
        </section>
    @endforeach
</div>
